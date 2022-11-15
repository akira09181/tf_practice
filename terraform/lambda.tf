data "archive_file" "sample_function" {
  type        = "zip"
  source_file = "${path.module}${var.lambda_file_name}"
  output_path = "${path.module}${var.lambda_file_zip_name}"
}
 
data "aws_iam_policy_document" "AWSLambdaTrustPolicy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}
 
resource "aws_iam_role" "function_role" {
  name               = "lambdaurl-function_role"
  assume_role_policy = data.aws_iam_policy_document.AWSLambdaTrustPolicy.json
}
 
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.function_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
 
 
resource "aws_lambda_function" "test_lambda" {
  filename         = data.archive_file.sample_function.output_path
  function_name    = "terraform-test"
  role             = aws_iam_role.function_role.arn
  handler          = "lambda_function.lambda_handler"
  publish          = true
  source_code_hash = data.archive_file.sample_function.output_base64sha256
  runtime          = "python3.9"
}
 
resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "events.amazonaws.com"
}
 
variable "lambda_file_name" {
  default = "/contents/lambda_function.py"
}
 
variable "lambda_file_zip_name" {
  default = "/contents/lambda.zip"
}