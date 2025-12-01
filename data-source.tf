data "google_compute_zones" "name_zone" {
  status = "UP"
  #   project = var.project_name
  #   region = var.location
}

output "compute_zones" {
  value       = data.google_compute_zones.name_zone.names
  description = "list of available zone"
}