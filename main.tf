provider "aws" {
  region = "us-east-1" # change to your preferred region
}

resource "aws_dynamodb_table" "notes_table" {
  name           = "Notes"
  billing_mode   = "PAY_PER_REQUEST" # On-demand pricing
  hash_key       = "noteId"

  attribute {
    name = "noteId"
    type = "S"  # S = String
  }

  tags = {
    Project = "ServerlessNotesApp"
  }
}
