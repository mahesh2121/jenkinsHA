resource "aws_security_group" "jenkins_agent" {
  name = "Jenkins agent"
  description = "Allow ssh inbound traffic from everywhere and all outbound traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  egress {
    from_port = 0
    to_port = 0
    protcol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
}

resource "aws_instance" "agent" {
    count = var.instance_count

    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group = [aws_security_group.jenkins_agent.id]
  
    tags = {
        Name = "${var.instance_name}-${count.index+1}"
    }
    subnet_id = element(var.subnet_ids,count.index % length(var.subnet.ids))

}
