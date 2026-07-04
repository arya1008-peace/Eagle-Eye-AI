CREATE TABLE previous_rejections_features
WITH (
    format='PARQUET',
    external_location='s3://eagle-eye-ai-data/processed-data/previous_rejections_features/'
) AS

SELECT

    sk_id_curr,

    SUM(
        CASE
            WHEN name_contract_status = 'Refused'
            THEN 1
            ELSE 0
        END
    ) AS previous_rejections

FROM previous_application

GROUP BY sk_id_curr;