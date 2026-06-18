resource "aws_s3_bucket" "logs" {
    bucket = "meu-bucket-de-logs-123456789"

    tags = {
      Name = "meu-bucket"
      Environment = "Dev"

    }
  
}