prod		= terraform workspace select prod
prodvars 	= -var-file=prod.tfvars
stag 		= terraform workspace select stag
stagvars 	= -var-file=stag.tfvars

init_prod:
	$(prod) && terraform init

plan_prod:
	$(prod) && terraform plan $(prodvars)

apply_prod:
	$(prod) && terraform apply $(prodvars)

destroy_prod:
	$(prod) && terraform destroy $(prodvars)

init_stag:
	$(stag) && terraform init

plan_stag:
	$(stag) && terraform plan $(stagvars)

apply_stag:
	$(stag) && terraform apply $(stagvars)

destroy_stag:
	$(stag) && terraform destroy $(stagvars)

gcp-push-image_prod:
	./scripts/gcloud-submit-docker-image.sh prod.tfvars $(DOCKERFILE_PATH)

gcp-push-image_stag:
	./scripts/gcloud-submit-docker-image.sh stag.tfvars $(DOCKERFILE_PATH)
