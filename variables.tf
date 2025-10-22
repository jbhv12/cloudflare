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

variable "ssh_public_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCgRQ8rIGxHJWa3twTlZIXHbBt4MwwvKppXEe81Utjr5Lerm/0VCI8lQACW69KGiKAolUq19JsXXhJQE4GrtttapfzGsxW1ySc+F5BdI9jJBjcAgD4pfRGG1IDn1cMgk25XMpKwnaaxtns4uD0C8jx4uJ7dx2EcLYgg0ycbjs9m9HRD7K5X78zHLE7vVBo/E+5FoEZhzjgsMV/vyXFmkziJjSQF9koJBVDRwl6uBesNONtXqiZqgXfvC0KeeDc+Zs31ZTfki+Jb2TKYw4oysIB84p6VYD68foNmlSTomFjv0UuPoczz2C4N7mESh7tB2EqjfS/CdbHFmuHaBL7CrwBIi83hlEBsJaTNtb+RObuy1c/6hWNoqDk06V6xBwaM8umsNcKUdROwXGzXUGk7j+h2XefTwOnazKJzddhPGUy5sskyINJve7jwpGhMCoZUFh/ZJ+70mDRR041ptCRlTfHYm8t7YhQ+9wnQkpDnYlf2Rw+GW+3Muz5Bvr+CSkwhfxodUJFfELZm0mPDmjeClH7a3B2KlP4JUr3Gkdcp+nUu06MM+2KPUr3/7I9lXZXkdnghXu90RMBcLbMrqnpfFxi7lmfew/4Z2lr3QuZNQnaEl6n6u9KrV51x4kvisnwJkZU9LJ/Zv7gKOn6xfvP5HsiZyv68J7XWua75NUmdjfvvVQ== jbhv12@jay-laptop.local"
}