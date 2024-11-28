from flask import render_template
#from . import db
#from .models import User
from flask import current_app as app

@app.route('/')
def index():
    #users = User.query.all()
    return render_template('home.html')
