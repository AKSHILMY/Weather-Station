#include "DHT.h"
#include <ESP8266WiFi.h>
#include "ThingSpeak.h"
#define DHTPIN 2 // IMPORTANT D2 on NodeMCU is GPIO 4

// Uncomment whatever type you're using!
//#define DHTTYPE DHT11 // DHT 11
#define DHTTYPE DHT22 // DHT 22 (AM2302), AM2321
//#define DHTTYPE DHT21 // DHT 21 (AM2301)

const char *ssid = "AKS"; // Your wifi ssid
const char *password = "987654321"; //Your wifi password

unsigned long myChannelNumber = 1768351;
const char * myWriteAPIKey = "XSOTVY4Y2RUOZXCR";

const char* server = "api.thingspeak.com";

WiFiClient client;

DHT dht(DHTPIN, DHTTYPE);

void updateThingSpeak(float t, float h,float s1){
    ThingSpeak.setField(1,t);
    ThingSpeak.setField(2,h);
    ThingSpeak.setField(3,s1);
    ThingSpeak.writeFields(myChannelNumber,myWriteAPIKey);
    delay(1000);
}
#define LED D3 
void setup()
{
    pinMode(LED, OUTPUT); // set the digital pin as output.
    // put your setup code here, to run once:
    Serial.begin(115200);
    dht.begin();
    ThingSpeak.begin(client);
    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
        Serial.print("waiting for wifi to be connected");
    }

    Serial.println("");
    Serial.println("WiFi connected");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
}
//float s1 = 0;
void loop()
{   
    digitalWrite(LED, HIGH);
    // turn the LED off.(Note that LOW is the voltage level but actually
                      //the LED is on; this is because it is acive low on the ESP8266.
            // wait for 1 second.
   // turn the LED on.
    
    // put your main code here, to run repeatedly:
    delay(2000);
    float h = dht.readHumidity();
    //celcius
    float t = dht.readTemperature();
    //fahrenheit
    float f = dht.readTemperature(true);
       // Check if any reads failed and exit early (to try again).
    if (isnan(h) || isnan(t) || isnan(f))
    {
        digitalWrite(LED, LOW);
        delay(1000);
        Serial.println("Failed to read from DHT sensor!");
        return;
    }

    // Compute heat index in Fahrenheit (the default)
    float hif = dht.computeHeatIndex(f, h);
    // Compute heat index in Celcius
    float hic = dht.computeHeatIndex(t, h, false);

    Serial.print("Humidity: ");
    Serial.print(h);
    Serial.print(" %\t");
    Serial.print("Temperature: ");
    Serial.print(t);
    Serial.print(" *C ");
    Serial.print(f);
    Serial.print(" *F\t");
    Serial.print("Heat index: ");
    Serial.print(hic);
    Serial.print(" *C ");
    Serial.print(hif);
    Serial.println(" *F");

//    WATER LEVEL
    int s1=analogRead(A0); // Water Level Sensor output pin connected A0  
    int level = map(s1, 0, 521, 0, 40); // 4 levels  // See the Value In Serial Monitor     
    Serial.println(level);
//    delay(100);      // for timer  

    if(client.connect(server,80)){
        updateThingSpeak(t,h,s1);
    }
}
