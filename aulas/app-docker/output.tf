output "ec2_name" {
  description = "Output para o nome da maquina virtual"
  value       = aws_instance.minha-instancia.tags["Name"]

}

output "ip_publico" {
  description = "Output para o ip publico da maquina virtual"
  value       = aws_instance.minha-instancia.public_ip

}

output "ip_privado" {
  description = "Output para o ip privado da maquina virtual"
  value       = aws_instance.minha-instancia.private_ip

}

output "supermario_url" {
    value = "http://${aws_instance.minha-instancia.public_ip}:8600"
    description = "Output para a url do super mario"
  
}