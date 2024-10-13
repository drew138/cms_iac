resource "aws_vpc" "cms_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

resource "aws_internet_gateway" "cms_igw" {
  vpc_id = aws_vpc.cms_vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

