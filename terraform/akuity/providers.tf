terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
    akp = {
      source  = "akuity/akp"
      version = "~> 0.5.0"
    }
  }
  required_version = ">= 0.14"
}

provider "akp" {
  org_name = var.akp_org_name
#   api_key_id = AKUITY_API_KEY_ID
#   api_key_secret = AKUITY_API_KEY_SECRET
}
