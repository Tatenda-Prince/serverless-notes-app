output "notes_table_name" {
  value = aws_dynamodb_table.notes_table.name
}

output "create_note_api_url" {
  value = "https://${aws_api_gateway_rest_api.notes_api.id}.execute-api.${var.region}.amazonaws.com/prod/notes"
}



