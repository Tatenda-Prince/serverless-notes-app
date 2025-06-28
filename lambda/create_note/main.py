import json
import uuid
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table_name = os.environ['TABLE_NAME']
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    body = json.loads(event['body'])

    note_id = str(uuid.uuid4())
    title = body.get('title')
    content = body.get('content')

    if not title or not content:
        return {
            'statusCode': 400,
            'body': json.dumps({'message': 'Title and content are required'})
        }

    item = {
        'noteId': note_id,
        'title': title,
        'content': content
    }

    table.put_item(Item=item)

    return {
        'statusCode': 201,
        'body': json.dumps({'message': 'Note created', 'noteId': note_id})
    }
