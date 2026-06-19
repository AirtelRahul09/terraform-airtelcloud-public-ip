resource "airtelcloud_public_ip" "this" {
  object_name       = var.object_name
  vip               = var.vip
  availability_zone = var.availability_zone
}

resource "airtelcloud_public_ip_policy_rule" "this" {
  for_each = {
    for rule in var.policy_rules :
    rule.display_name => rule
  }
  public_ip_id = airtelcloud_public_ip.this.id

  display_name = each.value.display_name

  source   = each.value.source
  services = each.value.services
  action   = each.value.action

  target_vip = airtelcloud_public_ip.this.vip
  public_ip  = airtelcloud_public_ip.this.public_ip

  availability_zone = var.availability_zone
}
