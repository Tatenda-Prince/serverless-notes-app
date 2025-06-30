# Serverless Notes App (AWS + Terraform)


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