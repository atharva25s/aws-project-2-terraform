# VPC
resource "aws_vpc" "test-vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform-vpc"
  }
}

# Subnet 
resource "aws_subnet" "test-subnet" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "terraform-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "test-gw" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "terraform-igw"
  }
}

# Route Table and Routes and Association
resource "aws_route_table" "test-rt" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "terraform-rt"
  }
}

resource "aws_route" "test-route" {
  route_table_id            =  aws_route_table.test-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.test-gw.id
}

resource "aws_route_table_association" "test-asso" {
  subnet_id      = aws_subnet.test-subnet.id
  route_table_id = aws_route_table.test-rt.id
}