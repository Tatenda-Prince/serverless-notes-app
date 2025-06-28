import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table_name = os.environ['TABLE_NAME']
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    try:
        note_id = event['pathParameters']['id']
    except (KeyError, TypeError):
        return {
            'statusCode': 400,
            'body': json.dumps({'error': 'Missing path parameter: id'})
        }

    try:
        print(f"Attempting to delete noteId: {note_id} from table: {table_name}")
        response = table.delete_item(
            Key={'noteId': note_id},  # ✅ FIXED key name to match DynamoDB schema
            ConditionExpression="attribute_exists(noteId)"
        )
        return {
            'statusCode': 200,
            'body': json.dumps({'message': f'Note {note_id} deleted successfully'})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
