terraform {
  cloud {
    organization = "jbhv12"
    workspaces {
      name = "cloudflare-dns"
    }
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
    oci = {
      source  = "oracle/oci"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key = trimspace(base64decode(replace(var.private_key, "\r\n", "")))
  region           = var.region
}