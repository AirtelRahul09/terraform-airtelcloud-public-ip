module "public_ip" {
  source = "../../"

  object_name       = "web-public-ip"
  vip               = "10.1.99.172"
  availability_zone = "S1"

  policy_rules = [
    {
      display_name = "web-traffic"
      source       = "any"
      services     = ["HTTP", "HTTPS"]
      action       = "accept"
    },
    {
      display_name = "ssh-access"
      source       = "10.0.0.0/8"
      services     = ["SSH"]
      action       = "accept"
    }
  ]
}
