resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "contract"
  hash_key       = "contractCd"
  range_key      = "imei"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "contractCd"
    type = "S"
  }

  attribute {
    name = "imei"
    type = "S"
  }

  global_secondary_index {
    name               = "contract"
    hash_key           = "contractCd"
    range_key          = "imei"
    read_capacity  = 10
    write_capacity = 10
    projection_type = "ALL"
  }
   ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}