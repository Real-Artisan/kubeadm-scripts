provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  type    = string
  default = "ami-0a0e5d9c7acc336f1"
  description = "AMI Id of EC2 Instance"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name  = "k8s-node"
  ami_id            = var.ami_id
  instance_type  = "t2.medium"
  key_name       = "k8s-key-pair"
  subnet_ids     = ["subnet-0bcc595245958f9ea", "subnet-00c9e9768a794f7ea", "subnet-030dd563d5f278a4e"]
  instance_count = 3
  security_group_ids = ["sg-012040af2e57f1e57"]

  inbound_from_port  = ["0", "6443", "22", "30000"]
  inbound_to_port    = ["65000", "6443", "22", "32768"]
  inbound_protocol   = ["TCP", "TCP", "TCP", "TCP"]
  inbound_cidr       = ["172.31.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
  outbound_from_port = ["0"]
  outbound_to_port   = ["0"]
  outbound_protocol  = ["-1"]
  outbound_cidr      = ["0.0.0.0/0"]
}
