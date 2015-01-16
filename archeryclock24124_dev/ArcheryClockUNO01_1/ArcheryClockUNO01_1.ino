
//Copyright (C) 2010-2014  Henk Jegers
//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.

//for questions email to info@archeryclock.com  

// version UNO01   Initial version
// version UNO01_1 Adding robustness for receiving ABCD detailes which is implemented in AC 232. But not used in UNO01_1 


String inputString;
int serialvalue;
int trafficvalue; //received data for traffic lights, and ABCD lights
int leftcountvalue; //received data for left countdown.
int rightcountvalue; //received data for rightcountdown.
int buttonvalue;
int remember1;
int loop1;

int lefseg; //value of left segment   (0..10  (10 means dashes))
int midseg; //value of middle segment (0..10  (10 means dashes))
int rigseg; //value of light segment  (0..10  (10 means dashes))

int segment[11]={0x03f,0x006,0x05b,0x04f,0x066,0x06d,0x07d,0x007,0x07f,0x06f,0x040};

void setup() {
  
  DDRC = B00000000;               // Pins A0 to A5 are inputs
  buttonvalue=0;
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  
  remember1=0;
  loop1=0;
  rightcountvalue=0xAAA0;
  leftcountvalue=0xAAA0;
  Serial.begin(9600);
  Serial.println("Arduino Serial Link");
  Serial.println("connected!") ;
  

}

void loop() {
  inputString = "";               // Clear inputString
  if(Serial.available()){
    while ((Serial.available())) {
      char digit = Serial.read();   // Read serial buffer
      if(digit != '\n'){inputString += digit;};         // Add new character to the string inputString
      delay(2);                     // Let the serial buffer catch its breath.
      serialvalue = inputString.toInt();
    };
   
//16 bits data received. 
//first bit is telling if the data is about traffic lights and ABCD lights (true). or about the digits of the countdown (false). 
//second bit is telling:
//    -in case of digits (first bit is 0)if the digits are from the right side countdown (true) or left side countdown (false).
//    -in case of trafic/ABCD lights: not implemented jet. Proposal is to use this for ABCD light depending on sequence (For example CDAB is also possible to show)
    
  
    if((serialvalue&0x01) && not(serialvalue&0x06)){ trafficvalue=serialvalue;};     //traficlights
    if ((not(serialvalue&0x01)) && ((serialvalue&0x02)or (serialvalue&0x04))){rightcountvalue=serialvalue;};     //determine the digits value of the rightside
    if ((not(serialvalue&0x01)) && ((not(serialvalue&0x02))or (serialvalue&0x04))){leftcountvalue=serialvalue;}; //determine the digits value of the leftside
  };

//Trafic lights and ABCD lights switching (independent to left/right switch connected to A5) 
//Traficvalue bit 3 -14 show buzzer, green right side, orange right side, red right side, green left side, orange left side, red left side, A, B, C and D.
  digitalWrite(2,  (trafficvalue&0x0008)?HIGH:LOW);        //buzzer
  digitalWrite(3,  (trafficvalue&0x0010)?HIGH:LOW);        //green right side
  digitalWrite(4,  (trafficvalue&0x0020)?HIGH:LOW);        //orange right side
  digitalWrite(5,  (trafficvalue&0x0040)?HIGH:LOW);        //red right side
  digitalWrite(10,  (trafficvalue&0x0080)?HIGH:LOW);        //green left side
  digitalWrite(11,  (trafficvalue&0x0100)?HIGH:LOW);        //orange left side
  digitalWrite(12,  (trafficvalue&0x0200)?HIGH:LOW);        //red left side
  digitalWrite(9,  (trafficvalue&0x0400)?HIGH:LOW);        //A
  digitalWrite(8,  (trafficvalue&0x0800)?HIGH:LOW);        //B
  digitalWrite(7,  (trafficvalue&0x1000)?HIGH:LOW);        //C
  digitalWrite(6,  (trafficvalue&0x2000)?HIGH:LOW);        //D
  
  
 // if (digitalRead(A4)){ //buzzer yes/no switch
 //    digitalWrite(X,  (trafficvalue&0x0008)?HIGH:LOW);        //buzzer
 // }else{
 //    digitalWrite(X, LOW);                                    //if switch on A4 is off, buzzer must be always off
 // } ;
  
  //last 2 bits of trafic value show the number of archers. In this way we can determine notA, notB, notC and notD
 // digitalWrite(X,   (((((trafficvalue>>14)&B00000011)<1)?LOW:HIGH) and (not(trafficvalue&0x0400)?HIGH:LOW)));  //notA. Is on if Archer A exist but it is not his/her turn to shoot
 // digitalWrite(X,   (((((trafficvalue>>14)&B00000011)<1)?LOW:HIGH) and (not(trafficvalue&0x0800)?HIGH:LOW)));  //notB. Is on if Archer B exist but it is not his/her turn to shoot
 // digitalWrite(X,   (((((trafficvalue>>14)&B00000011)<2)?LOW:HIGH) and (not(trafficvalue&0x1000)?HIGH:LOW)));  //notC. Is on if Archer C exist but it is not his/her turn to shoot
 // digitalWrite(X,   (((((trafficvalue>>14)&B00000011)<3)?LOW:HIGH) and (not(trafficvalue&0x2000)?HIGH:LOW)));  //notD. Is on if Archer D exist but it is not his/her turn to shoot

   
//outputs depending on switch (A5 input) if right side or leftside is used

  if (digitalRead(A5)){  //right side
    //Trafic lights:
 //   digitalWrite(X,  (trafficvalue&0x0010)?HIGH:LOW);        //green right side
 //   digitalWrite(X,  (trafficvalue&0x0020)?HIGH:LOW);        //orange right side
 //   digitalWrite(X,  (trafficvalue&0x0040)?HIGH:LOW);        //red right side
    //digits
 //   digitalWrite(X,  (rightcountvalue&0x0008)?HIGH:LOW);      //dots to indicate minutes or seconds indication
    lefseg=((rightcountvalue>>4)&B00001111);  
    midseg=((rightcountvalue>>8)&B00001111);
    rigseg=((rightcountvalue>>12)&B00001111);
  }
  else  //left side
  {
    //Trafic lights:
 //   digitalWrite(X,  (trafficvalue&0x0080)?HIGH:LOW);        //green left side
 //   digitalWrite(X,  (trafficvalue&0x0100)?HIGH:LOW);        //orange left side
 //   digitalWrite(X,  (trafficvalue&0x0200)?HIGH:LOW);        //red left side
    //digits
 //   digitalWrite(X,  (leftcountvalue&0x0008)?HIGH:LOW);      //dots to indicate minutes or seconds indication
    lefseg=((leftcountvalue>>4)&B00001111);
    midseg=((leftcountvalue>>8)&B00001111);
    rigseg=((leftcountvalue>>12)&B00001111);
  };

//  digitalWrite(X, ((segment[rigseg]&0x001))?HIGH:LOW); //left digit segment A
//  digitalWrite(X, ((segment[rigseg]&0x002))?HIGH:LOW); //left digit segment B
//  digitalWrite(X, ((segment[rigseg]&0x004))?HIGH:LOW); //left digit segment C
//  digitalWrite(X, ((segment[rigseg]&0x008))?HIGH:LOW); //left digit segment D
//  digitalWrite(X, ((segment[rigseg]&0x010))?HIGH:LOW); //left digit segment E
//  digitalWrite(X, ((segment[rigseg]&0x020))?HIGH:LOW); //left digit segment F
//  digitalWrite(X, ((segment[rigseg]&0x040))?HIGH:LOW); //left digit segment G

//  digitalWrite(X, ((segment[midseg]&0x001))?HIGH:LOW); //middle digit segment A
//  digitalWrite(X, ((segment[midseg]&0x002))?HIGH:LOW); //middle digit segment B
//  digitalWrite(X, ((segment[midseg]&0x004))?HIGH:LOW); //middle digit segment C
//  digitalWrite(X, ((segment[midseg]&0x008))?HIGH:LOW); //middle digit segment D
//  digitalWrite(X, ((segment[midseg]&0x010))?HIGH:LOW); //middle digit segment E
//  digitalWrite(X, ((segment[midseg]&0x020))?HIGH:LOW); //middle digit segment F
//  digitalWrite(X, ((segment[midseg]&0x040))?HIGH:LOW); //middle digit segment G
    
//  digitalWrite(X, ((segment[lefseg]&0x001))?HIGH:LOW); //right digit segment A
//  digitalWrite(X, ((segment[lefseg]&0x002))?HIGH:LOW); //right digit segment B
//  digitalWrite(X, ((segment[lefseg]&0x004))?HIGH:LOW); //right digit segment C
//  digitalWrite(X, ((segment[lefseg]&0x008))?HIGH:LOW); //right digit segment D
//  digitalWrite(X, ((segment[lefseg]&0x010))?HIGH:LOW); //right digit segment E
//  digitalWrite(X, ((segment[lefseg]&0x020))?HIGH:LOW); //right digit segment F
//  digitalWrite(X, ((segment[lefseg]&0x040))?HIGH:LOW); //right digit segment G
    
//Read buttons
  buttonvalue=0;
  if (digitalRead(A4)){buttonvalue=5;};
  if (digitalRead(A3)){buttonvalue=4;};
  if (digitalRead(A0)){buttonvalue=1;};  //next
  if (digitalRead(A1)){buttonvalue=2;};  
  if (digitalRead(A2)){buttonvalue=3;};
  if (loop1==0){
    if (buttonvalue!=remember1){
      Serial.print(buttonvalue);
      delay(3);
      remember1=buttonvalue;
      loop1=15;
    };
  }
  else
  {delay(10);
    loop1--;
  };
   
}
  
