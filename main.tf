##3 ftstate
 ##subir el archivo de estado a un bucket de s3
 terraform {
    backend "s3" {
        bucket         = "webinar-terraform-caosbinario-123asd123asd123"
        key            = "TerPractica2/terraform.tfstate"
        region         = "us-east-1"
    }
 }
##MODULOS

 module "nginx_server_dev" {
    source = "./nginx_server_module"

    ami_id = "ami-0e449927258d45bc4"  
    instance_type = "t3.medium"
    server_name = "nginx-server-dev"
    environment = "dev"
    
 }

  module "nginx_server_qa" {
    source = "./nginx_server_module"

    ami_id = "ami-0e449927258d45bc4"  
    instance_type = "t3.small"
    server_name = "nginx-server-qa"
    environment = "qa"
    
 }

 ##OUTPUTS DE DEV
output "nginx_dev_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value = module.nginx_server_dev.server_public_ip
  
}

output "nginx_dev_dns" {
  description = "Nombre DNS público de la instancia EC2"
  value = module.nginx_server_dev.server_public_dns
  
}

 ##OUTPUTS DE QA
output "nginx_qa_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value = module.nginx_server_qa.server_public_ip
  
}

output "nginx_qa_dns" {
  description = "Nombre DNS público de la instancia EC2"
  value = module.nginx_server_qa.server_public_dns
  
}

##import

# aws_instance.server-web:
resource "aws_instance" "server-web" {
    ami                                  = "ami-0e449927258d45bc4"
    instance_type                        = "t2.medium"
    tags = {
      Name = "server-web"
      Environment = "test"
      Owner = "Jhonpaca@gmail.com"
      team = "DevOps"
      Project = "webinar"
    }
    vpc_security_group_ids               = [
        "sg-0e0fd118ac12d0d62",
    ]

}