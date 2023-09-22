variable "cidr_ipv4" {
  default= ["0.0.0.0/0"]
}

variable "cidr_ipv6" {
  default = ["::/0"]
}

variable "instance_name" {
  type = list(string)
  default = [ "web-instance", "db-instance", "devops-instance" ]

}

variable sg_name {
  type = string
  default = "test-sg"
}

variable "port_number" {
  description = "Enter 4 number for inbound ports"
  type = list(number)
}

variable "instance_type_map" {
 type = map(string)
 default = {
  "web-instance" = "t2.nano"
  "db-instance" = "t3.micro"
  "devops-instance" = "t2.small"
 } 
  
}