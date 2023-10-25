output "instance_ids" {
  value = aws_instance.hosts[*].id
}