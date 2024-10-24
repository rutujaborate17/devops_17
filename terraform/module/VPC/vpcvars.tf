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
