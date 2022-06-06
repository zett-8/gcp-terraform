# Terraform template for GCP

## Terraform cli Installation
https://learn.hashicorp.com/tutorials/terraform/install-cli

1. First, install the HashiCorp tap, a repository of all our Homebrew packages.
```shell
brew tap hashicorp/tap
```

2. Now, install Terraform with hashicorp/tap/terraform.
```shell
brew install hashicorp/tap/terraform
```

3. To update to the latest version of Terraform, first update Homebrew.
```shell
brew update
```

4. Then, run the upgrade command to download and use the latest Terraform version.
```shell
brew upgrade hashicorp/tap/terraform
```
## Commands

- Init terraform
```shell
terraform init
```

- Make a diff

```shell
terraform plan
```

- Apply changes
```shell
terraform apply
```

- Delete everything deployed
```shell
terraform destroy
```

**Switch vars depends on environment**
```shell
terraform plan -var-file="stag.tfvars"
terraform plan -var-file="prod.tfvars"

terraform apply -var-file="stag.tfvars"
terraform apply -var-file="prod.tfvars"
```
