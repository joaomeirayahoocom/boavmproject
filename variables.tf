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




#INSTANCE VARIABLES
# provider identity parameters
variable "fingerprint" {
  description = "fingerprint of oci api private key"
  type        = string
  default = "90:8a:b0:01:5f:6e:3e:f6:6a:db:0f:2a:70:95:e8:be"
  # no default value, asking user to explicitly set this variable's value. see codingconventions.adoc
}

variable "private_key_path" {
  description = "path to oci api private key used"
  type        = string
  default = "C:\\Users\\oaomeira\\.oci\\oci_api_key.pem"
  # no default value, asking user to explicitly set this variable's value. see codingconventions.adoc
}

variable "region" {
  description = "the oci region where resources will be created"
  type        = string
  default = "us-sanjose-1"
}

variable "tenancy_ocid" {
  description = "tenancy ocid where to create the sources"
  type        = string
  default = "ocid1.tenancy.oc1..aaaaaaaab2ljev5xrj45kya7qlx2rdwuw3ohal6puigrte4l6yz6zk7hunaa"
  # no default value, asking user to explicitly set this variable's value. see codingconventions.adoc
}

variable "user_ocid" {
  description = "ocid of user that terraform will use to create the resources"
  type        = string
  default = "ocid1.user.oc1..aaaaaaaaiyqgthwzg4xr33opi6nezfnwohp5a2kbtwgpn3htipxlmqg2cf5q"
  # no default value, asking user to explicitly set this variable's value. see codingconventions.adoc
}

# general oci parameters

variable "freeform_tags" {
  description = "simple key-value pairs to tag the resources created using freeform tags."
  type        = map(string)
  default     = null
}

variable "defined_tags" {
  description = "predefined and scoped to a namespace to tag the resources created using defined tags."
  type        = map(string)
  default     = null
}

# compute instance parameters

variable "instance_ad_number" {
  description = "The availability domain number of the instance. If none is provided, it will start with AD-1 and continue in round-robin."
  type        = number
  default     = 1
}

variable "instance_count" {
  description = "Number of identical instances to launch from a single module."
  type        = number
  default     = 1
}

variable "instance_display_name" {
  description = "(Updatable) A user-friendly name for the instance. Does not have to be unique, and it's changeable."
  type        = string
  default     = "module_instance_nonflex"
}

variable "instance_flex_memory_in_gbs" {
  type        = number
  description = "(Updatable) The total amount of memory available to the instance, in gigabytes."
  default     = null
}

variable "instance_flex_ocpus" {
  type        = number
  description = "(Updatable) The total number of OCPUs available to the instance."
  default     = null
}

variable "instance_state" {
  type        = string
  description = "(Updatable) The target state for the instance. Could be set to RUNNING or STOPPED."
  default     = "STOPPED"

  validation {
    condition     = contains(["RUNNING", "STOPPED"], var.instance_state)
    error_message = "Accepted values are RUNNING or STOPPED."
  }
}

variable "shape" {
  description = "The shape of an instance."
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "cloud_agent_plugins" {
  description = "Whether each Oracle Cloud Agent plugins should be ENABLED or DISABLED."
  type        = map(string)
  default = {
    autonomous_linux       = "ENABLED"
    bastion                = "ENABLED"
    block_volume_mgmt      = "DISABLED"
    custom_logs            = "ENABLED"
    management             = "DISABLED"
    monitoring             = "ENABLED"
    osms                   = "ENABLED"
    run_command            = "ENABLED"
    vulnerability_scanning = "ENABLED"
  }
}
variable "source_ocid" {
  description = "The OCID of an image or a boot volume to use, depending on the value of source_type."
  type        = string
  default = "ocid1.image.oc1.us-sanjose-1.aaaaaaaagqsk2tvjwnkkarmct7bzmzez6v4cnqtsueca2lhg6lsfeji36qcq"
}

variable "source_type" {
  description = "The source type for the instance."
  type        = string
  default     = "image"
}

# operating system parameters

variable "ssh_public_keys" {
  description = "Public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance. To provide multiple keys, see docs/instance_ssh_keys.adoc."
  type        = string
  default     = "c:\\users\\joaomeira\\.ssh\\id_rsa\\joaokey.pub"
}

# networking parameters

variable "assign_public_ip" {
  description = "Whether the VNIC should be assigned a public IP address."
  type        = bool
  default     = false
}

variable "public_ip" {
  description = "Whether to create a Public IP to attach to primary vnic and which lifetime. Valid values are NONE, RESERVED or EPHEMERAL."
  type        = string
  default     = "NONE"
}

# storage parameters

variable "boot_volume_backup_policy" {
  description = "Choose between default backup policies : gold, silver, bronze. Use disabled to affect no backup policy on the Boot Volume."
  type        = string
  default     = "disabled"
}

variable "block_storage_sizes_in_gbs" {
  description = "Sizes of volumes to create and attach to each instance."
  type        = list(string)
  default     = [50]
}