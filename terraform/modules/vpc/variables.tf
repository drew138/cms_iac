variable "vpc_name" {
  type        = string
  description = "vpc name"
}

variable "az_1" {
  type        = string
  description = "availability zone 1"
}

variable "az_2" {
  type        = string
  description = "availability zone 2"
}

variable "vpc_cidr_block" {
  type        = string
  description = "vpc cidr block"
}

variable "public_subnet_cidr_az_1_1" {
  type        = string
  description = "public subnet 1 cidr block availability zone 1"
}

variable "public_subnet_cidr_az_2_2" {
  type        = string
  description = "public subnet 2 cidr block availability zone 2"
}

variable "private_subnet_cidr_az_1_1" {
  type        = string
  description = "private subnet 1 cidr block availability zone 1"
}

variable "private_subnet_cidr_az_2_2" {
  type        = string
  description = "private subnet 2 cidr block availability zone 2"
}

variable "private_subnet_cidr_az_1_3" {
  type        = string
  description = "private subnet 3 cidr block availability zone 1"
}

variable "private_subnet_cidr_az_2_4" {
  type        = string
  description = "private subnet 4 cidr block availability zone 2"
}
