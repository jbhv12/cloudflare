variable "cloudflare_account_id" {
  description = "The Cloudflare account ID."
  type        = string
}

variable "domain_name" {
  description = "The domain name to manage."
  type        = string
  default     = "is-savvy.dev"
}