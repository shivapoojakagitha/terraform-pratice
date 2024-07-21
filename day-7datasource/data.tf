data "aws_ami" "linux" {
    most_recent = true
    owners = [ "amazon" ]
     filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  } 
    filter{
        name = "root-device-type"
        values = [ "ebs" ]
    } 
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
    filter {
      name = "architecture"
      values = [ "x86_64" ]
    }
}
data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["vpc-cust-public"]    ##### select cust /alredy existing vpc
  }
}

data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"
    values = ["subnet-cust-public"] ##### select cust /alredy existing subnet name 
  }
}

