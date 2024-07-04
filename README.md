# MLOps Project

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Dataset Exploration](#dataset-exploration)
  - [Data Preparation](#data-preparation)
  - [Model Training](#model-training)
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
```
## Getting Started

### Prerequisites
- [Docker](https://www.docker.com)
- [GitHub Account](https://github.com)
- [Azure Account](https://azure.microsoft.com/en-us)
- [VS Code IDE](https://code.visualstudio.com)

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/ayushguha-31/mlproject.git
    cd ml-project
2. Install Dependencies:
    ```bash
    pip install -r requirements.txt

## Dataset Exploration

This section includes EDA, preprocessing and Model training that happened in order to save and deploy the model in the web app. The concerned files are contained in the 'notebook' folder in the root dir.

### Data Preparation
1. Key Influencing Factors: Student performance is influenced by variables such as gender, ethnicity, parental education, lunch type, and test preparation. Female students and those with standard lunch tend to perform better.
2. Data Insights:
    - Females generally have higher overall scores, while males score higher in math.
    - Students from groups A and B perform poorly compared to other groups.
    - Parental education, particularly at the bachelor's or master's level, correlates with higher student performance.
3. Visualization Highlighst:
    - Histograms and KDE plots show score distributions and gender performance differences.
    - Pie charts reveal that most students are from group C/D, have standard lunch, and do not take test preparation courses.
    - Violin plots indicate score concentration ranges, particularly in math, reading, and writing.
4. Impact of Test Preparation and Lunch:
    - Completing a test preparation course significantly boosts performance in all subjects.
    - Standard lunch consumption is associated with better academic outcomes.
5. General Conclusions:
    - Performance is closely linked with lunch type, race/ethnicity, and parental education.
    - There is a slight performance edge for students completing test preparation courses.
    - Academic support and nutritional quality (standard lunch) are crucial for better performance.

### Model Training
1. Preprocessing: Used 'StandardScalar()' and 'OneHotEncoder()' to create a column transformer and applied it to features.
2. Train-Test Split: Split the dataset into training and testing sets with an 80-20 ratio.
3. Model Training & Evaluation: 
    - Defined an 'evaluate_model' function to calculate performance metrics: MAE, RMSE, and R2 score.
    - Trained and evaluated multiple regression models (Linear Regression, Lasso, Ridge, K-Neighbors, Decision Tree, Random Forest, XGBoost, CatBoost, AdaBoost).
4. Model Selection & Visualization: 
    - Selected Linear Regression for detailed analysis.
    - Plotted the actual vs. predicted values and visualized the differences between them using a scatter plot and regression line.