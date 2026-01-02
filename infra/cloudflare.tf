resource "cloudflare_record" "oracle" {
  zone_id = var.dns_zone_id
  name    = "oci"
  content   = oci_core_instance.vm_instance[0].public_ip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "oracle_wc" {
  zone_id = var.dns_zone_id
  name    = "*.oci"
  content   = oci_core_instance.vm_instance[0].public_ip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "local_wc" {
  zone_id = var.dns_zone_id
  name    = "*.who"
  content   = "192.168.1.100"
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

