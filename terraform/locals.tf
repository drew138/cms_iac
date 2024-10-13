locals {
    us_east_1a = "us-east-1a"
    us_east_1b = "us-east-1b"
    vpc_name = "CMS"
    vpc_cidr_block = "172.16.0.0/16"
    public_subnet_cidr_az_1_1 = "172.16.1.0/24"
    public_subnet_cidr_az_2_2 = "172.16.4.0/24"
    private_subnet_cidr_az_1_1 = "172.16.2.0/24"
    private_subnet_cidr_az_2_2 = "172.16.5.0/24"
    private_subnet_cidr_az_1_3 = "172.16.3.0/24"
    private_subnet_cidr_az_2_4 = "172.16.6.0/24"
    ami = "ami-005fc0f236362e99f" # Ubuntu Server 22.04 LTS (HVM), SSD Volutme Type. Free tier elegible."
}
