module "vpc" {
  source     = "./modules/vpc"
  vpc_name = local.vpc_name
  az_1 = local.us_east_1a
  az_2 = local.us_east_1b
  vpc_cidr_block = local.vpc_cidr_block
  public_subnet_cidr_az_1_1 = local.public_subnet_cidr_az_1_1
  public_subnet_cidr_az_2_2 = local.public_subnet_cidr_az_2_2
  private_subnet_cidr_az_1_1 = local.private_subnet_cidr_az_1_1
  private_subnet_cidr_az_2_2 = local.private_subnet_cidr_az_2_2
  private_subnet_cidr_az_1_3 = local.private_subnet_cidr_az_1_3
  private_subnet_cidr_az_2_4 = local.private_subnet_cidr_az_2_4
}

module "bastion_host" {
  source     = "./modules/bastion_host"
  vpc_id = module.vpc.vpc_id
  instance_subnet_id = module.vpc.public_subnet_az_1_1_id
  ami = local.ami
}


module "auto_scaling_gruop" {
  source     = "./modules/auto_scaling_group"
  vpc_id = module.vpc.vpc_id
  subnet_ids = [module.vpc.public_subnet_az_1_1_id, module.vpc.public_subnet_az_2_2_id]
  cms_target_group_arn = module.elastic_load_balancer.cms_target_group_arn
  ami = var.aws_launch_template_ami_id
}

module "elastic_load_balancer" {
  source     = "./modules/elastic_load_balancer"
  vpc_id = module.vpc.vpc_id
  subnet_ids = [module.vpc.public_subnet_az_1_1_id, module.vpc.public_subnet_az_2_2_id]
}

module "rds" {
  source     = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  private_subnet_az_1_3_id = module.vpc.private_subnet_az_1_3_id
  private_subnet_az_2_4_id = module.vpc.private_subnet_az_2_4_id
  public_subnet_cidr_az_1_1 = local.public_subnet_cidr_az_1_1
  private_subnet_cidr_az_1_1 = local.private_subnet_cidr_az_1_1
  private_subnet_cidr_az_2_2 = local.private_subnet_cidr_az_2_2
}
