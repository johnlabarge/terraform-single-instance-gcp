

resource "google_compute_instance_template" "compute" {
  name_prefix = "compute-"

  machine_type = "${var.compute_machine_type}"

  region = "${var.region}"

  tags = [
    "allow-ssh",
    "allow-service"
  ]

  network_interface {
    network = "default"
    access_config { 
      
    }
  }

  disk {
    auto_delete = true
    boot = true
    source_image = "${var.compute_image}"
    type = "PERSISTENT"
    disk_type = "pd-ssd"
  }

  service_account {
    email = "default"
    scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/devstorage.full_control"
    ]
  }

  metadata {
    startup-script = "${var.compute_startup_script}"
  }

  lifecycle {
    create_before_destroy = true
  }
}



