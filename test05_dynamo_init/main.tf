# ~/terraform_example/test05_dynamo_init/main.tf

terraform {
    required_version = ">= 1.14.0" # github action 에서 에러나지 않게 일부 수정
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform-lock" # <-- 테이블명 : 마음대로 지울 수 있다
    billing_mode = "PAY_PER_REQUEST" # 비용 지불 방식 (요청 갯수당 과금 - 비용 미미함)
    hash_key = "LockID" # <-- 카테고리명 : 마음대로 지울 수 있다 (RDBMS 의 PK 와 유사)

    # 속성을 이용해서
    attribute {
        name = "LockID" # 카테고리의
        type = "S" # 데이터 type 을 설정 (S 는 문자열, N 은 숫자)
    }

    tags = {
      Name = "Terraform State Lock Table"
    }
}