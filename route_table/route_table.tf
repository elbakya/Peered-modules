
resource "aws_route" "r" {
  route_table_id            = var.rt_name
  destination_cidr_block    = var.destination_id
  vpc_peering_connection_id = var.peering_connection_id
}
