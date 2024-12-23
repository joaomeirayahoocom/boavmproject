variable "resource_groups" {
  
    type = map(object({

        location = optional(string, "")
        name     = optional(string, "")
        tags     = map(string)
  }))
}
