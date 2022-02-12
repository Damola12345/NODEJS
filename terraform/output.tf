############################################################
# # Output for Application Load Balancer                                      #
############################################################

## Application Load Balancer DNS Name
output "test-alb-dns-name" {
  value     = aws_lb.test-alb.dns_name 
}