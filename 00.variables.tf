variable "ami_id" {
  description = "ID de la AMI de Amazon Linux 2023"
  default     = "ami-0e449927258d45bc4" # AMI de Amazon Linux 2023
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t3.micro"
}

variable "server_name" {
  description = "Nombre del servidor web"
  default     = "nginx-server"
}

variable "environment" {
  description = "Ambiente de la instancia"
  default     = "test"
}