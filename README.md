# scOmics Integration Workflow Platform Deployment-in AWS,GCP,Azure

This repository contains a scOmics integration workflow platform for deployment on GCP, AWS, and Azure.

## Directory Structure

scOmics-integration
├── Dockerfile
├── README.md
├── scrna_omics_analysis.R
├── scrna_omics_analysis.nf
├── deployment.yaml
├── terraform
│ ├── gcp
│ │ └── main.tf
│ ├── aws
│ │ └── main.tf
│ └── azure
│ └── main.tf
└── .gitignore

## Deployment

### GCP

1. Navigate to the `terraform/gcp` directory.
2. Initialize Terraform:
    ```sh
    terraform init
    ```
3. Create a Terraform plan:
    ```sh
    terraform plan -out=tfplan
    ```
4. Apply the Terraform plan:
    ```sh
    terraform apply tfplan
    ```

### AWS

1. Navigate to the `terraform/aws` directory.
2. Initialize Terraform:
    ```sh
    terraform init
    ```
3. Create a Terraform plan:
    ```sh
    terraform plan -out=tfplan
    ```
4. Apply the Terraform plan:
    ```sh
    terraform apply tfplan
    ```

### Azure

1. Navigate to the `terraform/azure` directory.
2. Initialize Terraform:
    ```sh
    terraform init
    ```
3. Create a Terraform plan:
    ```sh
    terraform plan -out=tfplan
    ```
4. Apply the Terraform plan:
    ```sh
    terraform apply tfplan
    ```

## Kubernetes Deployment

1. Build the Docker image:
    ```sh
    docker build -t your-docker-image:latest .
    ```
2. Push the Docker image to a container registry (Docker Hub, GCR, ECR, ACR).
3. Apply the Kubernetes deployment:
    ```sh
    kubectl apply -f deployment.yaml
    ```

Make sure to configure `kubectl` to point to your Kubernetes cluster.
