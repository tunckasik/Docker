output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "ssh_connection" {
  value =  "ssh -i ${var.ssh_private_key_path}/${var.ssh_key_name}.pem ${var.user_type}@${aws_instance.ec2.public_ip}"

}