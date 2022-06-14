// TECHATRONIC.COM  
 #include <ESP8266WiFi.h>
#include "ThingSpeak.h"
const char *ssid = "AKS"; // Your wifi ssid
const char *password = "987654321";
WiFiClient client;
unsigned long myChannelNumber=1768351;
const char * myWriteAPIKey="XSOTVY4Y2RUOZXCR";
 void setup()  
 {  
  WiFi.begin(ssid,password);
   Serial.begin(115200);
   ThingSpeak.begin(client);
   pinMode(D1,INPUT);// sensor buart rate  
 }
 void loop()   
 {  
  int x =digitalRead(D1);
  int y = analogRead(A0);
  Serial.println(y);
  ThingSpeak.writeField(myChannelNumber,3,x,myWriteAPIKey);
  delay(1000);
  ThingSpeak.writeField(myChannelNumber,4,y,myWriteAPIKey);
  delay(1000);
  }  
