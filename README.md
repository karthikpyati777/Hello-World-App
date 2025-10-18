# Hello-World-App

A simple "Hello, World from Kubernetes!" web application demonstrating **Infrastructure as Code (IaC)**, **containerization**, **Kubernetes deployment**, and **CI/CD automation**.  

---

## Overview

This project showcases the automated deployment of a web application to a **Kubernetes cluster** using modern DevOps practices. The goal is to demonstrate the ability to:

- Provision cloud infrastructure with Terraform.
- Build and containerize a web application with Docker.
- Deploy the application to Kubernetes using manifests.
- Implement a CI/CD pipeline for automated builds and deployments.

The web application can be any simple app (Spring Boot, Node.js, Python Flask, or static Nginx). The deployed service is publicly accessible via a LoadBalancer or Ingress resource.

---

## Core Components

1. **Infrastructure as Code (IaC)**:  
   - Terraform scripts to provision a **managed Kubernetes cluster** (EKS, GKE, or AKS) just installed ec2 VM and configuration set by manual way  
   - Networking components such as default VPC and Security Groups added

2. **Containerization**:  
   - Dockerfile optimized for a small footprint.  
   - Builds an image of the web application ready for Kubernetes deployment.  

3. **Kubernetes Manifests**:  
   - Deployment: Manages application pods with automatic scaling options.  
   - Service: Type `LoadBalancer` used  
    

4. **CI/CD Pipeline**:  
   - Implemented using **GitHub Actions / Jenkins** (choose based on your setup).  
   - Automatically triggers on commits to the `main` branch.  
   - Pipeline steps:
     1. Build the Docker image.
     2. Push the image to a container registry (Docker Hub, ECR, GCR).
     3. Deploy the application to Kubernetes using `kubectl apply -f apply` on manifests.

---

## Prerequisites

- Terraform installed and configured with cloud provider credentials.
- kubectl configured to access the Kubernetes cluster.
- Docker installed and logged in to your container registry.
- Git for version control.

---

## Setup Instructions

### 1. Provision Kubernetes Cluster


cd Devops-task
terraform init
terraform plan
terraform apply

2. Build and Push Docker Image

   docker build -t <your-docker-username>/hello-world-app:latest .
   docker push <your-docker-username>/hello-world-app:latest

3. Deploy to Kubernetes

   kubectl apply -f k8s/deployment.yaml
   
   Verify pods and services:

    kubectl get pods
    kubectl get svc

--> Access the application using the LoadBalancer IP


4. CI/CD Automation

The pipeline automatically triggers on main branch commits:

Builds the Docker image.

Pushes it to the container registry.

Updates the Kubernetes deployment with the new image.

    
   










