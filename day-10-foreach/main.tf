variable "ami" {
  type    = string
  default = "ami-0ec0e125bb6c6e8ec"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "lock" {
  type    = list(string)
  default = ["t1","t2"]
}


resource "aws_instance" "lock" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = toset(var.lock)
#   count = length(var.sandboxes)
  tags = {
    Name = each.value    # for a set---each.value and each.key is the same
  }
}