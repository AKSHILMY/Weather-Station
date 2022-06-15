import requests
import time
import json

url = "https://api.thingspeak.com/channels/1768351/feeds/last.json?api_key=4SI1XXXBA70UG705"
# while True:
response = requests.get(url)
print(response.text)
data_disc = json.loads(response.text)
print(data_disc)
print("Temperature", data_disc["field1"])
print("Humidity", data_disc["field2"])
print("Rainfall", data_disc["field3"])

    # time.sleep(1)
