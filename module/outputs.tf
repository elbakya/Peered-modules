output "data_aws_ami" {
  value = data.aws_ami.latest_ubuntu.id
}

output "data_aws_name" {
  value = data.aws_ami.latest_ubuntu.name
}

output "key_name" {
  value = "${var.env}-myKey"
}

output "vpc_name" {
  value = aws_vpc.main.id
}

output "owner_id" {
  value = data.aws_caller_identity.current.account_id
}

output "peer_region" {
  value = data.aws_region.current.name
}
