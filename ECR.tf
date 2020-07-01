resource "aws_ecr_repository" "small_comerce_api_rest" {
  name  = "small_comerce_api_rest"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}


resource "aws_ecr_repository" "sidecar" {
  name  = "beats_sidecar"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "test" {
  name  = "test"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}