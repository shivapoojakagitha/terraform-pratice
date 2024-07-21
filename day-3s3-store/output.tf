output "instance_ami" {
    value = aws_instance.dev1.ami

  
}
output "instance_public_ip" {
    value = aws_instance.dev1.public_ip

  
}
