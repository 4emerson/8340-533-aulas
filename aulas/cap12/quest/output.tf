output "public_ip" {
  value = aws_instance.this[*].public_ip

}

output "workspace_atual" {
  value = terraform.workspace

}