from flask import request, jsonify
from sqlalchemy.orm import Session
from config.db import session_data
from models.userModel import Users, Base

engine = session_data()
Base.metadata.create_all(engine)

def login():
    data = request.get_json()
    username = data["username"]
    email = data["email"]
    password = data["password"]

    try:
        with Session(engine) as session:
            user = Users(username=username, email=email, password=password)
            session.add(user)
            session.commit()
            return jsonify({"success": True, "message": "Your data successfully registered!"})
    except Exception as e:
        return jsonify({"success": False, "message": str(e)})
