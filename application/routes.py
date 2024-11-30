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