variable "project_name" {
  type = string

}
variable "location" {
  type = string
}
variable "env_var" {
  type = string
}
variable "business_div" {
  type = string
}
variable "mechine_type" {
  type = string
}
variable "vpc_name" {
  type = string
}


# cidr i/p range 
variable "sub_net_ip_range" {
  type        = string
  description = "Ip range for subnet"
}
variable "pods_ip_range" {
  type        = string
  description = "Ip range for pods"
}

variable "services_ip_range" {
  type        = string
  description = "kube service ip range"

}
variable "master_ip_range" {
  type        = string
  description = "master ip range"
}
