terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "minikube" {
  ami             = "ami-0dc2d3e4c0f9ebd18"
  instance_type   = "t2.nano"
  key_name        = "cap_abi"
  subnet_id       = var.subnet_id

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker.io",
      "curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
      "sudo install minikube-linux-amd64 /usr/local/bin/minikube",
      "minikube start --driver=docker"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)  
      host        = self.public_ip
      agent       = false
      timeout     = "5m"
    }
  }

  tags = {
    Name = "MinikubeInstance"
  }
}

output "instance_public_ip" {
  value = aws_instance.minikube.public_ip
}
