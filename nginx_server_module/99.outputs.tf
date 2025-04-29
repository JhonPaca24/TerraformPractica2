##OUTPUTS
output "server_public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value = aws_instance.nginx-server.public_ip
  
}

output "server_public_dns" {
  description = "Nombre DNS público de la instancia EC2"
  value = aws_instance.nginx-server.public_dns
  
}