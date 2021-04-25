from flask import Flask, render_template, request
from db import pullData, pushData

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    data = "Pulled data: ", pullData("SELECT * FROM events;")
    return render_template('index.html', value=data)

# pushData("INSERT INTO events (name, description, class) VALUES ('writing', 'timed essay', 'English');")