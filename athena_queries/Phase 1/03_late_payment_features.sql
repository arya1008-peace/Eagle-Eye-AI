CREATE TABLE late_payment_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/late_payment_features/'
) AS

SELECT

    sk_id_curr,

    COUNT(*) AS late_payment_count

FROM installments_payments

WHERE days_entry_payment > days_instalment

GROUP BY sk_id_curr;