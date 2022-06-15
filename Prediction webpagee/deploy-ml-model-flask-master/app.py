from flask import Flask, render_template, request
from sklearn.preprocessing import LabelEncoder
import pickle
import numpy as np
from flask_mysqldb import MySQL, MySQLdb

import requests
import time
import json

import os
from datetime import datetime
from urllib.request import urlopen
url = "http://ipinfo.io/json"
response = urlopen(url)
data = json.load(response)

user_api = "fe4a36dc39d229db5428ec9b0beb4278"
location = data['city']

complete_api_link = "https://api.openweathermap.org/data/2.5/weather?q=" + \
    location+"&appid="+user_api
api_link = requests.get(complete_api_link)
api_data = api_link.json()
wind_spd = api_data['wind']['speed']
date_time = datetime.now().strftime("%d %b %Y | %I:%M:%S %p")

print("-------------------------------------------------------------")
print("Weather Stats for - {}  || {}".format(location.upper(), date_time))
print("-------------------------------------------------------------")

print("Current wind speed    :", wind_spd, 'kmph')


url = "https://api.thingspeak.com/channels/1768351/feeds/last.json?api_key=4SI1XXXBA70UG705"
response = requests.get(url)
print(response.text)
data_disc = json.loads(response.text)


classifier = pickle.load(open('classifier.pkl', 'rb'))

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
    # cur = mysql.connection.cursor()
    # cur.execute(
    #     """select * from sensor_data ORDER BY "+%s+" DESC LIMIT 1;""", (id,))
    # user = cur.fetchone()
    response = requests.get(url)
    print(response.text)
    data_disc = json.loads(response.text)
    user = ["{:.2f}".format(float(data_disc["field1"])), "{:.2f}".format(float(data_disc["field3"])),
            wind_spd, "{:.2f}".format(float(data_disc["field2"]))]
    data1 = user[0]
    data2 = user[1]
    data3 = user[2]
    data4 = user[3]
    arr = np.array([[data1, data2, data3, data4]])
    pred = classifier.predict(arr)
    user.append(pred)
    user.append(location)
    user.append(date_time)
    user.append(int(float(user[0])))
    print(pred)
    return render_template('home.html', user=user)


@app.route('/predict', methods=['POST'])
def home():

    return render_template('home.html', data=pred)


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
