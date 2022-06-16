import requests
import os
from datetime import datetime
import json
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
