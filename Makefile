plan_prod:
	terraform plan -var-file prod.tfvars

apply_prod:
	terraform apply -var-file prod.tfvars

plan_stag:
	terraform plan -var-file stag.tfvars

apply_stag:
	terraform apply -var-file stag.tfvars

destroy_prod:
	terraform destroy -var-file prod.tfvars

destroy_stag:
	terraform destroy -var-file stag.tfvars

gcp-push-image_prod:
	./scripts/gcloud-submit-docker-image.sh prod.tfvars

gcp-push-image_stag:
	./scripts/gcloud-submit-docker-image.sh stag.tfvars
