# This a lambda function is used to create notes in the Dynamodb table
resource "aws_lambda_function" "create_note" {
  function_name = "createNote"
  filename      = "create_note.zip"
  handler       = "main.lambda_handler"
  runtime       = "python3.12"

  role = aws_iam_role.lambda_dynamodb_role.arn

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.notes_table.name
    }
  }

  source_code_hash = filebase64sha256("create_note.zip")
}

# This resource allows the API Gateway to invoke the lambda function
resource "aws_lambda_permission" "apigw_create_note" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_note.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.notes_api.execution_arn}/*/*"
}


# This lambda function is used to retrieve or get notes from the Dynamodb table

resource "aws_lambda_function" "get_note" {
  function_name = "getNote"
  filename      = "get_note.zip"
  handler       = "main.lambda_handler"
  runtime       = "python3.12"

  role = aws_iam_role.lambda_dynamodb_role.arn

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.notes_table.name
    }
  }

  source_code_hash = filebase64sha256("get_note.zip")
}

resource "aws_lambda_permission" "apigw_get_note" {
  statement_id  = "AllowAPIGatewayInvokeGet"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_note.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.notes_api.execution_arn}/prod/GET/notes/*"
}


# This a lambda function is used to update notes in the Dynamodb table

resource "aws_lambda_function" "update_note" {
  function_name = "updateNote"
  filename      = "update_note.zip"
  handler       = "main.lambda_handler"
  runtime       = "python3.12"

  role = aws_iam_role.lambda_dynamodb_role.arn

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.notes_table.name
    }
  }

  source_code_hash = filebase64sha256("update_note.zip")
}



resource "aws_lambda_permission" "apigw_update_note" {
  statement_id  = "AllowAPIGatewayInvokeUpdate"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.update_note.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.notes_api.execution_arn}/*/*"
}


# This lambda function is used to delete notes from the Dynamodb table

resource "aws_lambda_function" "delete_note" {
  function_name = "deleteNote"
  handler       = "main.lambda_handler"
  runtime       = "python3.12"
  role          = aws_iam_role.lambda_dynamodb_role.arn

  filename         = "delete_note.zip" 
  source_code_hash = filebase64sha256("delete_note.zip")  

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.notes_table.name
    }
  }
}



resource "aws_lambda_permission" "apigw_delete_note" {
  statement_id  = "AllowAPIGatewayInvokeDelete"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.delete_note.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.notes_api.execution_arn}/prod/DELETE/notes/*"
}
