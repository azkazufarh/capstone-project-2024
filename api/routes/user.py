from flask import Blueprint
from controllers.userController import login

blueprint = Blueprint('blueprint', __name__)

blueprint.route('/login', methods=['POST'])(login)