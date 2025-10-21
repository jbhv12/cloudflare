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
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}