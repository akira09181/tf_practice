resource "aws_vpc" "vpc" {
  cidr_block                       = "10.0.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name    = "${var.envionment}monosc-vpc-link"
    Env     = var.envionment
  }
}
resource "aws_vpc" "vpc_iot" {
  cidr_block                       = "10.49.92.0/26"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name    = "${var.envionment}monosc-vpc-iot"
    Env     = var.envionment
  }
}


resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.0.0.0/26"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az4-link-pub"   
    Env     = var.envionment
    Type    = "public"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "10.0.0.64/26"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az1-link-pub"
    Env     = var.envionment
    Type    = "public"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.0.1.64/26"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az1-link-pri-01"
    Env     = var.envionment
    Type    = "private"
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "10.0.2.0/26"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az1-link-pri-02"
    Env     = var.envionment
    Type    = "private"
  }
}

resource "aws_subnet" "private_subnet4_1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.0.1.0/26"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az4-link-pri-01"
    Env     = var.envionment
    Type    = "private"
  }
}
resource "aws_subnet" "private_subnet4_1a_2" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.0.1.128/26"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az4-link-pri-02"
    Env     = var.envionment
    Type    = "private"
  }
}
resource "aws_subnet" "private_subnet_iot_1c" {
  vpc_id                  = aws_vpc.vpc_iot.id
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "10.49.92.32/27"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az1-iot-pri-01"
    Env     = var.envionment
    Type    = "private"
  }
}
resource "aws_subnet" "private_subnet_iot_1a" {
  vpc_id                  = aws_vpc.vpc_iot.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.49.92.0/27"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.envionment}monosc-sn-az1-iot-pri-02"
    Env     = var.envionment
    Type    = "private"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${var.envionment}monosc-public_rt"
    
    Env     = var.envionment
    Type    = "public"
  }
}

resource "aws_route_table_association" "public_rt_1a" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet_1a.id
}

resource "aws_route_table_association" "public_rt_1c" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet_1c.id
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${var.envionment}monosc-private_rt"
    
    Env     = var.envionment
    Type    = "private"
  }
}
resource "aws_route_table_association" "private_rt_1a" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_subnet_1a.id
}

resource "aws_route_table_association" "private_rt_1c" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_subnet_1c.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${var.envionment}monosc-igw"
    
    Env     = var.envionment
  }
}

resource "aws_route" "public_rt_igw_r" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}