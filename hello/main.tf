# terraform_example/hello/main.tf
# tf 파일은 HCL 형식의 파일 입니다.
# {key = value} 형태 (value의 data type: 10, "xxx", true/false, { }, [ ])

# terraform 과 aws 버전에 관련된 정보를 명시해 놓는 것이 좋다
# terraform 1.14 보다 높은 버전에서 에러나는 것을 방지할 수 있다.
# ~>1.14.0 의미 : 1.14. 까지는 고정하겠다 (1.15 부터는 작동 안됨)
terraform {
    required_version = "~>1.14.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

# aws provider 설정
provider "aws" {
    region = "ap-northeast-2"
}

# 간단하게 vpc 하나 생성해보기
resource "aws_vpc" "test_vpc" {
    cidr_block = "10.0.1.0/24"
    enable_dns_hostnames = true # 인스턴스에 dns 이름을 부여 하기 위해 활성화
    enable_dns_support = true
    tags = {
        Name = "terraform_test_vpc"
    }
}

# 인터넷 게이트웨이
resource "aws_internet_gateway" "igw" {
    # 어떤 vpc 에 붙여야 하지? 선택에 대한 문제 발생
    vpc_id = aws_vpc.test_vpc.id # test_vpc 라는 이름의 vpc가 생성된 후 그 id 를 이곳에 사용
    tags = {
      Name = "test_vpc_igw" # tags 에 들어가는 이름은 자유롭게 설정 가능 (aws console 에 로그인 하면 보임)
    }
}