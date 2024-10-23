variable "vpc_cidr_block"{
    type =string
}

variable "subnet_cidr_block"{
    type =list(string)
}

variable "az"{
    type =list(string)
}

variable "ami_id"{
    type =string
}

variable "port_no" {
    type =list(number)
}


variable "instance_type" {
    type =list(string)
}


variable "key" {
    type =string
}
