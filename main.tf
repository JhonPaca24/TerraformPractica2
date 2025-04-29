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