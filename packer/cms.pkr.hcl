packer {
    required_plugins {
        amazon = {
            version = ">= 1.0.0"
            source  = "github.com/hashicorp/amazon"
        }
        ansible = {
          version = ">= 1.1.2"
          source  = "github.com/hashicorp/ansible"
        }
    }
}

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

variable "rds_host" {
    type = string
    description = "RDS host"
}

source "amazon-ebs" "wordpress" {
    ami_name      = "wordpress-${local.timestamp}"
    source_ami = "ami-005fc0f236362e99f" # Ubuntu 22.04
    region = "us-east-1"
    instance_type = "t2.micro"
    ssh_username = "ubuntu"
}


build {
    sources = ["source.amazon-ebs.wordpress"]
    provisioner "ansible" {
        playbook_file = "../ansible/playbook.yml"
        extra_arguments = ["--extra-vars", "rds_host=${var.rds_host}"]
    }
    post-processor "manifest" {
        output = "manifest.json"
        strip_path = true
    }
}
