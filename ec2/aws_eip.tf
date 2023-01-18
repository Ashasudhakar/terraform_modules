resource "aws_eip" "lb" {
  count  = var.enable_eip ? 1 : 0

  instance = aws_instance.this.id
  vpc      = true
}