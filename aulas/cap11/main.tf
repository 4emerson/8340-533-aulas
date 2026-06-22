module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  

  name = "modulo-publico-cap11"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"
  ami =  "ami-0e68dc81dc36750a1"

  instance_type = "t3.small"

  key_name      = "curso-533-key"
  monitoring    = false
  subnet_id     = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids = [module.security_group.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "security_group" {
  source = "terraform-aws-modules/security-group/aws"


  name        = "cap11"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = {
    https = {
      from_port   = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
      
    }
  }

  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  tags = {
    Environment = "dev"
  }
}


output "azs" {
    value = module.vpc.azs

}

output "public_subnets" {
    value = module.vpc.public_subnets
}
