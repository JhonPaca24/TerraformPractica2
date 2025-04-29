provider "aws" {
  region = "us-east-1"
}

#la instancia de EC2 de AWS

resource "aws_instance" "nginx-server" {
    ami           = "ami-0e449927258d45bc4" # AMI de Amazon Linux 2023
    instance_type = "t3.micro"
    
    user_data = <<-EOF
                #!/bin/bash
                sudo yum install -y nginx
                sudo systemctl enable nginx
                sudo systemctl start nginx
                EOF

    key_name = aws_key_pair.nginx-server-ssh.key_name
    vpc_security_group_ids = [aws_security_group.nginx-server-sg.id]
}

#para la clave ssh 
# ssh-keygen -t rsa -b 2048 -f "nginx-server.key"
resource "aws_key_pair" "nginx-server-ssh" {
  key_name = "nginx-server-ssh-2"
  public_key = file("nginx-server.key.pub")
}

resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
  description = "Security group allowing SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 #Acepta todos los puertos cuando es ta en 0 y 0 
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}