from flask import render_template, Flask, jsonify
from . import db
from .models import Trainer
from flask import current_app as app

# Home Page
@app.route('/')
def index():
    return render_template('home.html')

# Temporary Route that outputs all the trainers IDs and names that are in database
@app.route('/data')
def get_data():
    data = Trainer.query.all()
    return jsonify([{"trainer id": row.tr_trainerid, "trainer name": row.tr_name} for row in data])

# ADD CODE BELOW

# Route that allows users to remove entries from the database
@app.route('/delete-pokemon/<int:pokemon_id>', methods=['DELETE'])
def delete_pokemon(pokemon_id):
    # Find the Pokémon by ID
    pokemon = Pokemon.query.get(pokemon_id)
    if pokemon is None:
        return jsonify({'error': 'Pokémon not found'}), 404

    # Delete the Pokémon from the database
    try:
        db.session.delete(pokemon)
        db.session.commit()
        return jsonify({'message': 'Pokémon deleted successfully'}), 200
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500
