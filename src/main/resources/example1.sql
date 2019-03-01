SELECT
    UNIX_TIMESTAMP(TO_UTC_TIMESTAMP(CONCAT(SUBSTR(partition_date, 1, 10), ' 00:00:00'),
        'America/Los_Angeles')) * 1000 AS timestamp,
    lms_roadblock_revenue,
    lts_roadblock_revenue
FROM (
    SELECT
        partition_date,
        SUM(IF(product_type = 'MARKETING_SOLUTIONS', revenue_usd, 0)) AS lms_roadblock_revenue,
        SUM(IF(product_type = 'TALENT_SOLUTIONS', revenue_usd, 0)) AS lts_roadblock_revenue
    FROM
        input_agg_sas_dynamic_subscriptions_delivery
    WHERE
        roadblock_type IN ('PAGE', 'AUD')
    GROUP BY
        partition_date
) AS T
