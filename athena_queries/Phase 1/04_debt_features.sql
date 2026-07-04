CREATE TABLE debt_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/debt_features/'
) AS

SELECT

    sk_id_curr,

    SUM(amt_credit_sum_debt) AS total_outstanding_debt

FROM bureau

GROUP BY sk_id_curr;