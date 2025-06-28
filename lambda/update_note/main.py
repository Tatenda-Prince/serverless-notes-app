import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table_name = os.environ['TABLE_NAME']
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    note_id = event['pathParameters']['id']
    body = json.loads(event['body'])

    title = body.get('title')
    content = body.get('content')

    if not title or not content:
        return {
            'statusCode': 400,
            'body': json.dumps({'message': 'Title and content are required'})
        }

    try:
        response = table.update_item(
            Key={'noteId': note_id},
            UpdateExpression='SET title = :t, content = :c',
            ExpressionAttributeValues={
                ':t': title,
                ':c': content
            },
            ReturnValues='UPDATED_NEW'
        )

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Note updated', 'updatedAttributes': response['Attributes']})
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'message': str(e)})
        }
