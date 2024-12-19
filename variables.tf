# multiple resources' names ...
# rg group name
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
      }    
    }
}




