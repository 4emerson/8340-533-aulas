provider "aws" {
  region = "us-east-2"

}

terraform {
  backend "s3" {
    bucket         = "tf-backend-curso533"
    key            = "workspace/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tf-state-lock"
    encrypt        = true

  }
}