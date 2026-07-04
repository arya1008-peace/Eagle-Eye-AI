CREATE TABLE customer_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/customer_features/'
) AS

SELECT

    sk_id_curr,

    amt_income_total AS annual_income,

    ABS(days_employed) / 365.0 AS employment_years

FROM application_train;