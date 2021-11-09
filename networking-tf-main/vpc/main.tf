##############
# Create VPC #
##############

module "vpc" {
  #Get information in terraform module
  source = "terraform-aws-modules/vpc/aws" 

  name = "<company>-vpc-hml" #Nome da VPC

  cidr = "10.1.0.0/16" #CIDR Block

  azs             = ["us-east-1a", "us-east-1b"] 
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24"]

  enable_nat_gateway   =  true
  single_nat_gateway   =  true    # Cria uma route table para as duas subnets privadas e adicion 
  reuse_nat_ips        =  false    # <= Pular a criação de EIPs para os Gateways NAT 

  # Para que os recursos subnet, routetable e outros peguem o nome publico ou privado o Name nas Tags não pode ser declarado
  tags = {
    Owner = "<company>"
    CreteadBy = "Felipe Santos"
    Creator = "Dati"
    Dati-ticket = 00000
    Provisioned = "Terraform"
    Sustained = "Terraform"
    Environment = "hml"
    Product = "VPC"
  }
}