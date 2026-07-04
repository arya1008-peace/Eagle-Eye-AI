import json
import boto3

sns = boto3.client("sns")

TOPIC_ARN = "arn:aws:sns:us-east-1:784980637540:RiskAlertTopicV3"

def lambda_handler(event, context):

    for record in event["Records"]:

        if record["eventName"] == "INSERT":

            item = record["dynamodb"]["NewImage"]

            risk_level = item["risk_level"]["S"]
            customer_id = item["sk_id_curr"]["N"]
            risk_score = item["risk_score"]["N"]

            if risk_level == "High":

                message = f"""
High Risk Customer Detected

Customer ID: {customer_id}
Risk Score: {risk_score}
Risk Level: {risk_level}
"""

                sns.publish(
                    TopicArn=TOPIC_ARN,
                    Subject="High Risk Customer Alert",
                    Message=message
                )

    return {
        "statusCode": 200
    }