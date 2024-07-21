module "gitsource" {
    source = "github.com/CloudTechDevOps/terraform-07-30am/day-2-basic_code_ec2"   
    ami_id ="ami-0ec0e125bb6c6e8ec"
    key_name ="key"
    instance_type ="t2.micro"
  
}

######git url ----https://github.com/CloudTechDevOps/terraform-07-30am/tree/main/day-2-basic_code_ec2
### modified url --"github.com/CloudTechDevOps/terraform-07-30am/day-2-basic_code_ec2"