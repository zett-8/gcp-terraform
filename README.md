# Terraform template for GCP

## Preparation
1. Create GCP project


2. Create a service account and give roles “Editor” and “Cloud run admin”


3. Download service account api key 


4. Install terraform cli
https://learn.hashicorp.com/tutorials/terraform/install-cli


5. Init project
```shell
terraform init
```

6. Set all variables in *vars.tf*, *prod.tfvars* and *stag.tfvars*

## Commands
- Make a diff

```shell
make plan_stag 
# this runs (terraform plan -var-file prod.tfvars)
make plan_prod 
# this runs (terraform plan -var-file stag.tfvars)
```

- Apply changes
```shell
make apply_stag
# this runs (terraform apply -var-file prod.tfvars)
make apply_prod
# this runs (terraform apply -var-file stag.tfvars)
```

- Delete everything deployed
```shell
make destroy_prod
# this runs (terraform destroy -var-file prod.tfvars)
make destroy_stag
# this runs (terraform destroy -var-file stag.tfvars)
```

- Push docker image to GCP image registry
```shell
make gcp-push-image_prod
# this runs (./scripts/gcloud-submit-docker-image.sh prod.tfvars)
make gcp-push-image_stag
# this runs (./scripts/gcloud-submit-docker-image.sh stag.tfvars)
```

## All variables to set

basic settings

- [ ] project_id
- [ ] region
- [ ] zone
- [ ] credential_filename

cloud run settings

- [ ] cloudRun_container_name
- [ ] cloudRun_autoScaling_max
- [ ] cloudRun_timeout_seconds
- [ ] cloudRun_container_port
- [ ] cloudRun_cpu_limit
- [ ] cloudRun_memory_limit
- [ ] cloudRun_traffic_percent
- [ ] cloudRun_latest_revision
- [ ] cloudRun_environment_variable1_name
- [ ] cloudRun_environment_variable1_value

cloud sql settings

- [ ] cloudSQL_name
- [ ] cloudSQL_database_version
- [ ] cloudSQL_tier
- [ ] cloudSQL_availability_type
- [ ] cloudSQL_auto_resize
- [ ] cloudSQL_disk_type
- [ ] cloudSQL_disk_size
- [ ] cloudSQL_backup_enable
- [ ] cloudSQL_point_in_time_recovery
- [ ] cloudSQL_user_name
- [ ] cloudSQL_user_password
- [ ] cloudSQL_deletion_protection

cloud storage settings

- [ ] cloudStorage_bucket_name
- [ ] cloudStorage_location
- [ ] cloudStorage_force_destroy
- [ ] cloudStorage_storage_class
- [ ] cloudStorage_uniform_access
- [ ] cloudStorage_cors_origin
- [ ] cloudStorage_cors_method
- [ ] cloudStorage_cors_response_header
- [ ] cloudStorage_cors_max_age_seconds
