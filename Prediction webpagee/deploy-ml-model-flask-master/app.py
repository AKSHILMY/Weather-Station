from flask import Flask, render_template, request
from sklearn.preprocessing import LabelEncoder
import pickle
import numpy as np
from flask_mysqldb import MySQL

model = pickle.load(open('model.pkl', 'rb'))

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'weather'


mysql = MySQL(app)

user = tuple()


@app.route("/record/<int:id>")
def user(id):
    global user
    cur = mysql.connection.cursor()
    cur.execute(
        """select * from sensor_data ORDER BY "+%s+" DESC LIMIT 1;""", (id,))
    user = cur.fetchone()
    return render_template('home.html', user=user)


@app.route('/')
def man():
    return render_template('home.html')


@app.route('/predict', methods=['POST'])
def home():
    data1 = user[0]
    data2 = user[1]
    data3 = user[2]
    data4 = user[3]
    arr = np.array([[data1, data2, data3, data4]])
    pred = model.predict(arr)
    return render_template('after.html', data=pred)


if __name__ == "__main__":
    app.run(debug=True)
