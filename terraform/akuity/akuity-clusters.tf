resource "akp_cluster" "gke-01" {
  instance_id = akp_instance.argocd.id
  kube_config = {
    host                   = "https://${google_container_cluster.gke-01.endpoint}"
    token                  = data.google_client_config.current.access_token
    client_certificate     = "${base64decode(google_container_cluster.gke-01.master_auth.0.client_certificate)}"
    client_key             = "${base64decode(google_container_cluster.gke-01.master_auth.0.client_key)}"
    cluster_ca_certificate = "${base64decode(google_container_cluster.gke-01.master_auth.0.cluster_ca_certificate)}"
  }
  name      = "gke-01"
  namespace = "akuity"
  labels = {
    provider = "gcp"
  }
  annotations = {
    argocd-enabled = "false"
  }
  spec = {
    description = "gcp 01 cluster"
    data = {
      size = "small"
    }
  }
}