from flask import request, jsonify
from models.userModel import User
from config.db import session_data

def login():

    data = request.get_json()
    username = data["username"]
    email = data["email"]
    password = data["password"]

    try:
        session_data().execute(User.insert().values([
            {"username": username},
            {"email": email},
            {"password": password}
        ]))

        return jsonify({"success": True, "message":"Your data success registered!"})
    except Exception as e:
        return jsonify({"success": False, "message": str(e)})

