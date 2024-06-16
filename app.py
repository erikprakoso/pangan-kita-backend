from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from config import Config
from models import db
from routes import auth_bp, food_bp

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
migrate = Migrate(app, db)

app.register_blueprint(auth_bp, url_prefix='/api/auth')
app.register_blueprint(food_bp, url_prefix='/api/food')

if __name__ == '__main__':
    app.run(debug=True)
