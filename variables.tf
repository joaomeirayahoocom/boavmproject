#Azure variables
variable "resource_groups" {

  default = {
  
      "app"={
          name     = "app"
          location = "westus3"
          tags     = {env = "dev", proj = "app", dept = "IT"}
      },
      "web"={
          name     = "web"
          location = "westus3"
          tags     = {env = "dev", proj = "web", dept = "IT"}
      },
      "db"={
          name     = "db"
          location = "westus3"
          tags     = {env = "dev", proj = "db", dept = "IT"}
      },
      "vnet"={
          name     = "vnet"
          location = "westus3"
          tags     = {env = "dev", proj = "vnet", dept = "IT"}
      },
        "nsg"={
          name     = "nsg"
          location = "westus3"
          tags     = {env = "dev", proj = "nsg", dept = "IT"}
      },
        "sa"={
          name     = "sa"
          location = "westus3"
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