data "aws_ami" "ami" {
  owners      = ["973714476881"]
  name_regex  = "RHEL-9-DevOps-Practice"
  most_recent = true

}

data "aws_security_group" "instance_sg" {
  name = "allow-all"
}