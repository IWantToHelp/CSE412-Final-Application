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
    return jsonify([{"trainer id": row.tr_trainerid, "trainer_name": row.tr_name} for row in data])

# ADD CODE BELOW

#Route that allows users to add trainers (but just their trainer ID and name) to the database; expand this to add entire entries
@app.route('/add-trainer', methods=['POST'])
def add_trainer():
    # Extract data from the incoming request
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No input data provided'}), 400

    tr_trainerid = data.get('tr_trainerid')
    tr_name = data.get('tr_name')
    
    if not all([tr_trainerid, tr_name]):
        return jsonify({'error': 'Missing data'}), 400

    # Create a new Trainer instance
    new_trainer = Trainer(tr_trainerid = tr_trainerid, tr_name=tr_name)

    # Add the new trainer to the session and commit it to the database
    db.session.add(new_trainer)
    try:
        db.session.commit()
        return jsonify({'message': 'New trainer added successfully', 'trainer_id': new_trainer.tr_trainerid}), 201
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': 'Failed to add new trainer', 'details': str(e)}), 500

# Route that allows users to remove trainers (but just their trainer ID and name) to the database; expand this to remove entire entries
@app.route('/delete-trainer/<int:tr_trainerid>', methods=['DELETE'])
def delete_trainer(tr_trainerid):
    # Find the trainer by their ID
    trainer = Trainer.query.get(tr_trainerid)
    if not trainer:
        return jsonify({'error': 'Trainer not found'}), 404

    # Attempt to delete the trainer from the database
    try:
        db.session.delete(trainer)
        db.session.commit()
        return jsonify({'message': 'Trainer deleted successfully'}), 200
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': 'Failed to delete trainer', 'details': str(e)}), 500
