module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "vpc-${local.environment}"
  cidr = "10.0.0.0/16"

  azs             = ["${local.aws_region}a", "${local.aws_region}b", "${local.aws_region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_dns_hostnames    = true
  enable_nat_gateway      = true
  map_public_ip_on_launch = false
  single_nat_gateway      = true

  # cidr = "10.0.0.0/16"

  # azs              = ["${local.aws_region}a", "${local.aws_region}b"]
  # private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  # public_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]

  # enable_nat_gateway = false

  # enable_ipv6                     = true
  # assign_ipv6_address_on_creation = true

  # public_subnet_ipv6_prefixes   = [0, 1]
  # private_subnet_ipv6_prefixes  = [2, 3]


}
