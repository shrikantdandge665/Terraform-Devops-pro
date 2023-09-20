data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_map["web"]
  key_name = "linuxkey"
  vpc_security_group_ids = ["${aws_security_group.test-sg.id}"]

  tags = {
    Name = var.instance_name
  }
}

variable "instance_type_map" {
 type = map(string)
 default = {
  "web" = "t3.nano"
  "db" = "t3.micro"
  "devops" = "t2.micro"
 } 
  
}