output "name" {
  value = aws_instance.this.tags["Name"]
}