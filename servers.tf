terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "instance" {
  for_each               = var.components
  ami                    = data.aws_ami.ami.id
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.instance_sg.id]

  tags = {
    Name = "${each.value["name"]}-${var.env}"
  }
}

resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z02795351QOID794T5B10"
  name    = "${each.value["name"]}-${var.env}.meghadevops.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}
