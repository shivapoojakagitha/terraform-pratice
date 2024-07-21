resource "aws_instance" "name" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    associate_public_ip_address = true
    count = length(var.loc)
    tags = {
      Name = var.loc[count.index]
    }
}
variable "loc" {
  type = list(string)
  default = [ "t1","t3" ]
  
}

