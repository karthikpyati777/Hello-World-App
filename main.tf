

provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true


  root_block_device {
    volume_size = var.disk_size
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io wget -y
              
              # Add Jenkins user to docker group
              useradd -m jenkins
              usermod -aG docker jenkins
              
              # Install Jenkins
              wget https://raw.githubusercontent.com/akshu20791/Deployment-script/main/jenkins.sh
              chmod +x jenkins.sh
              ./jenkins.sh
              EOF

  tags = {
    Name = "Jenkins-Docker-EC2"
  }
}

resource "aws_instance" "k8s" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true


  root_block_device {
    volume_size = var.app_disk_size
  }

  tags = {
    Name = "EKS-HOST-MACHINE"
  }
}
