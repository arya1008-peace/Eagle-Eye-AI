CREATE TABLE candidate_risk_dataset_phase2
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/candidate_risk_dataset_phase2/'
) AS

SELECT

    c.sk_id_curr,

    a.annual_income,

    a.employment_years,

    c.active_loans,

    COALESCE(b.total_loans, 0) AS total_loans,

    COALESCE(b.credit_history_length, 0) AS credit_history_length,

    c.avg_delay AS avg_days_late,

    c.max_delay AS max_days_late,

    c.late_payment_count AS missed_installments,

    COALESCE(i.avg_payment_ratio, 0) AS avg_payment_ratio,

    COALESCE(i.underpayment_count, 0) AS underpayment_count,

    COALESCE(i.total_shortfall, 0) AS total_shortfall,

    COALESCE(i.payment_completion_rate, 0) AS payment_completion_rate,

    COALESCE(p.previous_rejections, 0) AS previous_rejections,

    c.avg_credit_utilization,

    COALESCE(
        cc.max_credit_utilization,
        0
    ) AS max_credit_utilization,

    c.total_outstanding_debt,

    c.target

FROM candidate_risk_dataset c

LEFT JOIN customer_features a
ON c.sk_id_curr = a.sk_id_curr

LEFT JOIN bureau_loans_features b
ON c.sk_id_curr = b.sk_id_curr

LEFT JOIN installments_enrichment_features i
ON c.sk_id_curr = i.sk_id_curr

LEFT JOIN previous_rejections_features p
ON c.sk_id_curr = p.sk_id_curr

LEFT JOIN credit_card_enrichment_features cc
ON c.sk_id_curr = cc.sk_id_curr;