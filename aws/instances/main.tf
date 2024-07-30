provider "aws" {
  region = "us-west-1"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name  = "k8s-node"
  ami_id         = "ami-04a81a99f5ec58529"
  instance_type  = "t2.small"
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
