output "ec2_ip" {
  value = aws_instance.ec2.public_ip
}

output "db_hostname" {
  value = aws_db_instance.db.address
}