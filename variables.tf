variable "cloudflare_account_id" {
  description = "The Cloudflare account ID."
  type        = string
  default     = "d8323c6cfda50c6ff2a74c6e6a01f1f3"
}
variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}
variable "dns_zone_id" {
  description = "The domain name to manage."
  type        = string
  default     = "930ad404e3042fe25ab656fd3a2f3927"
}
variable "domain_name" {
  description = "The domain name to manage."
  type        = string
  default     = "is-savvy.dev"
}

variable "tenancy_ocid" {
  type      = string
  sensitive = true
}

variable "user_ocid" {
  type      = string
  sensitive = true
}

variable "fingerprint" {
  type      = string
  sensitive = true
}

variable "private_key" {
  type      = string
  sensitive = true
}

variable "region" {
  type      = string
  default = "ap-mumbai-1"
}

variable "vm_password" {
  type      = string
  sensitive = true
}