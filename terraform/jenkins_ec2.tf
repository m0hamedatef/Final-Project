
module "sg" {
  source                = "./modules/SG"
  name                  = var.name
  vpc_id                = module.vpc.vpc_id
}

module "ec2" {
  source                = "./modules/EC2"
  name                  = var.name
  vpc_id                = module.vpc.vpc_id

  ec2_config            = var.ec2_config

  public_subnet_ids     = module.vpc.public_subnet_ids
  public_instance_sg_id = module.sg.public_instance_sg_id
}

resource "aws_ebs_volume" "jenkins_volume" {
  availability_zone = var.availability_zone
  size              = 10
  type              = var.volume_type

  tags = {
    Name            = "${var.name}-${var.ec2_config["name"][0]}-volume"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  count         = var.ec2_config["count"][0]
  device_name   = "/dev/xvdf"
  instance_id   = module.ec2.public_ec2_ids[0]
  volume_id     = aws_ebs_volume.jenkins_volume.id
}

resource "aws_iam_role" "backup_role" {
  name = "h_backup_role" 

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "backup.amazonaws.com"
      }
    }]
  })
}


resource "aws_iam_role_policy_attachment" "backup_role_policy" {
  role       = aws_iam_role.backup_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

# AWS Backup Vault
resource "aws_backup_vault" "backup_vault" {
  name        = "${var.name}-${var.ec2_config["name"][0]}-backup-vault"
  tags = {
    Name = "example-backup-vault"
  }
}

# AWS Backup Plan
resource "aws_backup_plan" "backup_plan" {
  name = "${var.name}-${var.ec2_config["name"][0]}-backup-plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.backup_vault.name
    schedule          = "cron(0 12 * * ? *)"  # Daily at 12:00 UTC
    lifecycle {
      delete_after = 30  # Retain backups for 30 days
    }
  }
}

# AWS Backup Selection
resource "aws_backup_selection" "backup_selection" {
  name          = "${var.name}-backup-selection"
  plan_id       = aws_backup_plan.backup_plan.id
  iam_role_arn  = aws_iam_role.backup_role.arn

  resources = [
    module.ec2.public_ec2_arns[0],
    aws_ebs_volume.jenkins_volume.arn
  ]
} 