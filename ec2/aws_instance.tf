data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = var.instance_type

  tags = {
    Name = var.instance_name
  }
}