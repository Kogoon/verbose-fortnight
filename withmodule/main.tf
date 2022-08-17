provider "aws" {
    region = var.REGION
}

locals {
    cluster_name = "EKS-CLUSTER"
    name         = "eks-test"
    region       = var.REGION
}

#######################################
# VPC Module
#######################################

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "kogoon-test"
    cidr = "10.11.0.0/16"

    azs             = [var.ZONE_A, var.ZONE_C]
    public_subnets  = ["10.11.1.0/24", "10.11.2.0/24"]
    private_subnets = ["10.11.101.0/24", "10.11.102.0/24"]

    enable_nat_gateway     = true
    one_nat_gateway_per_az = true

    enable_dns_hostnames   = true

    public_subnet_tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "shared"
        "kubernetes.io/role/elb"                      = "1"
    }

    private_subnet_tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "shared"
        "kubernetes.io/role/internal-elb"             = "1"
    }
}

#######################################
# VPC Endpoints Module
#######################################