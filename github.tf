terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
  organization = var.github_organization
}

resource "github_repository" "my_repo" {
  name = "my_repo"
  description = "This is your first repository"
  visibility = "public"
}
