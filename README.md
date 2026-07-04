# Eagle-Eye-AI

# 🦅 Eagle Eye AI

### Intelligent Credit Risk Prediction & Customer Prioritization Platform

---

## Overview

Financial institutions process thousands of loan applications every day while simultaneously managing millions of existing customer accounts. Identifying customers who are likely to default on their loans is one of the most critical challenges in retail banking. Traditional credit scoring methods often rely on static financial information and predefined rules, making it difficult to capture evolving customer behaviour over time.

**Eagle Eye AI** is an end-to-end machine learning solution designed to predict customer credit default risk using behavioural and financial data. The project combines feature engineering, supervised machine learning, cloud computing and business intelligence to generate actionable risk scores that can assist banks in prioritizing customers for intervention.

Instead of merely predicting whether a customer is likely to default, the system also provides business-oriented insights such as the customer's primary risk factor and recommends an appropriate follow-up action. This transforms the model from a predictive tool into a decision-support system that can assist relationship managers and credit risk teams.

The project has been implemented entirely on AWS using Amazon Athena for large-scale feature engineering, Amazon SageMaker for model training, Amazon DynamoDB for storing prediction results, AWS Lambda for serverless processing, and Power BI for interactive dashboards.

---

## Business Problem

Banks lose billions of dollars every year due to loan defaults. Although modern banks possess enormous volumes of customer data, converting that data into meaningful risk assessments remains a significant challenge.

Many existing risk assessment systems primarily focus on historical credit scores and basic financial indicators. However, customer behaviour often changes gradually before a default occurs. Examples include:

* Increasing payment delays
* Frequent underpayments
* Growing outstanding debt
* Repeated loan application rejections
* Rising credit card utilization
* Declining payment completion rates

Individually, these factors may appear insignificant. When analysed collectively, however, they often reveal strong indicators of financial distress.

The objective of Eagle Eye AI is to combine these behavioural indicators into a unified risk prediction model that helps financial institutions identify high-risk customers earlier and take preventive action before defaults occur.

---

## Project Objectives

The project was developed with the following objectives:

* Build an end-to-end credit risk prediction pipeline using AWS cloud services.
* Engineer meaningful financial and behavioural features from multiple raw banking datasets.
* Train a machine learning model capable of estimating the probability of customer default.
* Classify customers into Low, Medium and High risk categories based on predicted probabilities.
* Identify the primary factor contributing to each customer's predicted risk.
* Recommend suitable business actions for different risk categories.
* Visualize customer risk profiles through interactive dashboards.

---

# Project Evolution

The project was developed in two phases.

## Phase 1 – Baseline Credit Risk Prediction

The first phase focused on building a complete machine learning pipeline capable of predicting customer risk using a small but meaningful set of engineered features.

Major tasks included:

* Extracting raw customer information using Amazon Athena
* Engineering initial financial risk features
* Creating the first training dataset
* Training an XGBoost classification model using Amazon SageMaker
* Generating customer risk scores
* Categorizing customers into Low, Medium and High risk groups
* Storing prediction results inside Amazon DynamoDB
* Triggering AWS Lambda for automated downstream processing
* Visualizing prediction results using Power BI

The primary objective of Phase 1 was to establish a complete cloud-based machine learning workflow from data engineering to business visualization.

---

## Phase 2 – Behavioural Risk Intelligence

While Phase 1 successfully predicted default probability, it did not explain *why* a customer was considered risky.

Phase 2 addressed this limitation by engineering additional behavioural features and transforming the prediction model into a richer decision-support system.

Enhancements introduced during Phase 2 include:

* Income-based features
* Employment history
* Credit history length
* Previous loan rejection history
* Payment completion ratios
* Underpayment behaviour
* Total payment shortfall
* Maximum credit utilization
* Primary risk driver identification
* Recommended business actions for each customer

These additions enable relationship managers to understand not only a customer's predicted risk but also the behavioural patterns responsible for that prediction.

---

# Technology Stack

| Category             | Technologies              |
| -------------------- | ------------------------- |
| Programming Language | Python                    |
| Cloud Platform       | Amazon Web Services (AWS) |
| Query Engine         | Amazon Athena             |
| Machine Learning     | Amazon SageMaker          |
| Model                | XGBoost Classifier        |
| Storage              | Amazon S3                 |
| Database             | Amazon DynamoDB           |
| Serverless Computing | AWS Lambda                |
| Notifications        | Amazon SNS                |
| Dashboard            | Power BI, HTML Dashboard  |
| Data Processing      | Pandas, NumPy             |
| Visualization        | Matplotlib                |

---

# AWS Services Used

## Amazon S3

Acts as the central data lake for the project.

It stores:

* Raw Home Credit datasets
* Feature engineered datasets
* Parquet files
* Prediction outputs
* Model input data

---

## Amazon Athena

Athena was used to perform SQL-based feature engineering directly on the datasets stored in Amazon S3.

Instead of preprocessing the entire dataset in Python, SQL queries were used to efficiently compute customer-level financial features such as active loans, payment delays, outstanding debt and credit utilization.

---

## Amazon SageMaker

Amazon SageMaker was used for model development.

Responsibilities included:

* Loading engineered datasets from Amazon S3
* Training the XGBoost model
* Predicting customer default probabilities
* Generating risk scores
* Identifying feature importance

---

## Amazon DynamoDB

Prediction results generated by the machine learning model were stored inside DynamoDB.

This enables low-latency retrieval of customer risk information and serves as the source for downstream automation.

---

## AWS Lambda

Lambda provides serverless event-driven processing.

Whenever new customer predictions are inserted into DynamoDB, Lambda can automatically process the record and initiate business workflows without requiring dedicated infrastructure.

---

## Amazon SNS

SNS was incorporated to demonstrate how high-risk customer alerts could be distributed automatically to banking teams through notifications.

Although this project focuses primarily on prediction, the inclusion of SNS illustrates how machine learning outputs can integrate with operational banking workflows.

---

## Power BI

Power BI was used to transform prediction results into interactive dashboards that enable business users to explore customer risk distributions, identify high-risk customers and analyze financial behaviour visually.

---

# Repository Structure

```text
Eagle-Eye-AI/

├── athena_queries/
│   ├── phase1/
│   └── phase2/
│
├── notebooks/
│   ├── Phase1_Model.ipynb
│   └── Phase2_Model.ipynb
│
├── dashboard/
│
├── lambda/
│
├── data/
│
├── images/
│
└── README.md
```

---

> **Architecture Diagram**

*A complete AWS architecture diagram illustrating the end-to-end workflow is included below.*

*(Insert architecture diagram here after it has been created.)*
