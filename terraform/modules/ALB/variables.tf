variable "name" {
  type = string
  description = "Name of the project"
}

variable "lb_subnets" {
  type = list(list(any))
}

variable "lb_sg" {
  type = list(any)
}

variable "lb_config" {
  type = map(any)
}

variable "vpc_id" {
}

variable "tg_instances_id_private" {
  type = list(any)
}

variable "tg_instances_id_public" {
  type = list(any)
}