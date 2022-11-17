
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  peer_owner_id = var.main_owner_id
  peer_region   = var.peer_region_name
  auto_accept   = false

  tags = {
    Side = "Requester"
  }
}
