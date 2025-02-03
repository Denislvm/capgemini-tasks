# Azure Containerization and Orchestration

#### Practical Task 1: Deploy a Docker Container to Azure Container Instances (ACI) via Azure Portal
![image info](pict/1.1.jpg)
![image info](pict/1.2.jpg)
![image info](pict/1.3.jpg)
To build and publish a docker image to the Azure container registry, you need to run the following commands:
```
docker build -t <your_registry>.azurecr.io/<app_name>:latest .
```

Login to Azure and Azure acr:
```
az login
az acr login --name <your_registry>
```

Docker push:
```
docker push <your_registry>.azurecr.io/<app_name>:latest
```

Python code
```
import os
from flask import Flask

app = Flask(__name__)

APP_MESSAGE = os.getenv("APP_MESSAGE", "Default Message")
PORT = int(os.getenv("PORT", 8000))

@app.route("/")
def home():
    return f"Message: {APP_MESSAGE}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=PORT)
```
Docker file
```
FROM python:3.12-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
```

#### Practical Task 2: Configure Environment Variables in ACI via Azure Portal
![image info](pict/2.2.png)
![image info](pict/2.1.png)

#### Practical Task 4: Secure a Docker Container in ACI with Managed Identity via Azure Portal

![image info](pict/4.1.jpg)
![image info](pict/4.2.jpg)
![image info](pict/4.3.jpg)

```python
from flask import Flask
import os
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

app = Flask(__name__)

keyvault_name = os.environ["KEY_VAULT_NAME"]

secret_name = os.environ["SECRET_NAME"]

keyvault_url = ""
credential = DefaultAzureCredential()
client = SecretClient(vault_url=keyvault_url, credential=credential)

@app.route('/')
def hello():
    retrieved_secret = client.get_secret(secret_name)
    return f'Secret value: {retrieved_secret.value}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
```

```
FROM python:3.12-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 

COPY . .

EXPOSE 80

CMD ["python", "app.py"]

```