provider "aws" {
  region = var.region
  default_tags {
    tags = {
      projeto = "Final"
      dono    = "Vinicius"
    }
  }
}