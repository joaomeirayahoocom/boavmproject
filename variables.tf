#Azure variables
variable "resource_groups" {

  default = {
  
      "app"={
          name     = "app"
          location = "westus"
          tags     = {env = "dev", proj = "app", dept = "IT"}
      },
      "web"={
          name     = "web"
          location = "westus"
          tags     = {env = "dev", proj = "web", dept = "IT"}
      },
      "db"={
          name     = "db"
          location = "westus"
          tags     = {env = "dev", proj = "db", dept = "IT"}
      },
      "vnet"={
          name     = "vnet"
          location = "westus"
          tags     = {env = "dev", proj = "vnet", dept = "IT"}
      },
        "nsg"={
          name     = "nsg"
          location = "westus"
          tags     = {env = "dev", proj = "nsg", dept = "IT"}
      },
        "sa"={
          name     = "sa"
          location = "westus"
          tags     = {env = "dev", proj = "nsg", dept = "IT"}
      }     
    }
}






#aws variables
variable "aws_region" {

  type        = string
  description = "AWS Region"
  default     = "us-west-1"
}

variable "aws_provider" {

  type        = string
  default     = "default"
}

variable "vpc_block" {

  type        = string
  default     = "10.11.0.0/16"
}

variable "subnet_web" {

  type        = string
  default     = "10.11.1.0/24"
}

variable "subnet_app" {

  type        = string
  default     = "10.11.2.0/24"
}

variable "subnet_db" {

  type        = string
  default     = "10.11.3.0/24"
}

variable "image-windows" {
  type        = string
  default     = "ami-02e9e93401dd72225"
}

variable "instance_type" {
  type        = string
  default     = "t2_nano"
}


#oracle_variables
#vcn
variable "vcn_display_name" {
  description = "VCN Name"
  default     = "simple-vcn"
}

variable "vcn_cidr_block" {
  description = "VCN CIDR"
  default     = "10.0.0.0/16"
}

#subnets
variable "subnet_display_name" {
  description = "Subnet Name"
  default     = "simple-subnet"
}

variable "subnet_dns_label" {
  description = "Subnet DNS Label"
  default     = "simplesubnet"
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR"
  default     = "10.0.0.0/24"
}

#compartment
variable "compartment_ocid" {
  description = ""
  default = "ocid1.tenancy.oc1..aaaaaaaab2ljev5xrj45kya7qlx2rdwuw3ohal6puigrte4l6yz6zk7hunaa"
}

variable "region" {
  description = ""
  default = "us-sanjose-1"
}

variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaab2ljev5xrj45kya7qlx2rdwuw3ohal6puigrte4l6yz6zk7hunaa"
}