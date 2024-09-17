# Terraform Basic Server Setup

This project focuses on building a Dev Environment.

The Architecture for the following:
![Architecture image](image.png)

1. Setting up the IAM user for access:
    a. It strictly recommended not to use Access key and Secret Key of the 'Root user'.
    b. AWS console -> IAM -> Users -> Create User "name of the user" -> Attach Policies "AWS Adminitrator"->Create User
    c. After the User is created use spectate into Users List for the user.[image]
    d. Select user -> Security credentials -> Create Access Key "Select your use for key" -> Download .csv file
    e. If using vscode, installing an extension 'AWS toolkit' and setting up security credentials is more efficient.
    e. Or Access key and Secret key can be also be put in providers.tf file.
       https://registry.terraform.io/providers/hashicorp/aws/latest/docs 

2. Setting up a VPC (Virtual Private Cloud):
    a. Enable the DNS hostname and DNS Support.
    b. Domain Name System (DNS) is a standard by which names used on the internet are resolved to their corresponding IP addresses.
       A DNS hostname is a name that uniquely and absolutely names a computer; it's composed of a host name and a domain name.
       DNS servers resolve DNS hostnames to their corresponding IP addresses.
       https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc