# ~/terraform_example/test02_basic/locals/variables.tf

# 한번 값이 정해지면 정해진 값 그대로 main.tf 등에서 사용하므로 상수에 가깝다
# 코드의 흐름에 따라 값이 바뀌는 프로그래밍 변수와 다른 개념으로 작동
# 값을 바꾸기 위해서는 테라폼 실행하기 전에 미리 세팅해 놓아야 한다

variable "env" {
    type = string
    description = "현재 환경 (dev | prod)"
}

variable "project_name" {
    type = string
    # *.tfvars 에서 값을 전달하지 않았을 때 사용되는 default 값 설정 가능
    description = "프로젝트 이름"
    default = "sample"
}