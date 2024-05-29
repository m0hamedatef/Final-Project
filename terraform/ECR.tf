resource "aws_ecr_repository" "ECR_repoositry" {
  name                 = "ecr-myhub"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

