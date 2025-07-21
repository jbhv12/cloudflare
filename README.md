# Manage Cloudflare Domain with Terraform

This project uses Terraform to manage the Cloudflare domain `is-savvy.dev`.

## GitHub Actions

This project is configured with a GitHub Actions workflow to automatically run `terraform plan` and `terraform apply`.

### Setup

The `cloudflare_account_id` is set to a default value in the Terraform configuration. You only need to add your Cloudflare API token to GitHub secrets.

1.  **Add your Cloudflare API Token to GitHub Secrets:**

    Add your Cloudflare API token as a secret in your GitHub repository with the name `CLOUDFLARE_API_TOKEN`.

### Workflow

*   When you push to the `main` branch, the workflow will automatically run `terraform apply -auto-approve`.
*   For any other push, the workflow will run `terraform plan`.
