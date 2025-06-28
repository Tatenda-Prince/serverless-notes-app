#########################################
# 1. REST API
#########################################
resource "aws_api_gateway_rest_api" "notes_api" {
  name        = "NotesAPI"
  description = "API for serverless notes app"
}

#########################################
# 2. Resource: /notes
#########################################
resource "aws_api_gateway_resource" "notes_resource" {
  rest_api_id = aws_api_gateway_rest_api.notes_api.id
  parent_id   = aws_api_gateway_rest_api.notes_api.root_resource_id
  path_part   = "notes"
}

#########################################
# 3. Resource: /notes/{id}
#########################################
resource "aws_api_gateway_resource" "note_id_resource" {
  rest_api_id = aws_api_gateway_rest_api.notes_api.id
  parent_id   = aws_api_gateway_resource.notes_resource.id
  path_part   = "{id}"
}

#########################################
# 4. POST /notes - Create Note
#########################################
resource "aws_api_gateway_method" "create_note_post" {
  rest_api_id   = aws_api_gateway_rest_api.notes_api.id
  resource_id   = aws_api_gateway_resource.notes_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "create_note_lambda" {
  rest_api_id             = aws_api_gateway_rest_api.notes_api.id
  resource_id             = aws_api_gateway_resource.notes_resource.id
  http_method             = aws_api_gateway_method.create_note_post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.create_note.invoke_arn
}

#########################################
# 5. GET /notes/{id} - Get Note
#########################################
resource "aws_api_gateway_method" "get_note_get" {
  rest_api_id   = aws_api_gateway_rest_api.notes_api.id
  resource_id   = aws_api_gateway_resource.note_id_resource.id
  http_method   = "GET"
  authorization = "NONE"
  request_parameters = {
    "method.request.path.id" = true
  }
}

resource "aws_api_gateway_integration" "get_note_lambda" {
  rest_api_id             = aws_api_gateway_rest_api.notes_api.id
  resource_id             = aws_api_gateway_resource.note_id_resource.id
  http_method             = aws_api_gateway_method.get_note_get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.get_note.invoke_arn
}

#########################################
# 6. PUT /notes/{id} - Update Note
#########################################
resource "aws_api_gateway_method" "update_note_put" {
  rest_api_id   = aws_api_gateway_rest_api.notes_api.id
  resource_id   = aws_api_gateway_resource.note_id_resource.id
  http_method   = "PUT"
  authorization = "NONE"
  request_parameters = {
    "method.request.path.id" = true
  }
}

resource "aws_api_gateway_integration" "update_note_lambda" {
  rest_api_id             = aws_api_gateway_rest_api.notes_api.id
  resource_id             = aws_api_gateway_resource.note_id_resource.id
  http_method             = aws_api_gateway_method.update_note_put.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.update_note.invoke_arn
}

#########################################
# 7. DELETE /notes/{id} - Delete Note
#########################################
resource "aws_api_gateway_method" "delete_note_delete" {
  rest_api_id   = aws_api_gateway_rest_api.notes_api.id
  resource_id   = aws_api_gateway_resource.note_id_resource.id
  http_method   = "DELETE"
  authorization = "NONE"
  request_parameters = {
    "method.request.path.id" = true
  }
}

resource "aws_api_gateway_integration" "delete_note_lambda" {
  rest_api_id             = aws_api_gateway_rest_api.notes_api.id
  resource_id             = aws_api_gateway_resource.note_id_resource.id
  http_method             = aws_api_gateway_method.delete_note_delete.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.delete_note.invoke_arn
}

#########################################
# 8. Deploy API to Stage
#########################################
resource "aws_api_gateway_deployment" "notes_api_deployment" {
  depends_on = [
    aws_api_gateway_method.create_note_post,
    aws_api_gateway_method.get_note_get,
    aws_api_gateway_method.update_note_put,
    aws_api_gateway_method.delete_note_delete,
    aws_api_gateway_integration.create_note_lambda,
    aws_api_gateway_integration.get_note_lambda,
    aws_api_gateway_integration.update_note_lambda,
    aws_api_gateway_integration.delete_note_lambda
  ]

  rest_api_id = aws_api_gateway_rest_api.notes_api.id

  triggers = {
    redeploy = timestamp()
  }
}

resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.notes_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.notes_api.id
  stage_name    = "prod"

  lifecycle {
    create_before_destroy = true
  }
}
