provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = "scrna-omics-cluster"
  location = var.region
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "default-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 3

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "node_pool" {
  cluster    = google_container_cluster.primary.name
  name       = "scrna-omics-pool"
  location   = var.region
  initial_node_count = 1

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "primary_pool" {
  name       = "scrna-omics-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
  }
}

resource "google_container_cluster" "primary" {
  name     = "scrna-omics-cluster"
  location = var.region

  initial_node_count = 1
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}
