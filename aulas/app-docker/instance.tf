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

  provisioner "local-exec" {
    command = <<EOF
    sleep 30
    ssh -o StrictHostKeyChecking=no \
    -i ${var.key_path}/${var.key_name}.pem \
    admin@${self.public_ip} \
    'sudo apt-get update -y && \
     sudo apt-get install ngixn -y && \
     sudo systemctl start nginx && \
     sudo apt-get install -y docker.io && \
     sudo systemctl start docker && \
     sudo docker run -d -p 8600:8080 pengbai/docker-supermario'
    EOF

  }
}

