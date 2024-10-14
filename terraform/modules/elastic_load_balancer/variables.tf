variable "subnet_ids" {
  type        = list(string)
  description = "public subnets 1 and 2"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}
