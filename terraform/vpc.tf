module "vpc" {
  source                = "terraform-aws-modules/vpc/aws"
  name                  = var.vpc_name
  cidr                  = var.vpc_cidr
  azs                   = var.vpc_azs
  enable_nat_gateway    = true
  enable_dns_hostnames  = true
}

resource "aws_subnet" "public_one" {
  vpc_id    = aws_vpc.ops_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "public_two" {
  vpc_id    = aws_vpc.ops_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "ops_vpc_igw" {
  vpc_id = aws_vpc.ops_vpc.id
}

resource "aws_route_table" "ops_vpc_east_1a_public" {
  vpc_id = aws_vpc.ops_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.ops_vpc_igw.id
  }
}

resource "aws_route_table_association" "ops_vpc_east_1a_public" {
    subnet_id = var.vpc_public_subnets.id
    route_table_id = aws_route_table.ops_vpc_east_1a_public.id
}

resource "aws_security_group" "inbound_ssh" {
  name        = "inbound_ssh_sg"
  description = "allows ssh inbound connections"
  vpc_id      = aws_vpc.ops_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
