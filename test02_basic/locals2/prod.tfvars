# ~/terraform_example/test02_basic/locals2/prod.tfvars

# 파일명이 terraform.tfvars 가 아니므로 terraform 실행 시 default로 읽어 들이지 않는다
# prod 는 production 의 의미 -> 실제 배포용
# plan 이나 apply 할 때, -var-file="prod.tfvars" 옵션을 주어서 실행해야 한다

env             = "prod"
project_name    = "ktcloud-v1"