resource "aws_security_group" "container_sg" {
  name        = "nodejs_api-container"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  depends_on  = [aws_security_group.lb_sg, ]
  lifecycle { create_before_destroy = true }
  ingress = [
    {
      description      = "3000 open"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "all in"
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

}

resource "aws_security_group" "lb_sg" {
  name        = "nodejs_api-alb"
  description = "Allow load balancer traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress = [
    {
      description      = "http open"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "all in"
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}