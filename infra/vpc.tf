### VPC START ###

resource "aws_vpc" "project_vpc" {
  cidr_block = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"

  tags = {
    Name = "PROJECT-VPC"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "project_public_subnet_a" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0]
  
  tags = {
    Name = "PROJECT-PUBLIC-SUBNET-A"
  }
}

resource "aws_subnet" "project_public_subnet_b" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "PRJECT-PUBLIC-SUBNET-B"
  }
}

resource "aws_subnet" "project_public_subnet_c" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "PRJECT-PUBLIC-SUBNET-C"
  }
}

resource "aws_subnet" "project_public_subnet_d" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.4.0/24"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[3]

  tags = {
    Name = "PRJECT-PUBLIC-SUBNET-D"
  }
}

resource "aws_subnet" "project_private_subnet_a" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.11.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "PROJECT-PRIVATE-SUBNET-A"
  }
}

resource "aws_subnet" "project_private_subnet_b" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.12.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "PROJECT-PRIVATE-SUBNET-B"
  }
}

resource "aws_subnet" "project_private_subnet_c" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.13.0/24"
  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "PROJECT-PRIVATE-SUBNET-C"
  }
}

resource "aws_subnet" "project_private_subnet_d" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.1.14.0/24"
  availability_zone = data.aws_availability_zones.available.names[3]

  tags = {
    Name = "PROJECT-PRIVATE-SUBNET-D"
  }
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id
  
  tags = {
    Name = "PROJECT-IGW"
  }
}

resource "aws_route_table" "project_public_rtb" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }
  
  tags = {
    Name = "PROJECT-PUBLIC-RTB"
  }
}

resource "aws_route_table" "project_private_rtb" {
  vpc_id = aws_vpc.project_vpc.id

  route = []
  
  tags = {
    Name = "PROJECT-PRIVATE-RTB"
  }
}


resource "aws_route_table_association" "project_public_subnet_a_association" {
  subnet_id = aws_subnet.project_public_subnet_a.id
  route_table_id = aws_route_table.project_public_rtb.id
}

resource "aws_route_table_association" "project_public_subnet_b_association" {
  subnet_id = aws_subnet.project_public_subnet_b.id
  route_table_id = aws_route_table.project_public_rtb.id
}

resource "aws_route_table_association" "project_public_subnet_c_association" {
  subnet_id = aws_subnet.project_public_subnet_c.id
  route_table_id = aws_route_table.project_public_rtb.id
}

resource "aws_route_table_association" "project_public_subnet_d_association" {
  subnet_id = aws_subnet.project_public_subnet_d.id
  route_table_id = aws_route_table.project_public_rtb.id
}

resource "aws_route_table_association" "project_private_subnet_a_association" {
  subnet_id = aws_subnet.project_private_subnet_a.id
  route_table_id = aws_route_table.project_private_rtb.id
}

resource "aws_route_table_association" "project_private_subnet_b_association" {
  subnet_id = aws_subnet.project_private_subnet_b.id
  route_table_id = aws_route_table.project_private_rtb.id
}

resource "aws_route_table_association" "project_private_subnet_c_association" {
  subnet_id = aws_subnet.project_private_subnet_c.id
  route_table_id = aws_route_table.project_private_rtb.id
}

resource "aws_route_table_association" "project_private_subnet_d_association" {
  subnet_id = aws_subnet.project_private_subnet_d.id
  route_table_id = aws_route_table.project_private_rtb.id
}

### VPC END ###
