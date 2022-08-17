resource "aws_security_group" "workspace_sg" {
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PROJECT-SG-WORKSPACE"
  }
}

