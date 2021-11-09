############
# SG Batch #
############

module "sg_endpoint" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "<company>-sg-endpoint-hml"
  description = "PRD endpoing security Group"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  #ingress_cidr_blocks      = "${data.terraform_remote_state.vpc.outputs.vpc_cidr_block}"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp"]

  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "<company>-sg-endpoint-hml"
    Owner = "<company>"
    CreteadBy = "Felipe Santos"
    Creator = "Dati"
    Dati-ticket = 00000
    Provisioned = "Terraform"
    Sustained = "Terraform"
    Environment = "hml"
    Product = "SecurityGroup"
  }
}

