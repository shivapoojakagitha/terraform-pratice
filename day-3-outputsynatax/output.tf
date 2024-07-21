output "instance_ip_public" {
    value = aws_instance.dev1.public_ip
  
}
output "instance_ip_private"{
value = aws_instance.prt.private_ip
sensitive = true        
}
#output "instance_ip_private"{
 #value = aws_instance.prt.private_ip    }  without senstive =true .it will shoe the privateip address.

