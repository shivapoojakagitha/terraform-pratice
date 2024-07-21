##############   statefile in to s3 ##############
terraform {
 backend "s3" {
    bucket = "bucket81799"
    key = "day3/terraform.tfstate"
    region = "ap-south-1"
   
 }
}


/*1. always s3bucket should create first  and it shoud not be in same folder  with backendconfigure.even same dynamidb .
 2. to excute the backend configure file must create dynamodbtable and s3 bucket then it will take refrence to backendconfigure file.
 3. go to folder aday4  and write /create as3bucket and dyanomadb in same file and excute terraform init,terraform plan,terraform apply-auto-approve
 4.then come to backenconfigue file folder and apply terraform commands [terraform init,terraform plan,terraform apply-auto-approve] 
5. IN THIS WE ARE ONLY SENDING TERRAFORM.TFVARS TO STORE IN S3 BUCKET 
*/