from flask import Flask
import os
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

app = Flask(__name__)

keyvault_name = ""

secret_name = ""

keyvault_url = ""
credential = DefaultAzureCredential()
client = SecretClient(vault_url=keyvault_url, credential=credential)

@app.route('/')
def hello():
    retrieved_secret = client.get_secret(secret_name)
    return f'Secret value: {retrieved_secret.value}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
