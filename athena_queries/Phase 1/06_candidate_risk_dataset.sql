CREATE TABLE candidate_risk_dataset
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/candidate_risk_dataset/'
) AS

SELECT

    a.sk_id_curr,

    a.target,

    COALESCE(al.active_loans, 0) AS active_loans,

    COALESCE(p.avg_delay, 0) AS avg_delay,

    COALESCE(p.max_delay, 0) AS max_delay,

    COALESCE(lp.late_payment_count, 0) AS late_payment_count,

    COALESCE(d.total_outstanding_debt, 0) AS total_outstanding_debt,

    COALESCE(c.avg_credit_utilization, 0) AS avg_credit_utilization

FROM application_train a

LEFT JOIN active_loan_features al
ON a.sk_id_curr = al.sk_id_curr

LEFT JOIN payment_features p
ON a.sk_id_curr = p.sk_id_curr

LEFT JOIN late_payment_features lp
ON a.sk_id_curr = lp.sk_id_curr

LEFT JOIN debt_features d
ON a.sk_id_curr = d.sk_id_curr

LEFT JOIN credit_card_features c
ON a.sk_id_curr = c.sk_id_curr;