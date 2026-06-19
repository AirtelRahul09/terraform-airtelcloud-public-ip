module "public_ip" {
  source = "../../"

  object_name       = "web-public-ip"
  vip               = "10.1.99.172"
  availability_zone = "S1"
}
