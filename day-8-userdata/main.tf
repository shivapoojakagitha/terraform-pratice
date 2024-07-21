resource "aws_instance" "name" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
      Name ="userdata"
    }
    associate_public_ip_address = true
    user_data = file("script.sh")
}