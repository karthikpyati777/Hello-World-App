


variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.medium"
}

variable "ami" {
  description = "Ubuntu 22.04 AMI ID"
  default     = "ami-0360c520857e3138f" # Change to your region's latest Ubuntu AMI
}

variable "key_name" {
  description = "SSH key pair name"
  default     = "karthikkey"
}

variable "disk_size" {
  description = "Root volume size in GB"
  default     = 30
}

variable "app_disk_size" {
  description = "Root volume size in GB for the second instance"
  default     = 12
}