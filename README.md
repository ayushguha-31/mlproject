# MLOps Project

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Running the Web App Locally](#running-the-web-app-locally)
  - [Data Preparation](#data-preparation)
  - [Model Training](#model-training)
  - [Model Evaluation](#model-evaluation)
- [Deployment](#deployment)
  - [Docker Setup](#docker-setup)
  - [Azure Deployment](#azure-deployment)
- [CI/CD Pipeline](#cicd-pipeline)
  - [GitHub Actions Setup](#github-actions-setup)
  - [Continuous Integration](#continuous-integration)
  - [Continuous Deployment](#continuous-deployment)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Introduction
This project demonstrates the implementation of MLOps (Machine Learning Operations) through the creation of a web application. The frontend is built using HTML, the backend is built using Flask, and the application is deployed on Azure using Docker. Additionally, a CI/CD pipeline is established using GitHub Actions.

## Project Structure
```plaintext
.
├── app
│   ├── static
│   │   └── style.css
│   ├── templates
│   │   └── index.html
│   ├── main.py
│   ├── model.py
│   └── requirements.txt
├── data
│   ├── raw
│   └── processed
├── notebooks
│   ├── data_preparation.ipynb
│   ├── model_training.ipynb
│   └── model_evaluation.ipynb
├── .github
│   └── workflows
│       └── main.yml
├── Dockerfile
├── README.md
├── setup.py
└── LICENSE
