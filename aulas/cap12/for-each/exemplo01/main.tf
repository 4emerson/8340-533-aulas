provider "aws" {
  region = "us-east-2"
}

variable "ambientes" {
  type    = set(string)
  default = ["dev", "stg", "prd"]

}

resource "aws_s3_bucket" "this" {
  for_each = var.ambientes

  bucket = "meu-bucket-aula08-${each.key}"

  tags = {
    Name        = each.value
    Environment = each.key
  }
}