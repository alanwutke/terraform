#
# BACKEND
#

provider "aws" {
  region = "us-east-1" # Região dos recursos
}

terraform {
  #required_version = "~> 0.14.7" #Put your terraform version here

  backend "s3" {
    region = "us-east-1" # Região ddo bucket
    bucket = "<id-da-conta>-dati.tfstate" # Criar um bucket com o mesmo nome.
    key    = "us-east-1/prd/network/vpc/terraform.tfstate" # Estrutura de diretório para o tfstate
  }
}
