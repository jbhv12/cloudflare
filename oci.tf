data "oci_identity_tenancy" "tenancy" {
  tenancy_id = var.tenancy_ocid
}
data "oci_identity_compartments" "compartments" {
  compartment_id = data.oci_identity_tenancy.tenancy.id
  access_level    = "ANY"
  compartment_id_in_subtree = true
}
data "oci_core_images" "ubuntu_latest" {
  compartment_id           = local.root_compartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04"
  shape                    = "VM.Standard3.Flex"

  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}
locals {
  root_compartment_ocid = data.oci_identity_tenancy.tenancy.id
}

resource "oci_core_virtual_network" "vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = local.root_compartment_ocid
  display_name   = "example-vcn"
}

resource "oci_core_subnet" "subnet" {
  cidr_block          = "10.0.1.0/24"
  compartment_id      = local.root_compartment_ocid
  vcn_id              = oci_core_virtual_network.vcn.id
  display_name        = "example-subnet"
  availability_domain = "AD-1"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_security_list" "sec_list" {
  compartment_id = local.root_compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "example-sec-list"

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_instance" "vm_instance" {
  compartment_id      = local.root_compartment_ocid
  availability_domain = "AD-1"
  shape               = "VM.Standard3.Flex"

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    assign_public_ip = true
    display_name     = "primary-vnic"
  }

  source_details {
    source_type = "image"
    source_id    = data.oci_core_images.ubuntu_latest.images[0].id
  }

  display_name = "example-instance"
}
