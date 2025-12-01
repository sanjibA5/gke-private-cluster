resource "google_service_account" "service_account_gke" {
  account_id  = "${local.name}-gke-sa"
  description = "Service Account GKE for ${local.name} for enviroment ${local.env}"
}