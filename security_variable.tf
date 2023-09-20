resource "aws_security_group" "test-sg" {
  name        = "allow_http_ssh"
  description = "Allow http and inbound traffic"
  vpc_id      = "vpc-0a4b4aebbb3267b4e"

  ingress {
    description      = "Http from VPC"
    from_port        = var.port_number[0]
    to_port          = var.port_number[0]
    protocol         = "tcp"
    cidr_blocks      = var.cidr_ipv4
    ipv6_cidr_blocks =  var.cidr_ipv6
  }
 ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      =  var.cidr_ipv4
    ipv6_cidr_blocks =  var.cidr_ipv6
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_ipv4
    ipv6_cidr_blocks = var.cidr_ipv6
  }

  tags = {
    Name = "allow_http_ssh"
  }

}

output "security_group_id" {
    value = "aws_security_group.test-sg.id"
    description = "id of security group"
  }