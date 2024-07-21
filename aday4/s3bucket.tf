###################### create s3 bucket #############

 resource "aws_s3_bucket" "store" {
    bucket = "bucket81799"
   
 }
 resource "aws_dynamodb_table" "test" {
    name ="dynamo_s3_store"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity =20

    attribute{
        name = "LockID"

        type="S"
       
    }
   
 }