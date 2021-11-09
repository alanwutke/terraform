####################
# ECR API ENDPOINT #
####################

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  service_name        = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [data.terraform_remote_state.securitygroup.outputs.sg_endpoint_id]
  subnet_ids          = [data.terraform_remote_state.vpc.outputs.private_subnet_a, data.terraform_remote_state.vpc.outputs.private_subnet_c ]
  policy = <<EOF
{
   "Statement":[
      {
         "Effect":"Allow",
         "Action":"*",
         "Resource":"*",
         "Principal":"*"
      }
   ]
}
EOF

  tags = {
    Name = "<company>-endpoint-ecr-api-hml"
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

####################
# ECR DKR ENDPOINT #
####################

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  service_name        = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [data.terraform_remote_state.securitygroup.outputs.sg_endpoint_id]
  subnet_ids          = [data.terraform_remote_state.vpc.outputs.private_subnet_a, data.terraform_remote_state.vpc.outputs.private_subnet_c]
  policy = <<EOF
{
   "Statement":[
      {
         "Effect":"Allow",
         "Action":"*",
         "Resource":"*",
         "Principal":"*"
      }
   ]
}
EOF

  tags = {
    Name = "<company>-endpoint-ecr-dkr-hml"
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

############################
# CloudWatch Logs ENDPOINT #
############################

resource "aws_vpc_endpoint" "logs" {
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  service_name        = "com.amazonaws.us-east-1.logs"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [data.terraform_remote_state.securitygroup.outputs.sg_endpoint_id]
  subnet_ids          = [data.terraform_remote_state.vpc.outputs.private_subnet_a, data.terraform_remote_state.vpc.outputs.private_subnet_c]
  policy = <<EOF
{
   "Statement":[
      {
         "Effect":"Allow",
         "Action":"*",
         "Resource":"*",
         "Principal":"*"
      }
   ]
}
EOF

  tags = {
    Name = "<company>-endpoint-logs-hml"
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

#######################
# S# GATEWAY ENDPOINT #
#######################

resource "aws_vpc_endpoint" "s3" {
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  service_name        = "com.amazonaws.us-east-1.s3"
  route_table_ids     = data.terraform_remote_state.vpc.outputs.route_table_id
#  vpc_endpoint_type   = "Gateway"
  policy = <<EOF
{
  "Version":"2008-10-17",
  "Statement":[
      {
        "Sid":"Access-to-specific-buckets",
        "Effect":"Allow",
        "Principal":"*",
        "Action":"s3:*",
        "Resource": "*"
      }
  ]
}
EOF

tags = {
    Name = "<company>-endpoint-s3-hml"
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