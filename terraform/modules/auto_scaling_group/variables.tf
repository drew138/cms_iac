variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "subnet_ids" {
  type        = list(string)
  description = "private subnets 1 and 3 ids"
}

variable "cms_target_group_arn" {
  type        = string
  description = "target group arn"
}

variable "ami" {
  type        = string
  description = "ami id"
}

variable "template_subnet_id" {
  type        = string
  description = "template subnet id"
}
