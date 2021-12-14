resource "aws_route53_zone" "primary" {
    name = "opstest.xyz"
}


resource "aws_route53_record" "hello-world" {
  zone_id = "Z04803008AVBBHAQ28H8"
  name    = "hello-world.opstest.xyz"
  type    = "A"

  alias {
    name                   = "${aws_elb.hello_world_elb.dns_name}"
    zone_id                = "${aws_elb.hello_world_elb.zone_id}"
    evaluate_target_health = true
  }
}
