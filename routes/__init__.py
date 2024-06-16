from flask import Blueprint

auth_bp = Blueprint('auth', __name__)
food_bp = Blueprint('food', __name__)

from . import auth, food
