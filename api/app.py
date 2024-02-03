from dotenv import load_dotenv
from flask import Flask
from config.db import session_data
from routes.user import blueprint as user_blueprint

load_dotenv()

app = Flask(__name__)

# Register the user blueprint with the app
app.register_blueprint(user_blueprint, url_prefix='/api/user')

# Your other app configurations and routes go here

if __name__ == '__main__':
    app.run()
