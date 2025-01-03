# Smart Weather Station
 
### Overview
This project is based on building a weather station and predicting rainfall using a machine learning model.
The following diagram demonstrates the project.

![See Scenario](./assets/images/application_scenario.jpg?raw=true "Application Scenario")

A device that is embedded with sensors is used to collect the weather information and the real-time information is sent to a server and a simple web application retreives the data from the server. The weather information and the prediction of rainfall is presented through a responsive GUI.

### The Device

This device collects weather information like humidity,temperature,wind speed, wind direction and rainfall from the sensors. The DHT22 sensor is used to obtain real-time humidity and temperature. The water level sensor along with a rain gauge is used to measure the rainfall. The wind speed and wind direction were fetched from an api. 
A NodeMCU micro controller is programmed to collect the data from the sensor and upload it to a server.


### Server and Database
The 'ThingSpeak' Server is used in this project. This provides the facility of graphically analysing the weather information received during a certain period of time. The information obtained from the sensors are recorded in a database for the creation of a dataset for future purposes.

### ML Model
#### The dataset
The project requires a dataset containing the selected weather information of the selected country.
The dataset from <a href="https://www.kaggle.com/datasets/arisdarmawan/australian-weather-dataset" alt="Dataset">here</a> is used as a possible replacement that facilitates the creation of a training model for the prediction of rainfall.
A sub dataset is created using the selected information from the dataset, and is used to prepare and train the prediction model.
<br>
Binary classification
Random forest classifier
Both precision and accuracy score = 0.99

```Note that the project requires a dataset containing all the weather information of the selected region required for weather prediction ,thus needs to be created consuming years of time.```


### Failure Detection
The sensors used in this project needs to be monitored in order to display real-time data in the GUI. Thus, LEDs were connected to the sensors which would blink upon the failure of the sensors to read sensor data. Certain sensors like the water level sensor has an inbuilt LED that detects the failure of the sensor. 
