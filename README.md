Hello and welcome to my best attempt of this take home skills project.

# Technology stack
- AWS CLI
- Terraform
- Apache
- GitHub



# Instructions
1. Open terminal window
2. Install the following software
    - Terraform CLI
    - AWS CLI
3. Clone this repository to your local machine
4. Once the repository is on your local machine navigate to the terraform folder
5. Create an AWS account (if you already have one move to next step)
    a. Under IAM create a role, download csv for access and secret keys
6. Create your own key pair by running the following command
    - ssh-keygen -t rsa -b 2048
    - type in a name for key when prompted
7. Save the public key file & private key as .pem file inside the terraform directory
8. Create your own self-signed certificate by running the following command: openssl req -x509 -newkey rsa:4096 -keyout _______.pem -out ________.pem -sha256 -days 365 -nodes
    - Fill in the first blank with the name of your private key
    - Fill in the second blank with a name for your certificate
Save the certificate.pem file inside the terraform directory
Run the following command in the terminal
    - aws configure
7. When prompted paste in your access key, secret key, region and output
8. Verify you have terraform and AWS CLI running
9. Open instance.tf & replace keyname on line 1,2 and 11 with your own keypair name & on line 3 fill in with your own public_key >> Save file
10. Open certificate.tf & replace the certificate file name & private key name on lines 33 & 34 with your own certificate & private key file names  >> Save file
9. Run the following commands
    - terraform init
    - terraform plan
    - terraform apply
10. Once everything has finished building, copy the elb_dns_name from the terminal & paste into a open browser


# Honest comments
Tasks I was not able to figure out:
- how to simulate traffic load other than the cloud watch metric alerts
- how to write a method automatically updating or replacing servers after a security update
- Attaching ACM certificate to my ELB
