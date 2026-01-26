resource "aws_ecr_repository" "frontend" {
  name         = "three-tier-frontend"
  force_delete = true
}

resource "aws_ecr_repository" "backend" {
  name         = "three-tier-backend"
  force_delete = true
}