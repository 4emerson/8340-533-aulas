resource "aws_instance" "minha-instancia" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.zone
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.docker-host-sg.id]
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = var.name
  }
}

resource "null_resource" "supermario_install" {
  triggers = {
    instance_id = aws_instance.minha-instancia.id
    run         = "1"
  }

  provisioner "local-exec" {
    command = <<EOF
sleep 30
ssh -o StrictHostKeyChecking=no \
    -i ${var.key_path}/${var.key_name}.pem \
    admin@${aws_instance.minha-instancia.public_ip} \
    'sudo apt install nginx -y ; command -v docker > /dev/null 2>&1 || (sudo apt-get update -y && sudo apt-get install -y docker.io) ; \
     sudo systemctl start docker ; \
     if sudo docker ps -a --format "{{.Names}}" | grep -q "^supermario$"; then \
       echo "Container supermario ja existe, pulando..."; \
     else \
       sudo docker run -d --name supermario -p 8600:8080 pengbai/docker-supermario; \
     fi'
EOF
  }

  depends_on = [aws_instance.minha-instancia]
}

