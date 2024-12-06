from flask import render_template, Flask, jsonify
from . import db
from .models import Trainer
from flask import current_app as app
from sqlalchemy import create_engine, text

# engine = create_engine(Config.SQLALCHEMY_DATABASE_URI)
# Home Page
@app.route('/')
def index():
    return render_template('home.html')

# app = Flask(__name__)
## sample code to dynamically show table names
# # Database connection URL (update with your credentials)
# DB_URI = "postgresql+psycopg2://username:password@localhost:5432/your_database_name"

# # Create SQLAlchemy engine
# engine = create_engine(DB_URI)

# @app.route('/<table_name>')
# def display_table(table_name):
#     # Query the database dynamically based on the table name
#     try:
#         with engine.connect() as conn:
#             result = conn.execute(text(f"SELECT * FROM {table_name}"))
#             data = [row for row in result]  # Row data
#             columns = result.keys()  # Column names
#     except Exception as e:
#         # Handle errors (e.g., table not found)
#         return f"An error occurred: {str(e)}"

#     return render_template('table.html', table_name=table_name, columns=columns, data=data)

# Temporary Route that outputs all the trainers IDs and names that are in database
@app.route('/data')
def get_data():
    table_name="Trainers"
    data = Trainer.query.all()
    trainerColumns = ["Trainer ID", "Name", "Class", "Money Given"]

    # with engine.connect() as conn:
    #     result = conn.execute(text("SELECT * FROM Trainer"))
    # data1 = [row for row in data]  # Convert result to a list of rows
    trainerData = []
    for row in data:
        trainerData.append([row.tr_trainerid, row.tr_name, row.tr_classid, row.tr_money_given])
    print(data)
    print(trainerData)
    # columns = data.keys()
    # return render_template('home.html', data=trainerData)
    return render_template('home.html', data=trainerData, columns = trainerColumns, table_name=table_name)
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
