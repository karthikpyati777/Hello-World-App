output "jenkins_public_ip" {
  description = "Public IP of Jenkins EC2"
  value       = aws_instance.jenkins.public_ip
}

# output "jenkins_public_dns" {
#   description = "Public DNS of Jenkins EC2"
#   value       = aws_instance.jenkins.public_dns
# }

output "eks_public_ip" {
  description = "Public IP of EKS Host EC2"
  value       = aws_instance.k8s.public_ip
}

# output "eks_public_dns" {
#   description = "Public DNS of EKS Host EC2"
#   value       = aws_instance.k8s.public_dns
# }
