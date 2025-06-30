# Serverless Notes App (AWS + Terraform)

![image_alt]()


## Background
With the rise of serverless architecture, cloud-native applications no longer require provisioning or managing infrastructure. This project demonstrates a fully automated, serverless backend system using **AWS services** and **Terraform** for infrastructure management.

## Project Overview
The **Serverless Notes App** is a cloud-native RESTful API that allows users to **Create**, **Read**, **Update**, and **Delete (CRUD)** notes. It leverages **AWS Lambda** for compute, **API Gateway** for routing, and **DynamoDB** for data persistence — all provisioned via **Terraform Infrastructure as Code**.

## Project Objective
1.Build a fully serverless backend on AWS

2.Use **Terraform** for automated provisioning

3.Implement full CRUD operations on a DynamoDB table

4.Apply **IAM best practices** for security

5.Enable **monitoring** via CloudWatch

6.Practice cloud-native DevOps concepts hands-on

## Features
1.**Create Note**            | `POST /notes` to add a new note 

2.**Retrieve Note by ID**    | `GET /notes/{id}` to fetch a single note  

3.**Update Note**            | `PUT /notes/{id}` to modify an existing note

4.**Delete Note**            | `DELETE /notes/{id}` to remove a note 

5.**Terraform IaC**          | Infrastructure provisioned and managed with code 

6.**CloudWatch Logs**        | View Lambda logs for each operation              

## Technologies Used
1.Terraform 

2.AWS Lambda

3.Amazon API Gateway

4.Amazon DynamoDB

5.IAM

6.CloudWatch

## Prerequisites
1.AWS account with programmatic access (IAM user/role)

2.Terraform v1.0+ installed locally

3.Basic knowledge of:
-AWS services (Lambda, API Gateway, DynamoDB)

4.JSON / HTTP

5.CLI tools (bash, zip)

## Step 0: Clone the Repository
```language
git clone https://github.com/Tatenda-Prince/serverless-notes-app.git
```

## Step 1 : Run Terraform workflow to initialize, validate, plan then apply
1.1.Terraform will provision:

1.AWS Lambda

2.Amazon API Gateway

3.Amazon DynamoDB

4.CloudWatch

5.IAM

1.2.In your local terraform visual code environment terminal, to initialize the necessary providers, execute the following command in your environment terminal

```language
terraform init
```

Upon completion of the initialization process, a successful prompt will be displayed, as shown
![image_alt]()


1.3.Next, let’s ensure that our code does not contain any syntax errors by running the following command

```language
terraform validate
```
The command should generate a success message, confirming that it is valid, as demonstrated below.
![image_alt]()

1.4.Let’s now execute the following command to generate a list of all the modifications that Terraform will apply.
```language
terraform plan
```
![image_alt]()

The list of changes that Terraform is anticipated to apply to the infrastructure resources should be displayed. The “+” sign indicates what will be added, while the “-” sign indicates what will be removed.

1.5.Now, let’s deploy this infrastructure! Execute the following command to apply the changes and deploy the resources. Note — Make sure to type “yes” to agree to the changes after running this command.

```language
terraform apply
```
Terraform will initiate the process of applying all the changes to the infrastructure. Kindly wait for a few seconds for the deployment process to complete.

![image_alt]()

## Success
The process should now conclude with a message indicating “Apply complete”, stating the total number of added, modified, and destroyed resources, accompanied by several resources.

![image_alt]()


## Step 2: Verify creation of our resources






