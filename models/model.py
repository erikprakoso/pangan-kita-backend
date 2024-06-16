from . import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(150), nullable=False, unique=True)
    username = db.Column(db.String(150), nullable=False, unique=True)
    password = db.Column(db.String(150), nullable=False)

class Food(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(255), nullable=True)
    photo = db.Column(db.String(255), nullable=True)
    whatsapp_number = db.Column(db.String(15), nullable=False)
    price = db.Column(db.Float, nullable=False)

    category_id = db.Column(db.Integer, db.ForeignKey('category.id'), nullable=False)

class Category(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    foods = db.relationship('Food', backref='category', lazy=True)
    photo = db.Column(db.String(255), nullable=True)

class Content(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)

    # Relationship
    food_id = db.Column(db.Integer, db.ForeignKey('food.id'), nullable=False)
    food = db.relationship('Food', backref=db.backref('contents', lazy=True))