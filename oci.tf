variable "ssh_public_key" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM1cPNrK+VUGznUjnAJVtj2yA4ChyuQYz/J42rVfAtKG jay@laptop"
}

data "oci_identity_tenancy" "tenancy" {
  tenancy_id = var.tenancy_ocid
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = data.oci_identity_tenancy.tenancy.id
}

locals {
  root_compartment_ocid = data.oci_identity_tenancy.tenancy.id
  ad1_name              = one([for ad in data.oci_identity_availability_domains.ads.availability_domains : ad.name if length(regexall("AD-1$", ad.name)) > 0])
}

data "oci_core_images" "ubuntu_latest" {
  compartment_id           = local.root_compartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04"
  shape                    = "VM.Standard.E2.1.Micro"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

resource "oci_core_virtual_network" "vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = local.root_compartment_ocid
  display_name   = "primary-vcn"
  dns_label      = "primaryvcn"
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = local.root_compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "primary-igw"
  enabled        = true
}

resource "oci_core_route_table" "rt" {
  compartment_id = local.root_compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "primary-rt"
  route_rules {
    network_entity_id = oci_core_internet_gateway.igw.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_security_list" "sec_list" {
  compartment_id = local.root_compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "primary-sec-list"

  ingress_security_rules {
    protocol    = "all"
    source = "0.0.0.0/0"
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_subnet" "subnet" {
  cidr_block                 = "10.0.1.0/24"
  compartment_id             = local.root_compartment_ocid
  vcn_id                     = oci_core_virtual_network.vcn.id
  display_name               = "primary-subnet"
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_route_table.rt.id
  security_list_ids          = [oci_core_security_list.sec_list.id]
  dns_label                  = "primarysubnet"
}

resource "oci_core_instance" "vm_instance" {
  compartment_id      = local.root_compartment_ocid
  availability_domain = local.ad1_name
  shape               = "VM.Standard.E2.1.Micro"

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    assign_public_ip = true
    display_name     = "primary-vnic"
  }

  source_details {
    source_type             = "image"
    source_id               = data.oci_core_images.ubuntu_latest.images[0].id
    boot_volume_size_in_gbs = 200
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  display_name = "primary-instance"
}
