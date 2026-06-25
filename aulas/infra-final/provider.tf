provider "aws" {
    region = var.region
  
}
terraform {
  backend "s3" {
    bucket = "tf-backend-curso533"
    key = "iac-final/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tf-state-lock"
    encrypt = true
    
  }
}