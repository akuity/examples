variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes (per zone)"
}

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "akp_org_name" {
  type        = string
  description = "Akuity Platform organization name."
}