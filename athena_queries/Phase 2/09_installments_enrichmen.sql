CREATE TABLE installments_enrichment_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/installments_enrichment_features/'
) AS

SELECT

    sk_id_curr,

    AVG(
        GREATEST(
            days_entry_payment - days_instalment,
            0
        )
    ) AS avg_days_late,

    MAX(
        GREATEST(
            days_entry_payment - days_instalment,
            0
        )
    ) AS max_days_late,

    SUM(
        CASE
            WHEN days_entry_payment > days_instalment
            THEN 1
            ELSE 0
        END
    ) AS missed_installments,

    AVG(
        amt_payment / NULLIF(
            amt_instalment,
            0
        )
    ) AS avg_payment_ratio,

    SUM(
        CASE
            WHEN amt_payment < amt_instalment
            THEN 1
            ELSE 0
        END
    ) AS underpayment_count,

    SUM(
        CASE
            WHEN amt_payment < amt_instalment
            THEN amt_instalment - amt_payment
            ELSE 0
        END
    ) AS total_shortfall,

    AVG(
        CASE
            WHEN amt_payment >= amt_instalment
            THEN 1
            ELSE 0
        END
    ) AS payment_completion_rate

FROM installments_payments

GROUP BY sk_id_curr;