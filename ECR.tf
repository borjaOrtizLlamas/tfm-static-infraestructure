resource "aws_ecr_repository" "small_comerce_api_rest" {
  name  = "small_comerce_api_rest"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "sidecar" {
  name  = "filebeats_unir"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}