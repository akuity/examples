# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

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
  # Configuration options
  org_name = "organization-name"
#   api_key_id = AKUITY_API_KEY_ID
#   api_key_secret = AKUITY_API_KEY_SECRET
}
