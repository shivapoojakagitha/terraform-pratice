resource "aws_instance" "name" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    associate_public_ip_address = true
    count = 3
    tags = {
      Name ="count"
    }
}

#####  three instance will create at same name #### .....count,count,count.......result