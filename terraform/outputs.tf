output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "elb_dns_name" {
  value       = aws_elb.web_elb[0].dns_name
  description = "DNS name of the ELB (if enabled)"
  condition   = var.enable_elb
}
