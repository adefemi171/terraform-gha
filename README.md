<h1 align="center">TERRAFORM GHA (GitHub Actions) Runners</h1>

## Getting Started

This Terraform project allows user create a Kubernetes Cluster either running on any cloud provider (currently support AWS) or locally using [Kubernetes-in-Docker Stack](https://github.com/kubernetes-sigs/kind) (KIND) or [Minikube](https://github.com/kubernetes/minikube). It supports two main use cases:

1. **DinD** Deploying GitHub Actions Runner using Docker in Docker as the Container Mode.
1. **AWS EKS** Deploying GitHub Actions Runner using Kubernetes as the Container Mode.

This project currently supports running the GitHub Actions Runner on the following platforms:

1. **AWS EKS** Deploying GitHub Actions Runner on AWS EKS.
1. **KinD** Deploying GitHub Actions Runner on KinD.
1. **Minikube** Deploying GitHub Actions Runner on Minikube.

> ⚠️ **Before running the Terraform commands, make sure to update the `terraform.tfvars` file with the right `githubConfigUrl` and `github_token`.**

## Requirements

The following tools are required for this project:

* `docker` (up and running)
* `terraform` (1.0+)
* `helm` (3.0+)
* `kind`
* `minikube`
* `make`

## Deploying to AWS EKS

### Requirements for AWS EKS

The following tools are required for deploying the GitHub Actions Runner on AWS EKS:

* `docker` (up and running)
* `awscli`
* `kubectl`
* `eksctl`
* `terraform` (1.0+)
* `helm` (3.0+)
* `make`
* `aws secret and access key`


#### Using Container Mode as DinD in AWS EKS

The bootstrapping and configuration of cluster can be performed with the command:

```sh
cd aws/dind
terraform init
terraform apply -var-file=terraform.tfvars
```

To update the cluster, there are variables that can be changed, and it is located in the [terraform.tfvars](aws/dind/terraform.tfvars).

#### Using Container Mode as Kubernetes in AWS EKS

The bootstrapping and configuration of cluster can be performed with the command:

```sh
cd aws/k8s
terraform init
terraform apply -var-file=terraform.tfvars
```

To update the cluster, there are variables that can be changed, and it is located in the [terraform.tfvars](aws/k8s/terraform.tfvars).

## Deploying to KinD

### Requirements for KinD

The following tools are required for deploying the GitHub Actions Runner on KinD:

* `docker` (up and running)
* `terraform` (1.0+)
* `helm` (3.0+)
* `kind`
* `minikube`
* `make`

#### Using Container Mode as DinD in KinD

The bootstrapping and configuration of cluster can be performed with the command:

```sh
cd kind/dind
terraform init
terraform apply -var-file=terraform.tfvars
```

To update the cluster, there are variables that can be changed, and it is located in the [terraform.tfvars](kind/dind/terraform.tfvars).

#### Using Container Mode as Kubernetes in KinD

The bootstrapping and configuration of cluster can be performed with the command:

```sh
cd kind/k8s
terraform init
terraform apply -var-file=terraform.tfvars
```

To update the cluster, there are variables that can be changed, and it is located in the [terraform.tfvars](kind/k8s/terraform.tfvars).