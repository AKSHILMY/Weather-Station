from flask import Flask, render_template, request
from sklearn.preprocessing import LabelEncoder
import pickle
import numpy as np
from flask_mysqldb import MySQL, MySQLdb

model = pickle.load(open('model.pkl', 'rb'))

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'weather'

mysql = MySQL(app)
user = tuple()


@app.route('/')
def user():
    global user
    cur = mysql.connection.cursor()
    cur.execute(
        """select * from sensor_data ORDER BY "+%s+" DESC LIMIT 1;""", (id,))
    user = cur.fetchone()
    return render_template('home.html', user=user)


@app.route('/predict', methods=['POST'])
def home():
    data1 = user[0]
    data2 = user[1]
    data3 = user[2]
    data4 = user[3]
    arr = np.array([[data1, data2, data3, data4]])
    pred = model.predict(arr)
    return render_template('after.html', data=pred)


# Add task
db = MySQLdb.connect(host="localhost", user="root", passwd="", db="weather")
cur = db.cursor()


@app.route('/register/', methods=['GET', 'POST'])
def register():
    add_sensor_data()
    return render_template('home.html', user=user)


@app.route('/adduser/', methods=['GET', 'POST'])
def add_sensor_data():
    cur.execute(
        """INSERT INTO sensor_data (temperature,rainfall,wind_speed,humidity)
    VALUES (%s,%s,%s,%s)""", ("12.8", "0.8", "47", "72"))
    db.commit()
    print("Inserted")
    return render_template('home.html', user=user)


if __name__ == "__main__":
    app.run(debug=True)
