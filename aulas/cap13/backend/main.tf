provider "aws" {
  region = "us-east-2"

}


resource "aws_s3_bucket" "state" {
  bucket        = "tf-backend-curso533"
  force_destroy = true

  tags = {
    Name      = "tf-backend-curso533"
    ManagedBy = "terraform"
  }

}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_dynamodb_table" "lock" {
  name         = "tf-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name      = "tf-state-lock"
    ManagedBy = "terraform"
  }
}