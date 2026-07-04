CREATE TABLE credit_card_enrichment_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/credit_card_enrichment_features/'
) AS

SELECT

    sk_id_curr,

    MAX(
        CASE
            WHEN amt_credit_limit_actual > 0
            THEN amt_balance / amt_credit_limit_actual
            ELSE 0
        END
    ) AS max_credit_utilization

FROM credit_card_balance

GROUP BY sk_id_curr;