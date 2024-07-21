                            
resource "aws_instance" "dev1" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "key"
    tags = {
      Name ="ec3-s3store"
    } 
}
  
