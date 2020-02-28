provider "aws" {
  profile = "saml"
  version = "2.49.0"
  region  = "eu-west-1"
}

provider "cloudflare" {
  version           = "1.18.1"
  email             = var.cloudflare_email
  token             = var.cloudflare_token
}


/*
module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.0.0/24"
  subnet_id   = ""
}
*/
module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = 3
  ami_id        = "ami-08e70a3276d2362f1"
  instance_type = "t2.micro"
  subnet_id     = module.my_ec2.subnet_id
}


resource "cloudflare_worker_script" "hc-strip-max-age" {
  name    = "hello-world"
  content = file("../scripts/index.js")
}
