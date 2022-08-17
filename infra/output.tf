output "Project_VPC_ID" {
  value = aws_vpc.project_vpc.id
}

output "public_subnet_a_id" {
  value = aws_subnet.project_public_subnet_a.id
}

output "public_subnet_c_id" {
  value = aws_subnet.project_public_subnet_c.id
}

output "private_subnet_a_id" {
  value = aws_subnet.project_private_subnet_a.id
}

output "private_subnet_c_id" {
  value = aws_subnet.project_private_subnet_c.id
}