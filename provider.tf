provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      projeto = "Final"
      dono    = "Vinicius"
    }
  }
}