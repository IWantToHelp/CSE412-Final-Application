from flask import render_template, Flask, jsonify
from . import db
from .models import *
from flask import current_app as app
from sqlalchemy import create_engine, text
from config import Config

engine = create_engine(Config.SQLALCHEMY_DATABASE_URI)
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
    # return jsonify([{"trainer id": row.tr_trainerid, "trainer_name": row.tr_name} for row in data])

# ADD CODE BELOW
@app.route('/type')
def get_type():
    table_name="Types"
    data = Type.query.all()
    typeColumns = ["Types"]

    # with engine.connect() as conn:
    #     result = conn.execute(text("SELECT * FROM Trainer"))
    # data1 = [row for row in data]  # Convert result to a list of rows
    typeData = []
    for row in data:
        typeData.append([row.t_name])
    print(data)
    print(typeData)
    # columns = data.keys()
    # return render_template('home.html', data=trainerData)
    return render_template('home.html', data=typeData, columns = typeColumns, table_name=table_name)
    # return jsonify([{"trainer id": row.tr_trainerid, "trainer_name": row.tr_name} for row in data])

@app.route('/move')
def get_moves():
    table_name="Moves"
    data = Move.query.all()
    moveColumns = ["Name", "Power", "Accuracy", "Type", "PP"]

    # with engine.connect() as conn:
    #     result = conn.execute(text("SELECT * FROM Trainer"))
    # data1 = [row for row in data]  # Convert result to a list of rows
    moveData = []
    for row in data:
        moveData.append([row.m_name, row.m_power, row.m_acc, row.m_type, row.m_pp])
    print(data)
    print(moveData)
    # columns = data.keys()
    # return render_template('home.html', data=trainerData)
    return render_template('home.html', data=moveData, columns = moveColumns, table_name=table_name)
    # return jsonify([{"trainer id": row.tr_trainerid, "trainer_name": row.tr_name} for row in data])

@app.route('/nature')
def get_nature():
    table_name="Nature"
    data = Nature.query.all()
    natureColumns = ["Name", "Stat Bonus", "Stat Defect"]

    # with engine.connect() as conn:
    #     result = conn.execute(text("SELECT * FROM Trainer"))
    # data1 = [row for row in data]  # Convert result to a list of rows
    natureData = []
    for row in data:
        natureData.append([row.n_name, row.n_statbonus, row.n_statdefect])
    print(data)
    print(natureData)
    # columns = data.keys()
    # return render_template('home.html', data=trainerData)
    return render_template('home.html', data=natureData, columns = natureColumns, table_name=table_name)
    # return jsonify([{"trainer id": row.tr_trainerid, "trainer_name": row.tr_name} for row in data])

@app.route('/immunity')
def get_immunity():
    table_name="Immunity"
    try:
        with engine.connect() as conn:
            result = conn.execute(text(f"SELECT a.t_name AS Type, b.t_name AS TakesNoDamageFrom FROM TYPES as a, TYPES as b, immune WHERE i_effectiveid = a.t_typeid AND i_typeid = b.t_typeid;"))
            data = [row for row in result]  # Row data
            columns = result.keys()  # Column names
    except Exception as e:
        # Handle errors (e.g., table not found)
        return f"An error occurred: {str(e)}"
    natureColumns = ["Type", "Takes No Damage From"]

    return render_template('home.html', data=data, columns = natureColumns, table_name=table_name)
   
@app.route('/neutral')
def get_neutral():
    table_name="Neutral"
    try:
        with engine.connect() as conn:
            result = conn.execute(text(f"SELECT a.t_name AS Type, b.t_name AS TakesNoDamageFrom FROM TYPES as a, TYPES as b, neutraleffective WHERE ne_effectiveid = a.t_typeid AND ne_typeid = b.t_typeid;"))
            data = [row for row in result]  # Row data
            columns = result.keys()  # Column names
    except Exception as e:
        # Handle errors (e.g., table not found)
        return f"An error occurred: {str(e)}"
    natureColumns = ["Type", "Takes Neutral Damage From"]

    return render_template('home.html', data=data, columns = natureColumns, table_name=table_name)

@app.route('/super')
def get_super():
    table_name="Super Effective"
    try:
        with engine.connect() as conn:
            result = conn.execute(text(f"SELECT a.t_name AS Type, b.t_name AS TakesNoDamageFrom FROM TYPES as a, TYPES as b, supereffective WHERE se_effectiveid = a.t_typeid AND se_typeid = b.t_typeid;"))
            data = [row for row in result]  # Row data
            columns = result.keys()  # Column names
    except Exception as e:
        # Handle errors (e.g., table not found)
        return f"An error occurred: {str(e)}"
    natureColumns = ["Type", "Supereffective Against"]

    return render_template('home.html', data=data, columns = natureColumns, table_name=table_name)

@app.route('/not')
def get_not():
    table_name="Not Very Effective"
    try:
        with engine.connect() as conn:
            result = conn.execute(text(f"SELECT a.t_name AS Type, b.t_name AS TakesNoDamageFrom FROM TYPES as a, TYPES as b, notveryeffective WHERE nve_effectiveid = a.t_typeid AND nve_typeid = b.t_typeid;"))
            data = [row for row in result]  # Row data
            columns = result.keys()  # Column names
    except Exception as e:
        # Handle errors (e.g., table not found)
        return f"An error occurred: {str(e)}"
    natureColumns = ["Type", "Not Very Effective Against"]

    return render_template('home.html', data=data, columns = natureColumns, table_name=table_name)

@app.route('/pokemon')
def get_pokemon():
    table_name="Pokemon"
    try:
        with engine.connect() as conn:
            result = conn.execute(text(f"""SELECT p_name AS Pokemon, a.t_name AS Type1, b.t_name AS Type2, p_gender AS Gender, p_level AS Level, p_pokedexid AS PokedexID, tr_name AS Trainer, n_name as Nature
FROM pokemon, trainer, nature, typecombo, types as a, types as b
WHERE tr_trainerid=p_trainerid AND p_natureid=n_natureid AND p_typescombo=tc_id AND tc_firsttype = a.t_typeid AND (tc_secondtype = b.t_typeid OR tc_secondtype = NULL);
"""))
            data = [row for row in result]  # Row data
            columns = result.keys()  # Column names
    except Exception as e:
        # Handle errors (e.g., table not found)
        return f"An error occurred: {str(e)}"

    return render_template('home.html', data=data, columns = columns, table_name=table_name)

@app.route('/trainer')
def get_trainer():
    table_name="Trainer"
    try:
        with engine.connect() as conn:
            result = conn.execute(text(f"""SELECT tr_name AS name, c_classname AS class, tr_money_given AS money_given
FROM trainer, class
WHERE tr_classid=c_classid;
"""))
            data = [row for row in result]  # Row data
            columns = result.keys()  # Column names
    except Exception as e:
        # Handle errors (e.g., table not found)
        return f"An error occurred: {str(e)}"

    return render_template('home.html', data=data, columns = columns, table_name=table_name)


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
