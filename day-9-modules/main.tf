module "dev1" {
    source = "../day-8template-instance"
    ami_id = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "key" 
}