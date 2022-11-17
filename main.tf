provider "aws" {
  region     = "eu-central-1"
  access_key = ""
  secret_key = ""
}

provider "aws" {
  alias      = "cac1"
  region     = "ca-central-1"
  access_key = ""
  secret_key = ""
}
//vpc_dev1 -------------------------------------------

module "vpc_dev1" {
  //source               = "git@github.com:elbakya/modules.git//."
  source               = "./module"
  providers            = { aws = aws.cac1 }
  env                  = "development"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.10.0/24"]
  private_subnet_cidrs = []
}

//vpc_dev2-------------------------------------------

module "vpc_dev2" {
  //source               = "git@github.com:elbakya/finnal_modules.git//."
  source               = "./module"
  env                  = "production"
  vpc_cidr             = "10.2.0.0/16"
  public_subnet_cidrs  = ["10.2.10.0/24"]
  private_subnet_cidrs = ["10.2.20.0/24"]
}

// Peering -------------------------------------------
module "Peering_connection" {
  source           = "./peering"
  providers        = { aws = aws.cac1 }
  vpc_id           = module.vpc_dev1.vpc_name
  peer_vpc_id      = module.vpc_dev2.vpc_name
  main_owner_id    = module.vpc_dev1.owner_id
  main_region_name = module.vpc_dev1.peer_region
  peer_region_name = module.vpc_dev2.peer_region
}

//Accepter-------------------------------------------
module "Accept_Peering_connection" {
  source                = "./accepter"
  peering_connection_id = module.Peering_connection.peering_connection_id
}
//-------------------------------------------

output "module_vpc_name" {
  value = module.vpc_dev1.vpc_name
}

output "key_file_name" {
  value = module.vpc_dev1.key_name
}

output "prod_ami_id" {
  value = module.vpc_dev1.data_aws_ami
}

output "prod_ami_name" {
  value = module.vpc_dev1.data_aws_name
}

output "loc_vpc_name" {
  value = module.vpc_dev1.vpc_name
}

output "loc_owner_id" {
  value = module.vpc_dev1.owner_id
}

output "loc_peer_region" {
  value = module.vpc_dev1.peer_region
}
