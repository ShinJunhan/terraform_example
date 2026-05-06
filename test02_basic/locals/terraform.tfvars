# ~/terraform_example/test02_basic/local/terraform.tfvars

# 선언되어 있는 변수에 넣을 값을 여기서 결정할 수 있다
# terraform.tfvars 라는 파일의 이름은 정해진 이름이다
# terraform.tfvars 는 default 설정이다 
# -> terraform plan(apply) 할 때 default 로 이 파일을 읽어서 동작한다
# terraform.tfvars -> variables.tf -> locals{ } : 계산된 값이 infra 생성 시 사용된다
# *.tfvars 파일은 github 에 push 하지 않는 것이 일반적이다
# *.tfvars 파일에 민감한 정보들을 적는다 (DB 비번, 공개되지 않으면 좋을 정보들)

env             = "dev"
project_name    = "ktcloud"
