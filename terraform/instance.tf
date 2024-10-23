resource "aws_instance" "vm" {
    tags = {
      Name ="server"
    }
    ami ="ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name = "u"
    availability_zone = "us-east-1a"  
}
