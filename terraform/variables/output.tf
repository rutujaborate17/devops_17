output "public_ip"{
    value =aws_instance.public_instance.public_ip
}

output "private_ip"{
    value =aws_instance.private_instance.private_ip
}

output "instance_id_private" {
    value =aws_instance.private_instance.id
}

output "instance_id_public"{
    value =aws_instance.public_instance.id
}

output "key" {
    value =aws_instance.private_instance.key_name
  
}
