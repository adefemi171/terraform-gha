<h1 align="center">TERRAFORM GHA (GitHub Actions) Runners</h1>

## Getting Started

This Terraform project allows user create a Kubernetes Cluster with [GitHub Action Runner Controller](https://github.com/actions/actions-runner-controller) installed running on any cloud provider (currently support AWS) or locally using [Kubernetes-in-Docker](https://github.com/kubernetes-sigs/kind) (KIND) or [Minikube](https://github.com/kubernetes/minikube).

It supports two main use cases:

1. **DinD (Docker in Docker):** Deploying GitHub Actions Runner using Docker in Docker as the Container Mode.
1. **Kubernetes:** Deploying GitHub Actions Runner using Kubernetes as the Container Mode.

The project currently supports running GitHub Actions Runner on the following platforms:

1. **AWS EKS:** Deploying GitHub Actions Runner Controller on AWS EKS.
1. **KinD:** Deploying GitHub Actions Runner Controller on KinD.
1. **Minikube:** Deploying GitHub Actions Runner Controller on Minikube.

> [!IMPORTANT]
> Before running the Terraform commands, make sure to update the `terraform.tfvars` file with the right `githubConfigUrl` and `github_token`. Lastly, if you will be using GitHub ARC images, make sure to login to the GitHub Container Registry (GHCR) using the `docker login ghcr.io -u username -p accesstoken` command.

## Supported Providers

Building for all available cloud and deployment platforms is the main goal of this project. Any user should be able to deploy the same tools and simply switch between cloud providers and runtime environments (Windows or Linux).

Currently a lot of work is been done around EKS, KinD, Minikube

This project will be supporting the following providers:

- [x] [AWS](https://aws.amazon.com/)
- [ ] [GCP](https://cloud.google.com/)
- [ ] [Azure](https://azure.microsoft.com/en-us)
- [ ] [Oracle Cloud](https://www.oracle.com/cloud/)
- [ ] [IBM Cloud](https://www.ibm.com/cloud)
- [ ] [Digital Ocean](https://www.digitalocean.com/)
- [ ] [RedHat OpenShift](https://www.digitalocean.com/)
- [ ] [Kubernetes](https://kubernetes.io/)
  - [x] [EKS](https://aws.amazon.com/eks/)
  - [ ] [GKE](https://cloud.google.com/kubernetes-engine)
  - [ ] [AKS](https://azure.microsoft.com/en-us/products/kubernetes-service)
  - [ ] [OKE](https://www.oracle.com/cloud/cloud-native/container-engine-kubernetes/)
  - [ ] [IKS](https://www.ibm.com/cloud/kubernetes-service)
  - [ ] [DOKS](https://www.digitalocean.com/products/kubernetes)
  - [ ] [OpenShift](https://www.redhat.com/en/technologies/cloud-computing/openshift)

- [ ] Bare metal (such as [Hetzner](https://www.hetzner.com/de))
- [ ] [Openstack](https://www.openstack.org/)
- [x] [kind](https://kind.sigs.k8s.io/)
- [x] [minikube](https://minikube.sigs.k8s.io/)
- [ ] [k3s](https://k3s.io/)
- [ ] [Rancher](https://rancher.com/)

## Deploying to AWS EKS

### Requirements for AWS EKS

The following tools are required for deploying GitHub Actions Runner Controller on AWS EKS (tested only on public clusters):

- `docker` (up and running)
- `awscli`
- `aws secret and access key`
- `kubectl`
- `eksctl`
- `terraform` (1.0+)
- `helm` (3.0+)
- `make`

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

The following tools are required for deploying GitHub Actions Runner Controller on KinD:

- `docker` (up and running)
- `terraform` (1.0+)
- `helm` (3.0+)
- `kind`
- `make`

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

The following tools are required for deploying GitHub Actions Runner Controller on Minikube:

- `docker` (up and running)
- `terraform` (1.0+)
- `helm` (3.0+)
- `minikube`
- `make`

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

### Usage

Once the cluster is up and running, you can use the github actions runner in your workflow by changing the `runs-on` in your workflow file to the name of the runner you created.

```yaml
jobs:
  build:
    runs-on: self-hosted
```
