variable "regiao" {
  description = "Variavel para a regiao do provider"
  type        = string
  default     = "us-east-2"
}


variable "zone" {
  description = "Variavel para a zona de disponibilidade"
  type        = string
  default     = "us-east-2b"
}

variable "ami" {
  description = "Variavel para a imagem da maquina virtual"
  type        = string
  default     = "ami-0e68dc81dc36750a1"
}

variable "instance_type" {
  description = "Variavel para tipo de instancia"
  type        = string
  default     = "t3.micro"

}


variable "associate_public_ip_address" {
  type        = bool
  description = "Variavel para associar ou nao um ip publico a maquina virtual"
  default     = true
}


variable "name" {
  description = "Variavel para o nome da maquina virtual"
  type        = string
  default     = "docker-host"

}


variable "portas_vm" {
  description = "Variavel para as portas da maquina virtual"
  type        = list(number)
  default     = [22, 8600]
}

variable "ips_permitidos" {
  description = "Variavel para os ips permitidos no security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]

}

variable "sg_name" {
  description = "Variavel para o nome do security group"
  type        = string
  default     = "docker-host-sg"

}

variable "key_name" {
  type        = string
  description = "Variavel para o nome da chave de acesso"
  default     = "curso-533-key"

}

variable "key_path" {
  type        = string
  description = "Variavel para o caminho da chave de acesso"
  default     = "~/Downloads"

}