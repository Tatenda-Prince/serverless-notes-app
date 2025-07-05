# Serverless Notes App (AWS + Terraform)

![image_alt](https://github.com/Tatenda-Prince/serverless-notes-app/blob/bdff5c41fea0d3c14cd0979c140fb5ec9e40ec5c/img/Screenshot%202025-07-05%20135110.png)


## Background
With the rise of serverless architecture, cloud-native applications no longer require provisioning or managing infrastructure. This project demonstrates a fully automated, serverless backend system using **AWS services** and **Terraform** for infrastructure management.

## Project Overview
The **Serverless Notes App** is a cloud-native RESTful API that allows users to **Create**, **Read**, **Update**, and **Delete (CRUD)** notes. It leverages **AWS Lambda** for compute, **API Gateway** for routing, and **DynamoDB** for data persistence all provisioned via **Terraform Infrastructure as Code**.

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

![image_alt](https://github.com/Tatenda-Prince/serverless-notes-app/blob/9e191fc0c72379a498cef2a334e3e20a5af9c10a/img/Screenshot%202025-07-05%20140326.png)


1.3.Next, let’s ensure that our code does not contain any syntax errors by running the following command

```language
terraform validate
```
The command should generate a success message, confirming that it is valid, as demonstrated below.

![image_alt](https://github.com/Tatenda-Prince/serverless-notes-app/blob/1580584324e6e8834c3481a896a478598b80e64f/img/Screenshot%202025-07-05%20140351.png)

1.4.Let’s now execute the following command to generate a list of all the modifications that Terraform will apply.
```language
terraform plan
```

![image_alt](https://github.com/Tatenda-Prince/serverless-notes-app/blob/1d733d2e3a27c7d01c8138dbb1d9734b22bae128/img/Screenshot%202025-07-05%20140522.png)

The list of changes that Terraform is anticipated to apply to the infrastructure resources should be displayed. The “+” sign indicates what will be added, while the “-” sign indicates what will be removed.

1.5.Now, let’s deploy this infrastructure! Execute the following command to apply the changes and deploy the resources. Note — Make sure to type “yes” to agree to the changes after running this command.

```language
terraform apply
```
Terraform will initiate the process of applying all the changes to the infrastructure. Kindly wait for a few seconds for the deployment process to complete.

![image_alt](https://github.com/Tatenda-Prince/serverless-notes-app/blob/bb03cf9e393c96934ecece7a45f5c0058ba25411/img/Screenshot%202025-07-05%20141105.png)

## Success
The process should now conclude with a message indicating “Apply complete”, stating the total number of added, modified, and destroyed resources, accompanied by several resources.

![image_alt]()


## Step 2: Verify creation of our resources
2.1.In the AWS Management Console, head to the lambda Console and verify that there are four lambda functions running as show below

![image_alt]()

2.2.In the AWS Management Console, head to the AWS API Gateway dashboard and verify that there is API  successfull created.

![image_alt]()

2.3.In the AWS Management Console, head to the AWS DynamoDB dashboard and verify that there is Table successfull created.

![image_alt]()


## Testing the API with Postman
3.1.After deployment, use your API Gateway endpoint (e.g. `https://{api-id}.execute-api.{region}.amazonaws.com/prod/notes`) for testing.


3.2.Create Note – `POST /notes`
```json
POST /notes
Content-Type: application/json

{
  "title": "Up The Chels",
  "content": "I am proper Chels and London is Blue"
}
```

![image_alt]()

3.3.Get Note – `GET /notes/{id}`

```bash
GET /notes/123
```
![image_alt]()


3.4.Update Note – `PUT /notes/{id}`
```json
PUT /notes/123
Content-Type: application/json

{
  "title": "Updated Title",
  "content": "Updated note content"
}
```
![image_alt]()


3.5.Delete Note – `DELETE /notes/{id}`
```bash
GET /notes/123
```

![image_alt]()


## What we Learned by doing this project
1.How to build serverless microservices using AWS

2.How to secure Lambda access with IAM

3.How to automate cloud deployments with Terraform

4.How to integrate multiple AWS services into one system

5.How to test APIs using Postman or curl





