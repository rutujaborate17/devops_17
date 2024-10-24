resource "aws_vpc" "net" {
    cidr_block = var.vpc_cidr_block
    tags = {
      Name ="vpc_1"
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.net.id
    cidr_block = var.subnet_cidr_block
    availability_zone =var.az[1]
    map_public_ip_on_launch = "true"
    tags = {
      Name ="public_subnet"
    }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.net.id
    tags = {
      Name ="internet_gateway"
    }
  
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.net.id
    tags = {
      Name ="route_table"
    }


    route {
        gateway_id = aws_internet_gateway.igw.id
        cidr_block ="0.0.0.0/0"
    }  
}

resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.net.id
    tags = {
      Name ="security_group"
    }

    ingress {
        from_port = var.port_no[1]
        to_port = var.port_no[1]
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    egress {
        from_port = var.port_no[0]
        to_port = var.port_no[0]
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
        
    }
  
}

