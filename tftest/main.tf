provider "aws" {
  region = "ap-northeast-2"
}

data "aws_vpc" "test_vpc" {
  tags = {
    Name = "PROJECT-VPC"
  }
}

data "aws_subnet" "test_subnet" {
  filter {
    name = "tag:Name"
    values = ["MY-PUBLIC-SUBNET-A"]
  }
}

output "test" {
  value = data.aws_vpc.test_vpc.id
}

output "test2" {
  value = data.aws_subnet.test_subnet.id
}