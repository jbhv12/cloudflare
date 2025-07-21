terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

provider "cloudflare" {}

# resource "cloudflare_zone" "domain" {
#   account_id = var.cloudflare_account_id
#   zone       = var.domain_name
# }

resource "cloudflare_record" "oracle" {
  zone_id = "930ad404e3042fe25ab656fd3a2f3927"
  name    = "oracle"
  value   = "152.67.2.209"
  type    = "A"
  proxied = false
}