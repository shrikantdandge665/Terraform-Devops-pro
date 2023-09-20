variable "cidr_ipv4" {
  default= ["0.0.0.0/0"]
}

variable "cidr_ipv6" {
  default = ["::/0"]
}

variable "instance_name" { type = string}

variable sg_name {
  type = string
  default = "test-sg"
}

variable "port_number" {
  description = "Enter 4 number for inbound ports"
  type = list(number)
}
