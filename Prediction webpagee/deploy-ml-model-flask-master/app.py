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

send_url = "http://api.ipstack.com/check?access_key=45406e558260d069bdfa65f48eb96f68"
geo_req = requests.get(send_url)
geo_json = json.loads(geo_req.text)
latitude = geo_json['latitude']
longitude = geo_json['longitude']
city = geo_json['city']

user_api = "fe4a36dc39d229db5428ec9b0beb4278"
location = city

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
    user = [float('%.2f' % (float(data_disc["field1"]))), float('%.2f' % (float(data_disc["field3"]))),
            float('%.2f' % (wind_spd*3.60)), float('%.2f' % (float(data_disc["field2"])))]
    temperature = user[0]
    water_level = user[1]
    wind_speed = user[2]
    humidity = user[3]
    arr = np.array([[temperature, water_level, wind_speed, humidity]])
    pred = classifier.predict(arr)
    user.append(pred)
    user.append(location)
    user.append(date_time)
    user.append(int(float(user[0])))
    if user[1] <= 10.0:
        user[1] = 0.00
    print(pred)
    # Add task
    db = MySQLdb.connect(host="localhost", user="root",
                         passwd="", db="weather")
    cur = db.cursor()
    cur.execute(
        """INSERT INTO sensor_data (temperature,rainfall,wind_speed,humidity)
    VALUES (%s,%s,%s,%s)""", (temperature, water_level, wind_speed, humidity))
    db.commit()
    print("Inserted")
    return render_template('home.html', user=user)


@app.route('/predict', methods=['POST'])
def home():
    return render_template('home.html', data=pred)


if __name__ == "__main__":
    app.run(debug=True)
