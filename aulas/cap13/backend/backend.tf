terraform {
  backend "s3" {
    bucket = "tf-backend-curso533"
    key = "terraform/state/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tf-state-lock"
    encrypt = true
    
  }
}