# Output the EIPs
output "eip" {
  description = "new eip"
  value       = google_compute_address.eip
}