provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "public-subnet1" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.my_vpc.id
  tags = {
    name = "pub-subnet1"
  }
}
resource "aws_subnet" "public-subnet2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    name = "pub-subnet2"
  }
}
resource "aws_subnet" "private-subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    name = "priv-subnet1"
  }
}
resource "aws_subnet" "private-subnet2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  tags = {
    name = "priv-subnet2"

  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    name = "my-first-internet-gateway"
  }

}
