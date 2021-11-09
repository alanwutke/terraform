###########
# Backend #
###########

provider "aws" {
  region = "us-east-1" # Região dos recursos
}

terraform {
  #required_version = "~> 0.14.7"

  backend "s3" {
    region = "us-east-1" # Região ddo bucket
    bucket = "<id-da-conta>-dati.tfstate" # Criar um bucket com o mesmo nome.
    key    = "us-east-1/prd/network/securitygroup/terraform.tfstate" # Estrutura de diretório para o tfstate
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "us-east-1" # Região ddo bucket
    bucket = "<id-da-conta>-dati.tfstate" # Criar um bucket com o mesmo nome.
    key    = "us-east-1/prd/network/vpc/terraform.tfstate" # Estrutura de diretório para o tfstate
  }
}
