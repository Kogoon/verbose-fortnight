# resource "aws_key_pair" "project-key" {
#   key_name = "projectkey"
#   public_key = file(var.PUB_KEY)
#}

# resource "aws_instance" "project-workspace" {
#   ami = var.AMIs[var.REGION]
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet_.
#   key_name = aws_key_pair
#   vpc_security_group_ids = []
#   tags = {
#     Name = ""
#}

# }