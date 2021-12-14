resource "aws_key_pair" "keyname" {
    key_name      =  "keyname"
    public_key    =  ""
}

resource "aws_launch_configuration" "web" {
  name_prefix     = "web-"

  image_id        = "ami-03b47d2d727e13114"
  instance_type   = "t4g.micro"
  key_name        = "keyname"

  security_groups = [ aws_security_group.http.id, aws_security_group.ssh.id ]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
      sudo su
      apt-get update
      apt-get upgrade -y
      echo 'installing ec2-instance-connect'
      apt-get install ec2-instance-connect -y
      apt-get install -y apt-transport-https ca-certificates curl -y
      echo 'install apache2'
      apt install apache2 -y
      echo 'install hello world'
      echo '<h1>Hello World</h1><p>Today is: <span id = "time"></span></p><script> var today = new Date(); document.getElementById("time").innerHTML=today; </script>' > /var/www/html/index.html
      service apache2 restart
      touch /home/ubuntu/cotton
  EOF

  lifecycle {
    create_before_destroy = true
  }
}
