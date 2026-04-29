# ~/terraform_example/test02_basic/foreach2/main.tf

# 1. 데이터 정의 (학생 명단)
locals {
    students = {
        lee = "이정호"
        kim = "김정호"
        park = "박정호"
    }

}



# 2. for_each 를 사용하여 파일 생성
# local_file.student_notes 는 map type 이다.
resource "local_file" "student_notes" {
    # for_each 에 map 대입하기
    for_each = local.students
    # map 을 넣어 주었기 때문에 ${each.key} 와 ${each.value} 가 다르다
    filename = "${path.module}/student_${each.key}.txt"
    content  = "안녕하세요! ${each.value} 학생의 실습 노트 입니다"
}


output "debug" {
    description = "생성된 파일들의 전체 경로 목록"
    # 여기서 item 은 local_file.student_notes map 에 저장된 item 중 하나다
    value       = [for item in local_file.student_notes : item.filename]
}