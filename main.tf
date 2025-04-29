 module "nginx_server_dev" {
    source = "./nginx_server_module"

    ami_id = "ami-0e449927258d45bc4"  
    instance_type = "t3.medium"
    server_name = "nginx-server-dev"
    environment = "dev"
    
 }