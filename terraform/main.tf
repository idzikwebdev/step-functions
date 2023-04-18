provider "aws" {
  region = "us-east-1"
  access_key = var.KEY
  secret_key = var.SECRET
}

resource "aws_iam_role" "lambda_role" {
  name               = "terraform_aws_lambda_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Sid" : ""
      }
    ]
  })
}

resource "aws_iam_policy" "iam_policy_for_lambda" {

  name         = "aws_iam_policy_for_terraform_aws_lambda_role"
  path         = "/"
  description  = "AWS IAM Policy for managing aws lambda role"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource": "arn:aws:logs:*:*:*",
        "Effect": "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role        = aws_iam_role.lambda_role.name
  policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

resource "aws_lambda_function" "terraform_lambda_func" {
  filename                       = "../build/libs/step-functions-1.0-SNAPSHOT.jar"
  function_name                  = "Lambda-Function"
  role                           = aws_iam_role.lambda_role.arn
  handler                        = "io.idzikwebdev.lambda.Lambda::handleRequest"
  runtime                        = "java11"
  depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
  timeout                        = 30
  memory_size                    = 256
  source_code_hash               = filebase64sha256("../build/libs/step-functions-1.0-SNAPSHOT.jar")
}