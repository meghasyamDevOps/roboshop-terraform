module "components" {
  source = "./module"

  for_each      = var.components
  instance_type = each.value["instance_type"]
  name          = each.value["name"]

  env = var.env
}
