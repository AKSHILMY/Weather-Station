#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>

const char* ssid = "AKS";
const char* password = "987654321";

 ESP8266WebServer server(80);

 String page = "";
 int LEDPin = 2;

 void setup(){
  page="<h1>Simple NODEMCU WEB SERVER</h1><p><a href=\"LEDOn\"><button>ON</button></a>&nbsp;<a href=\"LEDOff\"><button>OFF</button></a></p>";
  pinMode(LEDPin,OUTPUT);
  digitalWrite(LEDPin,LOW);

  delay(1000);
  Serial.begin(115200);
  WiFi.begin(ssid,password);
  Serial.println("");


 while (WiFi.status() != WL_CONNECTED){
    delay(500);
    Serial.print(".");
 }
    Serial.println("");
    Serial.print("Connected to ");
    Serial.println(ssid);
    Serial.println("IP address ");
    Serial.println(WiFi.localIP());
 server.on("/",[](){
  server.send(200,"text/html",page);   
 });
 server.on("/LEDOn",[](){
  server.send(200,"text/html",page);  
  digitalWrite(LEDPin,LOW);
  delay(1000);
  });
 server.on("/LEDOff",[](){
  server.send(200,"text/html",page);  
  digitalWrite(LEDPin,HIGH);
  delay(1000);
  });
  server.begin();
  Serial.println("Web Server Started!");
}
void loop(void){
  server.handleClient();
}
