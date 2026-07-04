CREATE TABLE active_loan_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/active_loan_features/'
) AS

SELECT
    sk_id_curr,
    COUNT(*) AS active_loans

FROM bureau

WHERE credit_active = 'Active'

GROUP BY sk_id_curr;