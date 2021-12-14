resource "aws_vpc" "hello-world-vpc" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Hello World VPC"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.hello-world-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "Public Subnet us-east-2a"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.hello-world-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "Public Subnet us-east-2b"
  }
}

resource "aws_subnet" "subnet_3" {
  vpc_id     = aws_vpc.hello-world-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2c"

  tags = {
    Name = "Public Subnet us-east-2c"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.hello-world-vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "rt_public" {
    vpc_id = aws_vpc.hello-world-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "Public Subnet Route Table"
    }
}

resource "aws_route_table_association" "rt_1" {
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_2" {
    subnet_id = aws_subnet.subnet_2.id
    route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_3" {
    subnet_id = aws_subnet.subnet_3.id
    route_table_id = aws_route_table.rt_public.id
}
