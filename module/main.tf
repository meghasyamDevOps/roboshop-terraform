resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.instance_sg.id]

  tags = {
    Name = local.name
  }
}

resource "aws_route53_record" "records" {
  zone_id = "Z02795351QOID794T5B10"
  name    = "${var.name}-${var.env}.meghadevops.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}
