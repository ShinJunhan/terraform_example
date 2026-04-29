# ~/terraform_example/test02_basic/foreach/main.tf

# 1. 데이터 정의 (학생 명단)
locals {
    students = ["kim", "lee", "park"]
    # local.student 는 list type
}

# set 또는 map 에 들어 있는 정보를 이용해서 반복문 돌면서 여러개의 자원을 만들어야 할 때가 있다

# 2. for_each 를 사용하여 파일 생성
# local_file.student_notes 는 map type 이다.
resource "local_file" "student_notes" {
    # list 를 set 로 변환하여 for_each 에 넣어주기
    # for_each 에 대입할 수 있는 것은 set type 또는 map type 만 가능 (list type 은 안됨)
    for_each = toset(local.students) # toset(리스트명) : 리스트를 set 로 바꿔주는 함수  
    # set 를 넣어 주면 ${each.key} 와 ${each.value} 가 동일하다
    # map 을 넣어 주면 ${each.key} 와 ${each.value} 가 다르다
    filename = "${path.module}/student_${each.key}.txt"
    content  = "안녕하세요! ${each.value} 학생의 실습 노트 입니다"
}

output "debug" {
    description = "생성된 파일들의 전체 경로 목록"
    # 여기서 item 은 local_file.student_notes map 에 저장된 item 중 하나다
    value       = [for item in local_file.student_notes : item.filename]
    # item.filename 은 item의 key 값 중 하나다 (local_file.student_notes["lee"].filename)
    # for_each 문에는 splat 연산자 (*) 를 사용할 수 없다
}