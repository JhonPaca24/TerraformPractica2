#para la clave ssh 
# ssh-keygen -t rsa -b 2048 -f "nginx-server.key"
resource "aws_key_pair" "nginx-server-ssh" {
  key_name = "${var.server_name}-ssh-2"
  public_key = file("${var.server_name}.key.pub")

  tags = {
      Name = "${var.server_name}-ssh-2"
      Environment = "${var.environment}"
      Owner = "Jhonpaca@gmail.com"
      team = "DevOps"
      Project = "webinar"
    }
}