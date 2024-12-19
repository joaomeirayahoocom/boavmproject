variable "storage_account_name" {}

variable "storage_account_container_name" {

 type = string
 default = "cgaz-prod-azlz-sa-con"
}

variable "container_access_type" {
 
 type = string
 default = "private"
}