# GKE Private Endpoint Cluster with Terraform

This repository contains Terraform configurations to provision a **Google Kubernetes Engine (GKE) private endpoint cluster** and deploy workloads using Terraform.  
The setup ensures that the cluster is accessible only through private IPs, enhancing security by restricting public exposure.

---

## 📋 Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.5+
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and authenticated
- A Google Cloud project with billing enabled
- IAM permissions to create:
  - VPC networks and subnets
  - GKE clusters
  - Service accounts and IAM roles
  - VM 
  - Node Pool
- Enable the following APIs in your project:
  - `container.googleapis.com`
  - `compute.googleapis.com`
  - `iam.googleapis.com`

---

## ⚙️ Infrastructure Overview

- **VPC & Subnet**: A custom VPC with private subnets for the GKE cluster.
- **GKE Cluster**: 
  - Private endpoint only (no public IP).
  - Master authorized networks configured.
  - Workload Identity enabled for secure service account mapping.
- **Node Pools**:
  - Autoscaling enabled.
  - Private nodes with restricted egress.
- **Deployment**:
  - Terraform `kubernetes` provider used to deploy workloads directly after cluster creation.

---

## 🚀 Usage

### 1. Clone the repository
```bash
git clone https://github.com/sanjibA5/gke-private-cluster.git
cd gke-private-cluster