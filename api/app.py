from dotenv import load_dotenv
from flask import Flask
from config.db import session_data
from routes.user import blueprint as user_blueprint

load_dotenv()

app = Flask(__name__)

app.register_blueprint(user_blueprint, url_prefix='/api/user')

if __name__ == '__main__':
    app.run()
