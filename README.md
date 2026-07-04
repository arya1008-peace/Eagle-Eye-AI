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

# Machine Learning Pipeline

The machine learning workflow was developed in two stages. The first stage focused on establishing a complete cloud-based prediction pipeline, while the second stage concentrated on improving prediction quality through richer feature engineering and explainable outputs.

---

# Phase 1 Pipeline

The objective of Phase 1 was to build an end-to-end credit risk prediction system capable of estimating the probability that a customer would default on a loan.

The pipeline consists of the following stages.

```
Raw Banking Data
        │
        ▼
Amazon S3
        │
        ▼
Amazon Athena
(Feature Engineering)
        │
        ▼
Candidate Risk Dataset
        │
        ▼
Amazon SageMaker
(XGBoost Training)
        │
        ▼
Risk Score Prediction
        │
        ├────────► Power BI Dashboard
        │
        └────────► DynamoDB
                       │
                       ▼
                   AWS Lambda
                       │
                       ▼
                  Amazon SNS
```

The final output of Phase 1 was a customer-specific probability of default together with a corresponding risk category.

---

# Phase 1 Feature Engineering

Rather than training the model directly on raw banking data, customer behaviour was summarized into meaningful numerical features.

Each customer record consisted of the following engineered attributes.

| Feature                    | Description                                                 |
| -------------------------- | ----------------------------------------------------------- |
| Active Loans               | Number of currently active loans                            |
| Average Delay              | Average installment payment delay                           |
| Maximum Delay              | Maximum observed payment delay                              |
| Late Payment Count         | Number of delayed installment payments                      |
| Outstanding Debt           | Total unpaid debt across all loans                          |
| Average Credit Utilization | Average percentage of available credit currently being used |

These features were computed using SQL inside Amazon Athena before model training.

Feature engineering significantly reduces data complexity while preserving customer behaviour patterns that are useful for prediction.

---

# Why These Features Matter

Each engineered feature captures a different aspect of customer financial behaviour.

### Active Loans

Customers with multiple active loans generally have higher repayment obligations.

As the number of simultaneous financial commitments increases, the probability of financial stress may also increase.

---

### Average Payment Delay

Average delay measures how consistently late a customer pays their installments.

Occasional late payments are common.

Consistently delayed payments, however, often indicate declining repayment discipline.

---

### Maximum Payment Delay

Maximum delay captures the worst repayment behaviour observed.

A customer who once missed a payment by several months represents a much greater concern than one whose payments were delayed by only a few days.

---

### Late Payment Count

Instead of measuring how late a customer pays, this feature measures how often late payments occur.

Frequency often carries more predictive information than isolated extreme events.

---

### Outstanding Debt

Large unpaid debt reduces future repayment capacity.

As total debt increases, customers have less available income to meet future obligations.

---

### Average Credit Utilization

Credit utilization measures the percentage of available credit currently being used.

For example,

Credit Limit = $10,000

Outstanding Balance = $8,000

Utilization = 80%

High utilization generally indicates greater financial dependence on borrowed money.

---

# Model Selection

An XGBoost classifier was selected because it performs exceptionally well on structured financial datasets.

Unlike linear models, XGBoost can automatically learn complex relationships between variables.

For example,

A customer with

* low debt
* many active loans

may not necessarily be risky.

Similarly,

a customer with

* high debt
* excellent payment history

may still represent relatively low default risk.

Such nonlinear interactions are learned automatically by XGBoost during training.

---

# Risk Score Generation

After training, the model predicts the probability that a customer belongs to the default class.

Mathematically,

[
Risk\ Score = P(Default \mid Customer\ Features)
]

The output is therefore **not** a manually calculated score.

Instead, it represents the probability estimated by the trained XGBoost model after evaluating hundreds of learned decision trees.

The probability always lies between

[
0 \le P \le 1
]

Examples:

| Risk Score | Interpretation             |
| ---------- | -------------------------- |
| 0.12       | 12% probability of default |
| 0.48       | 48% probability of default |
| 0.91       | 91% probability of default |

Thus,

a higher score indicates a greater likelihood of future loan default.

---

# Risk Categorization

Although the model produces continuous probabilities, business users generally prefer discrete categories.

Customers are therefore classified into three risk groups.

| Risk Score  | Category    |
| ----------- | ----------- |
| 0.00 – 0.40 | Low Risk    |
| 0.40 – 0.70 | Medium Risk |
| 0.70 – 1.00 | High Risk   |

These thresholds provide a practical balance between sensitivity and interpretability.

They also simplify customer prioritization for relationship managers.

---

# Phase 2 Pipeline

While Phase 1 predicts default probability successfully, it does not explain the underlying causes.

Phase 2 extends the pipeline by incorporating additional behavioural and financial indicators.

```
Phase 1 Dataset
        │
        ▼
Additional Feature Engineering
        │
        ▼
Enriched Dataset
        │
        ▼
Improved XGBoost Model
        │
        ▼
Risk Score
        │
        ├────────► Risk Level
        │
        ├────────► Primary Risk Driver
        │
        └────────► Recommended Action
```

Instead of simply answering

*"Will this customer default?"*

the system now also answers

*"Why is this customer risky?"*

and

*"What should the bank do next?"*

---

# Phase 2 Feature Engineering

The second phase introduces richer financial behaviour indicators.

### Customer Profile

* Annual Income
* Employment Duration

These features estimate long-term repayment capacity.

---

### Credit Behaviour

* Total Loans
* Credit History Length

Customers with longer and healthier borrowing histories generally exhibit more predictable repayment behaviour.

---

### Repayment Behaviour

* Average Days Late
* Maximum Days Late
* Missed Installments

These features quantify payment discipline over time.

---

### Underpayment Behaviour

Instead of only measuring delayed payments, Phase 2 also evaluates partial payments.

Additional features include

* Average Payment Ratio
* Underpayment Count
* Total Payment Shortfall
* Payment Completion Rate

These metrics capture customers who consistently pay less than the required installment amount.

Such behaviour may indicate emerging financial stress even before complete payment defaults occur.

---

### Credit Card Behaviour

Maximum Credit Utilization identifies customers whose dependence on revolving credit has reached unusually high levels.

---

### Previous Loan Applications

Previous Rejections measure historical lending decisions.

Repeated loan rejections often indicate underlying financial weaknesses that remain relevant during future credit assessments.

