<h1 align="center">TERRAFORM GHA (GitHub Actions) Runners</h1>

## Getting Started

This Terraform project allows user create a Kubernetes Cluster with [GitHub Action Runner Controller](https://github.com/actions/actions-runner-controller) installed running on any cloud provider (currently support AWS) or locally using [Kubernetes-in-Docker](https://github.com/kubernetes-sigs/kind) (KIND) or [Minikube](https://github.com/kubernetes/minikube). It supports two main use cases:

1. **DinD (Docker in Docker)** Deploying GitHub Actions Runner using Docker in Docker as the Container Mode.
1. **Kubernetes** Deploying GitHub Actions Runner using Kubernetes as the Container Mode.

This project currently supports running the GitHub Actions Runner on the following platforms:

1. **AWS EKS** Deploying GitHub Actions Runner on AWS EKS.
1. **KinD** Deploying GitHub Actions Runner on KinD.
1. **Minikube** Deploying GitHub Actions Runner on Minikube.

> ⚠️ **Before running the Terraform commands, make sure to update the `terraform.tfvars` file with the right `githubConfigUrl` and `github_token`.**

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

## Deploying to Minikube

### Requirements for Minikube

The following tools are required for deploying the GitHub Actions Runner on Minikube:

* `docker` (up and running)
* `terraform` (1.0+)
* `helm` (3.0+)
* `minikube`
* `make`

#### Using Container Mode as DinD in Minikube

The bootstrapping and configuration of cluster can be performed with the command:

```sh
cd minikube/dind
terraform init
terraform apply -var-file=terraform.tfvars
```

To update the cluster, there are variables that can be changed, and it is located in the [terraform.tfvars](minikube/dind/terraform.tfvars).

#### Using Container Mode as Kubernetes in Minikube

The bootstrapping and configuration of cluster can be performed with the command:

```sh
cd minikube/k8s
terraform init
terraform apply -var-file=terraform.tfvars
```

To update the cluster, there are variables that can be changed, and it is located in the [terraform.tfvars](minikube/k8s/terraform.tfvars).

### Alternative: using Makefile

To simplify the execution of the commands, a `Makefile` is available and this is used to perform the `terraform` commands seamlessly. All you need to do is to type from the root folder:
    
```sh
make help
```

To create a GitHub Actions Runner on any of the platform currently supported, type:

```sh
make create-<platform>-<container_mode>
```

To delete the GitHub Actions Runner on any of the platform currently supported, type:

```sh
make cleanup-<platform>-<container_mode>
```
