data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["801119661308"]
}

resource "aws_security_group" "windows_security_group" {
  name        = "windows_instance_SG"
  description = "windows instance SG"

  ingress {
    description      = "http port for website1"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "http port for website2"
    from_port        = 81
    to_port          = 81
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "http port for website3"
    from_port        = 82
    to_port          = 82
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "RDP"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "windows_instance_SG"
  }
}

resource "aws_instance" "hosts" {
  count = var.counter
  ami           = data.aws_ami.windows.id
  instance_type = "t2.micro"
  security_groups = [var.security_group_name]
  availability_zone = element(var.availability_zones, "${count.index}")
  key_name = "windows-key"

  tags = {
    Name = "host${count.index + 1}"
    Env = "production"
  }
}