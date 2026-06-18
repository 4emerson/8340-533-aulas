variable "regiao" {
    description = "Variavel para a regiao do provider"
    type = string
    default = "us-east-2"
}


variable "zone" {
    description = "Variavel para a zona de disponibilidade"
    type = string
    default = "us-east-2c"
}

variable "ami" {
    description = "Variavel para a imagem da maquina virtual"
    type = string
    default = "ami-0e68dc81dc36750a1"
}

variable "instance_type" {
    description = "Variavel para tipo de instancia"
    type = string
    default = "t3.small"
  
}

# variable "instance_type" {
#     type = map(string)
#     description = "Tamanho de instancias por ambiente"
#     default = {
#       dev = "t3.micro"
#       hmg = "t3.small"
#       prod = "t3.medium"
#     }
  
# }



variable "associate_public_ip_address" {
    type = bool
    description = "Variavel para associar ou nao um ip publico a maquina virtual"
    default = false
}


variable "name" {
    description = "Variavel para o nome da maquina virtual"
    type = string
    default = "vm-vars"
  
}

variable "cidr_block_vpc" {
    description = "Variavel para o bloco de rede da VPC"
    type = string
    default = "10.0.0.0/16"
  
}

variable "cidr_block_subnet" {
    description = "Variavel para o bloco de rede da Subnet"
    type = string
    default = "10.0.1.0/24"
  
}

variable "disk_ebs_size" {
    description = "Variavel para o tamanho do disco EBS"
    type = number
    default = 10
  
}

variable "disk_ebs_name" {
    description = "Variavel para o nome do disco EBS"
    type = string
    default = "disco-vm-vars"
  
}

variable "portas_vm" {
    description = "Variavel para as portas da maquina virtual"
    type = list(number)
    default = [22, 80, 443]
}

variable "ips_permitidos" {
    description = "Variavel para os ips permitidos no security group"
    type = list(string)
    default = ["0.0.0.0/0"]
  
}

variable "sg_name" {
    description = "Variavel para o nome do security group"
    type = string
    default = "minha-sg-vars"
  
}