resource "aws_instance" "web" {
  count         = var.ec2_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "HelloWorld"
  }
}

output "subnet_id" {
  value = "subnet-0554e7fcce71e4a41"
}

