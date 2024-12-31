#module "vcn_network" {

 # source = "./modules/oracle/vcn"
#}

resource "oci_core_vcn" "vcn"{
   
   compartment_id = var.compartment_ocid
   cidr_block     = var.vcn_cidr_block
   display_name   = var.vcn_display_name
}



