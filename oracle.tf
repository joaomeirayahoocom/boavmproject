#module "vcn_network" {

 # source = "./modules/oracle/vcn"
#}

resource "oci_core_vcn" "vcn"{
   
   compartment_id = "ocid1.tenancy.oc1..aaaaaaaab2ljev5xrj45kya7qlx2rdwuw3ohal6puigrte4l6yz6zk7hunaa"
   cidr_block     = "10.0.0.0/16"
   display_name   = "test-vcn"
}