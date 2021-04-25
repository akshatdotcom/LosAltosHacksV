from flask import Flask, render_template, request
from db import pullData, pushData

app = Flask(__name__)
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=False)

@app.route('/', methods=['GET', 'POST'])
def index():
    data = pullData("SELECT * FROM events2;") + '---' + pullData('SELECT * FROM resources')
    return render_template('index.html', value=data)

# pushData("INSERT INTO events (name, description, class) VALUES ('writing', 'timed essay', 'English');")
