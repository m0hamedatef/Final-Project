name = "NTI"

region = "eu-west-1"

availability_zone = "eu-west-1a"

volume_type = "gp2"

vpc_cidr = "10.0.0.0/16"

public_subnet_config = {
  count = [2]
  CIDRs = ["10.0.2.0/24", "10.0.3.0/24"]
  AZs = ["eu-west-1a", "eu-west-1b"]
}

ec2_config = {
  ami   = ["ami-0776c814353b4814d"]
  count = [1]
  type = ["t2.micro"]
  public_key = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHlHrZae/TBf+QCaLb6IP1BpbjDb3mbqUKT8B2Yq/sSPuB4bceK7vStQh4ZTJbn1c2wPgboFO7UG0hI1CYkRS5rEotZHZSfeEDZCZpMLAUDKSMtghiWW3PBVV+7fhNbtLptktdUAHYVS7lqoUX3n19VIp1qrFhxtKqn0aXacBT0eYPJl2Sy0Lp/uksQfsJ0D2R9w8BTsSfD4tBRcGaqOOwAqBdzvmR/8EC9MEfkisx7tEluzy4vTW1MVykzglGfSjRH1khsOQWkns73NutDowTmGgIBeUiIrC9M5gr50cslP/sIkBh3NHoUmk8R6rpy+BSuVhxiOFLtEXkw8sCXmlvSArb7B5HfIiRa8t9bW/gZVnZrJSjqtsVWWFFGoZMUrqyRoK0Xw58q6/4VV60fPNLHprpHxcLCSdfnudTAYaLuA61R0VDv1Vxp+KDrFAQj0iJ00lB3PDkp2p6aejqYOlQRjvaezUDV7OjujdT8Grb/ti+Y0g5Ul5VnPnq5z0ZMS0= h-test@htest-virtual-machine"]
  name = ["jenkins_server"]
}

lb_config = {
  count = [2]
  name = ["private", "public"]
  internal = ["true", "false"]
}

desired_size    = 2
max_size        = 5
min_size        = 0
max_unavailable = 1