resource "aws_instance" "dev" {
    ami = "ami-0ec0e125bb6c6e8ec"
    key_name ="key"
    instance_type = "t2.micro"
    tags={
        Name ="instance"
    }
    lifecycle {
      create_before_destroy = true     ####it will create a instance before it destroy ####
    }
    
  
}