#1
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}  
#2
resource "aws_instance" "example" {
         ami = "ami-0e71"
         vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
         instance_type = "t2.micro"
         key_name = "deploy_ansible"

         tags {
         Name = "terraform-master"
         }
}
resource "aws_instance" "example1" {
         ami = "ami-0e71"
         vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
         instance_type = "t2.micro"
         key_name = "deploy_ansible"

         tags {
         Name = "terraform-web"
         }
}
resource "aws_instance" "example2" {
         ami = "ami-0e71"
         vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
         instance_type = "t2.micro"
         key_name = "deploy_ansible"

         tags {
         Name = "terraform-mongodb"
         }
}
