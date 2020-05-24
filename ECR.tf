resource "aws_ecr_repository" "foo" {
  name                 = "crud_cliend_with_products"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}