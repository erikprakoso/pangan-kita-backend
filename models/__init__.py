# models/__init__.py

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

from .model import User, Food, Category
