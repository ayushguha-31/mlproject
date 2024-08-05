# MLOps Project

## Table of Contents
- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Dataset Exploration](#dataset-exploration)
  - [Data Preparation](#data-preparation)
  - [Model Training](#model-training)
- [Project-Files](#project-files)
- [Deployment](#deployment)
  - [Docker Setup](#docker-setup)
  - [Azure Deployment](#azure-deployment)
- [CI/CD Pipeline](#cicd-pipeline)
  - [GitHub Actions Setup](#github-actions-setup)
  - [Continuous Integration](#continuous-integration)
  - [Continuous Deployment](#continuous-deployment)

## Introduction
This project demonstrates the implementation of MLOps (Machine Learning Operations) through the creation of a web application. The frontend is built using HTML, the backend is built using Flask, and the application is deployed on Azure using Docker. Additionally, a CI/CD pipeline is established using GitHub Actions.

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

## Project Files

### `utils.py`

This file serves as a set of utility functions that streamlines the workflow of saving/loading models and evaluating multiple machine learning models. It helps in maintaining a clean and efficient codebase, especially useful in larger projects or collaborative environments.
Here is the summary of all the functions of this file:
- The code provides utility functions for saving, loading, and evaluating machine learning models.
- `save_object`: Saves a Python object to a file using pickle.
- `evaluate_models`: Evaluates multiple machine learning models using GridSearchCV and returns their R-squared scores on the test set.
- `load_object`: Loads a Python object from a file using pickle.
- The `CustomException` is used for handling exceptions in a specific manner defined elsewhere in the code.

### `logger.py`

The overall purpose of this file is to set up a logging mechanism for a Python application. Specifically, it:

- Generates a timestamped log file: This helps in distinguishing log files created at different times, making it easier to trace back events to specific runs or periods.
- Creates a directory for log files: Keeps log files organized in a dedicated directory (logs).
- Configures the logging format and level: Ensures that all log messages follow a consistent format and that only messages of a certain severity level (INFO and above) are recorded.
- Logs a startup message: Indicates when the logging system has been initialized, useful for debugging and monitoring the start of the logging process.

### `exception.py`

This file sets up a custom exception handling system. It includes the following function
- `error_message_detail` Function: Extracts and formats detailed information about an exception, including the script name and line number where the error occurred.
- `CustomException` Class: A custom exception class that enhances the standard exception with detailed error information, making it easier to debug and log errors.
- Usage: This is useful in giving informative error handling and logging to diagnose issues effectively.

### `predict_pipeline`

This code defines two classes, PredictPipeline and CustomData, to facilitate making predictions with a machine learning model. 
- The `PredictPipeline` class handles loading a pre-trained model and preprocessor from specified file paths, transforming input features, and making predictions. 
- The `CustomData` class structures input data (like gender, race, parental education level, lunch type, test preparation course, reading score, and writing score) and converts it into a pandas DataFrame. 
- This structured approach ensures that data can be easily preprocessed and fed into the prediction pipeline, with comprehensive error handling using a custom exception class.

### `data_transformation.py`

The file sets up a comprehensive data preprocessing pipeline, ensuring that both numerical and categorical data are appropriately handled and transformed before being fed into a machine learning model. This setup helps in maintaining consistency and reusability of the preprocessing steps across different stages of the project.
- `get_data_transformer_object`
Purpose: Creates and returns a preprocessing pipeline for numerical and categorical data.
Details: Defines and applies imputation, scaling, and encoding steps.
- `initiate_data_transformation`
Purpose: Reads data, applies preprocessing, and saves the preprocessor.
Details: Transforms data using the preprocessing pipeline and returns processed arrays and preprocessor file path.

### `model_trainer.py`

- The ModelTrainer class is responsible for training multiple regression models, evaluating their performance, selecting the best one, and saving it. 
- The initiate_model_trainer method performs model training, hyperparameter tuning, and evaluation to identify the best model based on R² score.

### `data_ingestion.py`

This code handles the data ingestion, transformation, and model training pipeline for a machine learning project.

- `DataIngestion` Class: Manages the process of reading raw data, splitting it into training and test sets, and saving these sets.
Key Methods:
- `initiate_data_ingestion()`: 
  -Reads the dataset from a CSV file. 
  -Saves the raw data.
  -Splits the data into training and test sets.
  -Saves these sets to specified file paths.
Main Execution Block:
 -Process:
  -Creates an instance of DataIngestion and performs data ingestion.
  -Creates an instance of DataTransformation to preprocess the training and test data.
  -Creates an instance of ModelTrainer to train and evaluate models.
  -Prints the R² score of the best model.

## Deployment

### Docker Setup

The Docker image was built and pushed using docker cli. The following commands were used:

```bash
cd project_path

docker build -t testdockeranubhav.azurecr.io/Studentperformance27:latest .

docker login testdockeranubhav.azurecr.io

docker push testdockeranubhav.azurecr.io/Studentperformance27:latest
```


### Azure Deployment

1. Create Resource Group
2. Create Container Registry
3. Create Web App
4. Push the docker image using docker cli.

## CI/CD Pipeline

1. Go the Azure App Deployment Center.
2. Change Source to GitHub Actions.
3. Login to your GitHub account and connect your project repository.
4. As soon as the configurations are saved, Git Actions will start the CI/CD pipeline deployment.