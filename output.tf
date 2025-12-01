output "gke_master_version" {
  value = google_container_cluster.gke.master_version

}

output "gke_master_name" {
  value = google_container_cluster.gke.name

}
output "gke_master_end_point" {
  value = google_container_cluster.gke.endpoint

}

output "gke_linux_node_pool_id" {
  value = google_container_node_pool.node_pool.id
}
output "gke_linux_node_pool_version" {
  value = google_container_node_pool.node_pool.version
}