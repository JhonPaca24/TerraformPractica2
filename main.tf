provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "nginx-server" {
    ami           = "ami-0e449927258d45bc4" # AMI de Amazon Linux 2023
    instance_type = "t3.micro"
    
}
#otro mensaje 