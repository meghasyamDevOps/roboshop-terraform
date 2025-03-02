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

resource "null_resource" "resource" {

  depends_on = [aws_instance.instance, aws_route53_record.records]

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = [
      "rm -rf Roboshop-shell",
      "git clone https://github.com/meghasyamDevOps/Roboshop-shell.git",
      "cd Roboshop-shell",
      "sudo bash ${var.name}.sh ${var.password}"
    ]
  }
}
