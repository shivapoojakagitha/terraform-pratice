
resource "aws_instance" "dev" {
    ami = data.aws_ami.linux.id
    instance_type ="t2.micro"
    subnet_id = data.aws_subnet.selected.id
    key_name = "key"
    tags = {
      Name = "datasource"
    }
     associate_public_ip_address = true
}