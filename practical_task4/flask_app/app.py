import os
from flask import Flask

app = Flask(__name__)

# Read values from environment variables
APP_MESSAGE = os.getenv("APP_MESSAGE", "Default Message")
PORT = int(os.getenv("PORT", 8000))

@app.route("/")
def home():
    return f"Message: {APP_MESSAGE}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=PORT)
