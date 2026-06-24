variable "nome" {
  type        = string
  description = "Nome da instancia"

}

variable "ami" {
  type        = string
  description = "Nome da AMI"

}

variable "instance_type" {
  type        = string
  description = "Tamanho da instancia"
}

variable "quantidade" {
  type        = number
  description = "Quantidade de instancias"

}