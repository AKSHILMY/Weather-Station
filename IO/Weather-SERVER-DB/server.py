import urllib.request
import re
from bs4 import BeautifulSoup
import json

# data = urllib.request.urlopen(
#     "https://api.thingspeak.com/update?api_key=XSOTVY4Y2RUOZXCR&field1="+str(900))
# print(data)

datafromwebsite = urllib.request.urlopen(
    "https://api.thingspeak.com/channels/1768351/feeds.json?results=2")
select = repr(datafromwebsite.read())
print(json.loads(select))
select = select[300:]
temp = re.search('field1":"(.+?)",', select)
if temp:
    print(temp.group(1))
humidity = re.search('field2":"(.+?)",', select)
if humidity:
    print(humidity.group(1))
rain = re.search('field3":"(.+?)",', select)
if rain:
    print(rain.group(1))
