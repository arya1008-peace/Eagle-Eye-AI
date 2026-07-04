CREATE TABLE payment_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/payment_features/'
) AS

SELECT

    sk_id_curr,

    AVG(
        GREATEST(
            days_entry_payment - days_instalment,
            0
        )
    ) AS avg_delay,

    MAX(
        GREATEST(
            days_entry_payment - days_instalment,
            0
        )
    ) AS max_delay

FROM installments_payments

GROUP BY sk_id_curr;