resource "aws_instance" "dev1" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.dev1.id
    vpc_security_group_ids = [aws_security_group.dev1.id]
    tags = {
      Name ="module-local"
    } 
    associate_public_ip_address = true
}