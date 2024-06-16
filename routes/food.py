from flask import request, jsonify, abort, send_from_directory
# Assuming you have Food and Category models
from models.model import Food, Category
from . import food_bp
from models import db
from utils.response import standard_response


@food_bp.route('/categories', methods=['GET'])
def get_categories():
    categories = Category.query.all()
    categories_list = [{"id": c.id, "name": c.name, "photo": c.photo} for c in categories]
    return standard_response(200, "Categories retrieved successfully", categories_list)


@food_bp.route('/search', methods=['GET'])
def search_food():
    query = request.args.get('q')
    foods = Food.query.filter(Food.name.contains(query)).all()
    foods_list = [{
        "id": f.id,
        "name": f.name,
        "description": f.description,
        "photo": f.photo,
        "whatsapp_number": f.whatsapp_number,
        "price": f.price,
        "category": f.category.name,
        # Get the content names
        "contents": [content.name for content in f.contents]
    } for f in foods]
    return standard_response(200, "Foods retrieved successfully", foods_list)


@food_bp.route('/detail/<int:food_id>', methods=['GET'])
def food_detail(food_id):
    food = Food.query.get_or_404(food_id)
    food_data = {
        "id": food.id,
        "name": food.name,
        "description": food.description,
        "photo": food.photo,
        "whatsapp_number": food.whatsapp_number,
        "price": food.price,
        "category": food.category.name,
        # Get the content names
        "contents": [content.name for content in food.contents]
    }
    return standard_response(200, "Food detail retrieved successfully", food_data)

@food_bp.route('/photo/<path:filename>', methods=['GET'])
def get_photo(filename):
    return send_from_directory('uploads', filename)


@food_bp.errorhandler(404)
def not_found_error(error):
    return standard_response(404, "Not Found")
