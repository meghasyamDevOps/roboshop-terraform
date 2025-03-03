env ="dev"

components = {
  frontend = {
    name          = "frontend"
    instance_type = "t3.micro"
  }
  catalogue = {
    name          = "catalogue"
    instance_type = "t3.micro"
  }
  cart = {
    name          = "cart"
    instance_type = "t3.micro"
  }
  shipping = {
    name          = "shipping"
    instance_type = "t3.micro"
    password      = "RoboShop@1"
  }
  user = {
    name          = "user"
    instance_type = "t3.micro"
  }
  payment = {
    name          = "payment"
    instance_type = "t3.micro"
    password      = "roboshop123"
  }
  dispatch = {
    name          = "dispatch"
    instance_type = "t3.micro"
  }
  mongodb = {
    name          = "mongodb"
    instance_type = "t3.small"
  }
  mysql = {
    name          = "mysql"
    instance_type = "t3.small"
    password      = "RoboShop@1"
  }
  redis = {
    name          = "redis"
    instance_type = "t3.small"
  }
  rabbitmq = {
    name          = "rabbitmq"
    instance_type = "t3.small"
    password      = "roboshop123"
  }
}