output "ec2_name" {
    description = "Output para o nome da maquina virtual"
    value = aws_instance.minha-instancia.tags["Name"]
  
}

output "ip_publico" {
    description = "Output para o ip publico da maquina virtual"
    value = aws_instance.minha-instancia.public_ip
  
}

output "ip_privado" {
    description = "Output para o ip privado da maquina virtual"
    value = aws_instance.minha-instancia.private_ip
  
}

output "vpc_id" {
    description = "Output para o id da VPC"
    value = aws_vpc.ex-vars.id
  
}

output "subnet_id" {
    description = "Output para o id da Subnet"
    value = aws_subnet.ex-vars.id
  
}

output "ebs_size" {
    description = "Output para o tamanho do disco da maquina virtual"
    value = aws_ebs_volume.meu-disco.size
  
}