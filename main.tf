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

provider "cloudflare" {}

resource "cloudflare_record" "oracle" {
  zone_id = var.dns_zone_id
  name    = "oracle"
  value   = "152.67.2.209"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "mx_jay10" {
  zone_id  = var.dns_zone_id
  name     = "@"
  value    = "jay10mx.zoho.in"
  type     = "MX"
  priority = 10
  ttl      = 300
}

resource "cloudflare_record" "mx_jay20" {
  zone_id  = var.dns_zone_id
  name     = "@"
  value    = "jay20mx2.zoho.in"
  type     = "MX"
  priority = 20
  ttl      = 300
}

resource "cloudflare_record" "mx_jay50" {
  zone_id  = var.dns_zone_id
  name     = "@"
  value    = "jay50mx3.zoho.in"
  type     = "MX"
  priority = 50
  ttl      = 300
}

resource "cloudflare_record" "spf_record" {
  zone_id = var.dns_zone_id
  name    = "@"
  value   = "v=spf1 include:zoho.in ~all"
  type    = "TXT"
  ttl     = 300
}