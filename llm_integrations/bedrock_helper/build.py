import boto3
import json

bedrock = boto3.client(
    service_name='bedrock-runtime',
    region_name='us-east-1'
)

def invoke_bedrock(prompt: str, model_id='anthropic.claude-v2'):
    body = {
        "prompt": f"\n\nHuman: {prompt}\n\nAssistant:",
        "max_tokens_to_sample": 200,
        "temperature": 0.7,
        "top_k": 250,
        "top_p": 1.0,
        "stop_sequences": ["\n\nHuman:"]
    }

    response = bedrock.invoke_model(
        body=json.dumps(body),
        modelId=model_id,
        accept='application/json',
        contentType='application/json'
    )
    
    result = json.loads(response['body'].read())
    return result['completion']
