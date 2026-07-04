CREATE TABLE bureau_loans_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/bureau_loans_features/'
) AS

SELECT

    sk_id_curr,

    COUNT(*) AS total_loans,

    ABS(
        MIN(days_credit)
    ) / 365.0 AS credit_history_length

FROM bureau

GROUP BY sk_id_curr;