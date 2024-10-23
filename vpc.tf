resource "aws_vpc" "net"{
    tags ={
        Name ="vpc_1"
    }
    cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.net.id
    tags ={
      Name ="public_subnet"
    }
   cidr_block = "192.168.0.0/21"
   availability_zone = "us-east-1a"
   map_public_ip_on_launch = "true"
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.net.id
    tags = {
      Name ="private_subnet"
    }
    cidr_block = "192.168.8.0/21"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = "false"
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.net.id
    tags ={
        Name ="Internet_gateway"
    }
  
}


resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.net.id
    tags ={
        Name ="Public_RT"
    }
  
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_eip" "elastic" {
  domain = "vpc"
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.elastic.id
  subnet_id = aws_subnet.public.id
  tags ={
    Name ="Nat_gateway"
  }
  
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.net.id
  tags = {
    Name ="RT_private"
  }
  

  route  {
    gateway_id = aws_nat_gateway.natgw.id
    cidr_block ="0.0.0.0/0"
  }
}


resource "aws_route_table_association" "private_rta" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
  
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.net.id
  name ="firewall"


  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "public_instance" {
  ami ="ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  key_name = "u"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids =[aws_security_group.sg.id]
  tags = {
    Name ="vm1"
  }
}

resource "aws_instance" "private_instance" {
  ami ="ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  key_name = "u"
  subnet_id =aws_subnet.private.id
  vpc_security_group_ids =[aws_security_group.sg.id]
  tags = {
    Name ="vm2"
  }
}
