
module "EC2" {
    source = "./EC2"
    ami = var.ami
    instance_type = var.instance_type
    key = var.key
}


module "vpc" {
    source = "./vpc"
    vpc_cidr_block = var.vpc_cidr_block
    subnet_cidr_block = var.subnet_cidr_block
    az=var.az
    port_no = var.port_no
}
