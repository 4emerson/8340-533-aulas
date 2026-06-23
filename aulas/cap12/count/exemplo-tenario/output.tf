output "instancia_tipo" {
  value = aws_instance.this.instance_type

}

output "instancia_az" {
  value = aws_instance.this.availability_zone

}

output "instancia_ip" {
  value = aws_instance.this.public_ip

}