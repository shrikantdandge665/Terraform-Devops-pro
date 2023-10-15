resource "aws_security_group" "test-sg" {
  name        = "test-sg"
  description = "Allow http and inbound traffic"
   vpc_id      = "vpc-0a4b4aebbb3267b4e"

  dynamic "ingress" {
    for_each = [80, 443, 22, 8080]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_ipv4
      ipv6_cidr_blocks =  var.cidr_ipv6
    }
  }

  dynamic "egress" {
    for_each = [22, 80, 9090, 443, 8080, 1443]

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_ipv4
      ipv6_cidr_blocks =  var.cidr_ipv6
    }
  }
}

output "security_group_id" {
    value = "aws_security_group.test-sg.id"
    description = "id of security group"
  }