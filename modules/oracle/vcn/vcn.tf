resource "oci-core_vcn" "vcn"{
   
   compartmant_id = var.compartment_id
   cidr_clock = "10.0.0.0/16"
   display_name  = "test-vcn"
}