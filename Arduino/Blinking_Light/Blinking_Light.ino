int ledPin = 13;
int buttonPin = 8;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(buttonPin, OUTPUT);
  Serial.begin(9600); //initialize serial communication
}
  
void loop() {
   if (digitalRead(buttonPin) == HIGH) {
     digitalWrite(ledPin, HIGH);
   }
   else {
     digitalWrite(ledPin, LOW);
     delay(1000);
   } 
   
  Serial.println(digitalRead(buttonPin)); //dispense <value> into Serial Monitor
  
}

//analog write range 0-255
//analog reading  range 0 1024

