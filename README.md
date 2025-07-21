# Manage Cloudflare Domain with Terraform

This project uses Terraform to manage the Cloudflare domain `is-savvy.dev`.

## GitHub Actions

This project is configured with a GitHub Actions workflow to automatically run `terraform plan` and `terraform apply`.

### Setup

1.  **Add your Cloudflare Account ID to `terraform.tfvars`:**

    Create a file named `terraform.tfvars` in this directory and add your Cloudflare Account ID:

    ```hcl
    cloudflare_account_id = "YOUR_CLOUDFLARE_ACCOUNT_ID"
    ```

2.  **Add your Cloudflare API Token to GitHub Secrets:**

    Add your Cloudflare API token as a secret in your GitHub repository with the name `CLOUDFLARE_API_TOKEN`.

### Workflow

*   When you push to the `main` branch, the workflow will automatically run `terraform apply -auto-approve`.
*   For any other push, the workflow will run `terraform plan`.
