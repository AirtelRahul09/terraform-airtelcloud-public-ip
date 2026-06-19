output "public_ip_id" {
  description = "Public IP ID"
  value       = airtelcloud_public_ip.this.id
}

output "public_ip_address" {
  description = "Allocated Public IP"
  value       = airtelcloud_public_ip.this.public_ip
}

output "public_ip_status" {
  description = "Public IP Status"
  value       = airtelcloud_public_ip.this.status
}

output "public_ip" {
  description = "Complete Public IP Object"

  value = {
    id        = airtelcloud_public_ip.this.id
    public_ip = airtelcloud_public_ip.this.public_ip
    vip       = airtelcloud_public_ip.this.vip
    status    = airtelcloud_public_ip.this.status
  }
}

output "vip" {
  description = "Target VIP"

  value = airtelcloud_public_ip.this.vip
}
