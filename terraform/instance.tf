resource "aws_key_pair" "key1" {
    key_name  =  "k1"
    public_key =  ""
}

resource "aws_instance" "ops_one" {
    ami             = ""
    subnet_id       =
    instance_type   = "t2.micro"
    key_name        = "k1"
    
}
