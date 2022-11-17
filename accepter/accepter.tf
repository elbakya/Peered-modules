# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = var.peering_connection_id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}
