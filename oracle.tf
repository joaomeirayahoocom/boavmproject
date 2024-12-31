#module "vcn_network" {

 # source = "./modules/oracle/vcn"
#}

resource "oci_core_vcn" "vcn"{
   
   compartment_id = var.compartment_ocid
   cidr_block     = var.vcn_cidr_block
   display_name   = var.vcn_display_name
}

resource "oci_core_subnet" "test_subnet" {

    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn.id
}

/*

resource "oci_core_instance" "ubuntu_instance" {

    availability_domain = "kIdk:SJC-OC1-1"
    compartment_id = var.compartment_ocid
    shape = "VM.Standard.A1.Flex"
    security_attributes = var.instance_security_attributes
    source_details {
        source_id = "ocid1.image.oc1.us-sanjose-1.aaaaaaaa5btfr7edpryejyzytgqit46gbpq3udxvu4hbkw4z2itgcogk55na"
        source_type = "image"
        instance_source_image_filter_details {
           compartment_id = var.compartment_ocid
        }
    }
    launch_volume_attachments {
        #Required
        type = var.instance_launch_volume_attachments_type
        
        launch_create_volume_details {
            #Required
            size_in_gbs = var.instance_launch_volume_attachments_launch_create_volume_details_size_in_gbs
            volume_creation_type = var.instance_launch_volume_attachments_launch_create_volume_details_volume_creation_type
        }
         use_chap = var.instance_launch_volume_attachments_use_chap
        volume_id = oci_core_volume.test_volume.id
    }
     
    agent_config {
      plugins_config {
            #Required
            desired_state = "STOP"
            name = "oracle_linux-image"
            
        }
        size_in_gbs = "6"
        volume_creation_type = ""
        type = "iscsi"
    } 

    #cluster_placement_group_id = oci_identity_group.test_group.id
    #compute_cluster_id = oci_core_compute_cluster.test_compute_cluster.id
    platform_config {
       type = var.instance_platform_config_type
    }

    preemptible_instance_config {
        preemption_action {
            type = var.instance_preemptible_instance_config_preemption_action_type
        }
    }
    # Optional
    display_name = "oracle_linux-image"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.test_subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("c:\\users\\joaomeira\\.ssh\\id_rsa\\joaokey.pub")
    } 


    preserve_boot_volume = false
}
*/
module "instance_nonflex" {
  # source = "git::https://github.com/oracle-terraform-modules/terraform-oci-compute-instance" ## use this to test directly from Github HEAD
  source = "oracle-terraform-modules/compute-instance/oci"
  # general oci parameters
  compartment_ocid = var.compartment_ocid
  freeform_tags    = var.freeform_tags
  defined_tags     = var.defined_tags
  # compute instance parameters
  ad_number             = var.instance_ad_number
  instance_count        = var.instance_count
  instance_display_name = var.instance_display_name
  instance_state        = var.instance_state
  shape                 = var.shape
  source_ocid           = var.source_ocid
  source_type           = var.source_type
  #cloud_agent_plugins   = var.cloud_agent_plugins
  # operating system parameters
  ssh_public_keys = file("c:\\users\\joaomeira\\.ssh\\id_rsa\\joaokey.pub")
  # networking parameters
  public_ip            = var.public_ip # NONE, RESERVED or EPHEMERAL
  subnet_ocids         = [oci_core_subnet.test_subnet.id]
  primary_vnic_nsg_ids = null
  # storage parameters
  boot_volume_backup_policy  = var.boot_volume_backup_policy
  block_storage_sizes_in_gbs = var.block_storage_sizes_in_gbs

     
   
}
