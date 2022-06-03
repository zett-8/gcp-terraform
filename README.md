
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
