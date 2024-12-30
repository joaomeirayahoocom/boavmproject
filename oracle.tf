#module "vcn_network" {

 # source = "./modules/oracle/vcn"
#}

resource "oci_core_vcn" "vcn"{
   
   compartment_id = var.compartment_ocid
   cidr_block     = var.vcn_cidr_block
   display_name   = var.vcn_display_name
}

#simple subnet
resource "oci_core_subnet" "simple_subnet" {
 
  cidr_block                 = var.subnet_cidr_block
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.vcn.id
  display_name               = var.subnet_display_name
  dns_label                  = substr(var.subnet_dns_label, 0, 15)
}