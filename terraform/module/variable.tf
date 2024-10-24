
variable "vpc_cidr_block" {
    type =string
  
}

variable "subnet_cidr_block" {
    type = string
  
}

variable "az" {
    type = list(string)
  
}



variable "port_no" {
    type = list(number)
  
}


variable "ami" {
    type = string
  
}

variable "instance_type" {
    type = string
  
}



variable "key" {
    type = string
  
}
