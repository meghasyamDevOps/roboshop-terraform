locals {
  name = var.name != "" ?  "${var.name}-${var.env}" : var.name
}