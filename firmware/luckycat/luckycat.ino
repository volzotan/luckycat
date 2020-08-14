#include <Servo.h>

/* Board Type:
 * GENERIC ESP8266 Module
 * 
 * Pinout:
 * 
 * Servo: D2
 * 
 * (nothing else)
 */

#define SERVO_PIN               2
#define MOVEMENT_MAX_TIME       1000
#define SERIAL                  Serial
#define DETACH_AFTER_MOVEMENT   True

Servo arm; // Servo Library
char *inputBuffer               = (char*) malloc(sizeof(char) * 100);
int serialParam                 = -1;

void setup() {
  
    SERIAL.begin(9600);

    arm.attach(SERVO_PIN);

    // move arm once up and down
    for (int pos = 0; pos <= 180; pos += 1) { 
        arm.write(pos);              
        delay(15);    
    }   
    for (int pos = 180; pos > 0; pos -= 1) { 
        arm.write(pos);              
        delay(15);    
    }   

    // disable the servo again otherwise it will try to correct
    // it's position regularly
    #ifdef DETACH_AFTER_MOVEMENT
        arm.detach();
    #endif
}

void loop() {
    serialEvent();
}

void moveArm(int pos) {

    #ifdef DETACH_AFTER_MOVEMENT
        arm.attach(SERVO_PIN);
    #endif 

    arm.write(pos);  

    #ifdef DETACH_AFTER_MOVEMENT
        delay(MOVEMENT_MAX_TIME);
        arm.detach();
    #endif
}

void serialEvent() {
    while (SERIAL.available()) {
        char inChar = (char) SERIAL.read();
        
        // Buffer size exceeded
        if (strlen(inputBuffer) > 99) {
            inputBuffer[0] = '\0';
            return;
        }

        if (inChar == '\n' || inChar == '\r') {
            sscanf(inputBuffer, "%d", &serialParam);

            if (serialParam >= 0 && serialParam <= 180) {
                moveArm(serialParam);
            }

            serialParam = -1;
            inputBuffer[0] = '\0';
            return;
        }

        int len = strlen(inputBuffer);
        inputBuffer[len] = inChar; 
        inputBuffer[len+1] = '\0';
    }
}