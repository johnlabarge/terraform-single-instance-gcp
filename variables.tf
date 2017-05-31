variable region {
  description = "Region for managed instance group"
  default = "us-central1"
}


variable compute_machine_type {
  description = "Machine type for the VMs in the instance group"
  default = "n1-standard-1"
}

variable compute_image {
  description = "Image used for compute VMs"
  default = "ubuntu-1604-xenial-v20170328"
}

variable compute_startup_script {
  description = "Startup script for compute node"
  default = "./scripts/compute.sh"
}

 