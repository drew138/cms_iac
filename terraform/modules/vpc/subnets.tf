resource "aws_subnet" "public_subnet_az_1_1" {
  vpc_id     = aws_vpc.cms_vpc.id
  cidr_block = var.public_subnet_cidr_az_1_1
  availability_zone = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-subnet-public1-${var.az_1}"
  }
}

resource "aws_subnet" "public_subnet_az_2_2" {
  vpc_id     = aws_vpc.cms_vpc.id
  cidr_block  = var.public_subnet_cidr_az_2_2
  availability_zone = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-subnet-public2-${var.az_2}"
  }
}

resource "aws_subnet" "private_subnet_az_1_1" {
  vpc_id     = aws_vpc.cms_vpc.id
  cidr_block  = var.private_subnet_cidr_az_1_1
  availability_zone = var.az_1

  tags = {
    Name = "${var.vpc_name}-subnet-public1-${var.az_1}"
  }
}

resource "aws_subnet" "private_subnet_az_2_2" {
  vpc_id     = aws_vpc.cms_vpc.id
  cidr_block  = var.private_subnet_cidr_az_2_2
  availability_zone = var.az_2

  tags = {
    Name = "${var.vpc_name}-subnet-public2-${var.az_2}"
  }
}

resource "aws_subnet" "private_subnet_az_1_3" {
  vpc_id     = aws_vpc.cms_vpc.id
  cidr_block  = var.private_subnet_cidr_az_1_3
  availability_zone = var.az_1

  tags = {
    Name = "${var.vpc_name}-subnet-public3-${var.az_1}"
  }
}

resource "aws_subnet" "private_subnet_az_2_4" {
  vpc_id     = aws_vpc.cms_vpc.id
  cidr_block  = var.private_subnet_cidr_az_2_4
  availability_zone = var.az_2

  tags = {
    Name = "${var.vpc_name}-subnet-public4-${var.az_2}"
  }
}
