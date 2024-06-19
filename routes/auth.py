from flask import request, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
from flask_jwt_extended import create_access_token  # Import create_access_token
from models.model import User
from . import auth_bp
from models import db
from utils.response import standard_response  # Import standard_response function

@auth_bp.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    if not all(key in data for key in ['email', 'username', 'password']):
        return standard_response(400, "Missing required fields")  # Check if required fields are present
    existing_email = User.query.filter_by(email=data['email']).first()
    if existing_email:
        return standard_response(400, "Email already exists")  # Check if email already exists
    existing_user = User.query.filter_by(username=data['username']).first()
    if existing_user:
        return standard_response(400, "Username already exists")  # Check if username already exists
    hashed_password = generate_password_hash(
        data['password'], method='pbkdf2:sha256')
    new_user = User(
        email=data['email'], username=data['username'], password=hashed_password)
    db.session.add(new_user)
    db.session.commit()
    return standard_response(201, "User registered successfully")  # Using standard_response function

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    user = User.query.filter_by(username=data['username']).first()
    if user and check_password_hash(user.password, data['password']):
        access_token = create_access_token(identity={'username': user.username, 'email': user.email})  # Create JWT token
        user_data = {
            'id': user.id,
            'email': user.email,
            'username': user.username,
            'access_token': access_token  # Include JWT token in response
        }
        return standard_response(200, "Login successful", user_data)  # Using standard_response function
    return standard_response(401, "Invalid credentials")  # Using standard_response function
