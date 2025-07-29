resource "aws_lambda_function" "start_crawler_type_a" {
  function_name = "start_crawler_type_a"
  role          = "arn:aws:iam::593793020094:role/LambdaRole_StartGlueCrawler_SP3"
  runtime       = "python3.13"
  handler       = "lambda_function.lambda_handler"
  architectures = ["x86_64"]

  filename         = "start_crawler_type_a.zip"
  source_code_hash = filebase64sha256("start_crawler_type_a.zip")

  memory_size = 128
  timeout     = 60

  publish = true
}

resource "aws_lambda_function" "start_crawler_type_b" {
  function_name = "start_crawler_type_b"
  role          = "arn:aws:iam::593793020094:role/LambdaRole_StartGlueCrawler_SP3"
  runtime       = "python3.13"
  handler       = "lambda_function.lambda_handler"
  architectures = ["x86_64"]

  filename         = "start_crawler_type_b.zip"
  source_code_hash = filebase64sha256("start_crawler_type_b.zip")

  memory_size = 128
  timeout     = 60

  publish = true
}

resource "aws_lambda_function" "start_crawler_type_c" {
  function_name = "start_crawler_type_c"
  role          = "arn:aws:iam::593793020094:role/LambdaRole_StartGlueCrawler_SP3"
  runtime       = "python3.13"
  handler       = "lambda_function.lambda_handler"
  architectures = ["x86_64"]

  filename         = "start_crawler_type_c.zip"
  source_code_hash = filebase64sha256("start_crawler_type_c.zip")

  memory_size = 128
  timeout     = 60

  publish = true
}
