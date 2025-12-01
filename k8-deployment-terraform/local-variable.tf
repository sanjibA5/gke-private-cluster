locals {
  owner = var.business_div
  env   = var.env_var
  name  = "${var.business_div}-${var.env_var}"
  # gke_name=data.terraform_remote_state.gke_data_source.outputs.gke_master_name
}
