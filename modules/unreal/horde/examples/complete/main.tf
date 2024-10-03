data "aws_availability_zones" "available" {}

terraform {
  backend "s3" {
    bucket         = "horde-tfstate-s3"
    key            = ".terraform/terraform.tfstate"
    region         = "eu-central-1"
  }
}

locals {
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                  = slice(data.aws_availability_zones.available.names, 0, 2)
  tags                 = {}
}

module "unreal_engine_horde" {
  source                            = "../../"
  unreal_horde_service_subnets      = aws_subnet.private_subnets[*].id
  unreal_horde_external_alb_subnets = aws_subnet.public_subnets[*].id  # External ALB used by developers
  unreal_horde_internal_alb_subnets = aws_subnet.private_subnets[*].id # Internal ALB used by agents
  vpc_id                            = aws_vpc.unreal_engine_horde_vpc.id
  certificate_arn                   = aws_acm_certificate.unreal_engine_horde.arn
  github_credentials_secret_arn     = var.github_credentials_secret_arn
  tags                              = local.tags

  fully_qualified_domain_name = "horde.${var.root_domain_name}"

  depends_on = [aws_acm_certificate_validation.unreal_engine_horde]
}
