
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
