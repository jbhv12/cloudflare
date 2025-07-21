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

resource "cloudflare_record" "oracle" {
  zone_id = var.dns_zone_id
  name    = "oracle"
  content   = "152.67.2.209"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "mx_jay10" {
  zone_id  = var.dns_zone_id
  name     = "jay"
  content    = "mx.zoho.in"
  type     = "MX"
  priority = 10
  ttl      = 300
}

resource "cloudflare_record" "mx_jay20" {
  zone_id  = var.dns_zone_id
  name     = "jay"
  content    = "mx2.zoho.in"
  type     = "MX"
  priority = 20
  ttl      = 300
}

resource "cloudflare_record" "mx_jay50" {
  zone_id  = var.dns_zone_id
  name     = "jay"
  content    = "mx3.zoho.in"
  type     = "MX"
  priority = 50
  ttl      = 300
}

resource "cloudflare_record" "spf_record" {
  zone_id = var.dns_zone_id
  name    = "jay"
  content   = "v=spf1 include:zoho.in ~all"
  type    = "TXT"
  ttl     = 300
}