resource "aws_elb" "hello_world_elb" {
  name                      = "hello-world-elb"
  cross_zone_load_balancing = true
  security_groups = [
    aws_security_group.elb_http.id
  ]
  subnets = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id,
    aws_subnet.subnet_3.id,
  ]
  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = aws_iam_server_certificate.test_cert.arn
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }
}
