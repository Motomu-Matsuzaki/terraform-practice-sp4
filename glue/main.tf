resource "aws_iam_role" "glue_service_role" {
  name = "AWSGlueServiceRole-sprint3"
  description = "Allows Glue to call AWS services on your behalf. "

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "glue_service_role_attachment" {
  role       = aws_iam_role.glue_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_glue_job" "sprint3_customer_csv_normalize_parquet" {
  name     = "sprint3-customer-csv-normalize-parquet"
  role_arn = aws_iam_role.glue_service_role.arn

  glue_version      = "5.0"
  number_of_workers = 10
  worker_type       = "G.1X"
  execution_class   = "STANDARD"

  command {
    name            = "glueetl"
    python_version  = "3"
    script_location = "s3://aws-glue-assets-593793020094-ap-northeast-1/scripts/sprint3-customer-csv-normalize-parquet.py"
  }

  max_retries         = 0
  timeout             = 480
  execution_property {
    max_concurrent_runs = 1
  }

  default_arguments = {
    "--job-language"               = "python"
    "--enable-metrics"            = "true"
    "--enable-job-insights"       = "true"
    "--enable-spark-ui"           = "true"
    "--spark-event-logs-path"     = "s3://aws-glue-assets-593793020094-ap-northeast-1/sparkHistoryLogs/"
    "--TempDir"                   = "s3://aws-glue-assets-593793020094-ap-northeast-1/temporary/"
    "--job-bookmark-option"       = "job-bookmark-disable"
    "--enable-glue-datacatalog"   = "true"
    "--enable-observability-metrics" = "true"
  }
}
# Dummy comment