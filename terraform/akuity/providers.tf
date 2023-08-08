terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
    akp = {
      source  = "akuity/akp"
      version = "~> 0.5.3"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.22.0"
    }
  }
  required_version = ">= 0.14"
}

provider "akp" {
  org_name = var.akp_org_name
  #   api_key_id = AKUITY_API_KEY_ID
  #   api_key_secret = AKUITY_API_KEY_SECRET
}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.gke-01.endpoint}"
  token                  = data.google_client_config.current.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.gke-01.master_auth.0.cluster_ca_certificate)
}