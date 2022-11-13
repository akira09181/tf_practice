resource "aws_lambda_function" "get_unixtime" {
  function_name = "${var.environment}secom-status"

  handler                        = "src/get_unixtime.lambda_handler"
  filename                       = "${data.archive_file.function_zip.output_path}"
  runtime                        = "python3.6"
  /*role                           = "${aws_iam_role.lambda_iam_role.arn}"*/
  source_code_hash               = "${data.archive_file.function_zip.output_base64sha256}"
}