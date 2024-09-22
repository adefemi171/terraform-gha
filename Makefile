#####################
### General Settings
#####################

# Use Bash as default shell
SHELL := sh
# Set bash strict mode and enable warnings
.ONESHELL:
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
# Making steps silent - don't print all the commands to stdout
.SILENT:

.PHONY: help
help:
	$(info Creates GitHub Actions Runner in AWS EKS, Kind (kubernetes in docker) cluster or Minikube)
	$(info Usage: make <target>)
	$(info )		
	$(info Available targets:)
	$(info - create-aws-dind:  creates the GitHub Actions Runner using DinD (Docker in Docker) as container mode in AWS EKS)
	$(info - create-aws-k8s:  creates the GitHub Actions Runner using Kubernetes as container mode in AWS EKS)
	$(info - create-kind-dind:  creates the GitHub Actions Runner using DinD (Docker in Docker) as container mode in a Kind cluster)
	$(info - create-kind-k8s:  creates the GitHub Actions Runner using Kubernetes as container mode in a Kind cluster)
	$(info - create-minikube-dind:  creates the GitHub Actions Runner using DinD (Docker in Docker) as container mode in a Minikube cluster)
	$(info - create-minikube-k8s:  creates the GitHub Actions Runner using Kubernetes as container mode in a Minikube cluster)
	$(info - cleanup-aws-dind:  deletes the AWS EKS cluster with DinD (Docker in Docker) as container mode)
	$(info - cleanup-aws-k8s:  deletes the AWS EKS cluster with Kubernetes as container mode)
	$(info - cleanup-kind-dind:  deletes the Kind cluster with DinD (Docker in Docker) as container mode)
	$(info - cleanup-kind-k8s:  deletes the Kind cluster with Kubernetes as container mode)
	$(info - cleanup-minikube-dind:  deletes the Minikube cluster with DinD (Docker in Docker) as container mode)
	$(info - cleanup-minikube-k8s:  deletes the Minikube cluster with Kubernetes as container mode)

.PHONY: create-aws-dind
create-aws-dind:
	cd aws/dind && \
	terraform init -upgrade && \
	terraform apply -auto-approve -var-file=terraform.tfvars

.PHONY: create-aws-k8s
create-aws-k8s:
	cd aws/k8s && \
	terraform init -upgrade && \
	terraform apply -auto-approve -var-file=terraform.tfvars

.PHONY: create-kind-dind
create-kind-dind:
	cd kind/dind && \
	terraform init -upgrade && \
	terraform apply -auto-approve -var-file=terraform.tfvars

.PHONY: create-kind-k8s
create-kind-k8s:
	cd kind/k8s && \
	terraform init -upgrade && \
	terraform apply -auto-approve -var-file=terraform.tfvars

.PHONY: create-minikube-dind
create-minikube-dind:
	cd minikube/dind && \
	terraform init -upgrade && \
	terraform apply -auto-approve -var-file=terraform.tfvars

.PHONY: create-minikube-k8s
create-minikube-k8s:
	cd minikube/k8s && \
	terraform init -upgrade && \
	terraform apply -auto-approve -var-file=terraform.tfvars

.PHONY: cleanup-aws-dind
cleanup-aws-dind:
	cd aws/dind && \
	terraform destroy -auto-approve -var-file=terraform.tfvars && \
	rm -f *-config || echo "Config file not found, skipping" && \
	rm -f *.tfstate || echo "State file not found, skipping" && \
	rm -f *.tfstate.backup || echo "State backup file not found, skipping"

.PHONY: cleanup-aws-k8s
cleanup-aws-k8s:
	cd aws/k8s && \
	terraform destroy -auto-approve -var-file=terraform.tfvars && \
	rm -f *-config || echo "Config file not found, skipping" && \
	rm -f *.tfstate || echo "State file not found, skipping" && \
	rm -f *.tfstate.backup || echo "State backup file not found, skipping"

.PHONY: cleanup-kind-dind
cleanup-kind-dind:
	cd kind/dind && \
	terraform destroy -auto-approve -var-file=terraform.tfvars && \
	kind delete clusters --all && \
	rm -f *-config || echo "Config file not found, skipping" && \
	rm -f *.tfstate || echo "State file not found, skipping" && \
	rm -f *.tfstate.backup || echo "State backup file not found, skipping"

.PHONY: cleanup-kind-k8s
cleanup-kind-k8s:
	cd kind/k8s && \
	terraform destroy -auto-approve -var-file=terraform.tfvars && \
	kind delete clusters --all && \
	rm -f *-config || echo "Config file not found, skipping" && \
	rm -f *.tfstate || echo "State file not found, skipping" && \
	rm -f *.tfstate.backup || echo "State backup file not found, skipping"

.PHONY: cleanup-minikube-dind
cleanup-minikube-dind:
	minikube delete --all && \
	cd minikube/dind && \
	rm -f *.tfstate || echo "State file not found, skipping" && \
	rm -f *.tfstate.backup || echo "State backup file not found, skipping"

.PHONY: cleanup-minikube-k8s
cleanup-minikube-k8s:
	minikube delete --all && \
	cd minikube/k8s && \
	rm -f *.tfstate || echo "State file not found, skipping" && \
	rm -f *.tfstate.backup || echo "State backup file not found, skipping"

.PHONY: plan-kind-dind
plan-kind-dind:
	cd kind/dind && \
	terraform init -upgrade && \
	terraform plan -var-file=terraform.tfvars

.PHONY: plan-kind-k8s
plan-kind-k8s:
	cd kind/k8s && \
	terraform init -upgrade && \
	terraform plan -var-file=terraform.tfvars

.PHONY: plan-minikube-dind
plan-minikube-dind:
	cd minikube/dind && \
	terraform init -upgrade && \
	terraform plan -var-file=terraform.tfvars

.PHONY: plan-minikube-k8s
plan-minikube-k8s:
	cd minikube/k8s && \
	terraform init -upgrade && \
	terraform plan -var-file=terraform.tfvars