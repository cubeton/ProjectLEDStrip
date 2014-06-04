#include <Adafruit_NeoPixel.h>

// Parameter 1 = number of pixels in strip
// Parameter 2 = pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_RGB     Pixels are wired for RGB bitstream
//   NEO_GRB     Pixels are wired for GRB bitstream
//   NEO_KHZ400  400 KHz bitstream (e.g. FLORA pixels)
//   NEO_KHZ800  800 KHz bitstream (e.g. High Density LED strip)
Adafruit_NeoPixel strip = Adafruit_NeoPixel(300, 7, NEO_GRB + NEO_KHZ800);
 
void setup() {
  strip.begin();
  Serial.begin(9600);
  strip.show(); // Initialize all pixels to 'off'
}

void loop() {

 int iRandom = rand()%11;
  if (iRandom == 0) {
    hollywood(6, strip.Color(255, 0, 0), strip.Color(255, 255, 255), strip.Color(0, 0, 255));
      }
  else if (iRandom == 1) {
    hollywood(5, strip.Color(255, 200, 0), strip.Color(255, 200, 0), strip.Color(255, 200, 0));
  }
  else if (iRandom == 2) {
    oneRainbow();
  }
  else if (iRandom == 3) {
     hal9000();
  }
  else if (iRandom == 4) {
     rainbow(10);
  }
   else if (iRandom == 5) {
     confettiOne(30);
  }
   else if (iRandom == 6) {
     rainbowCycle(2);
  }
   else if (iRandom == 7) {
     puddle();
  }
   else if(iRandom == 8) {
     confettiTwo(50);
   }
   else if(iRandom == 9) {
    confettiThree(50);
   }
   else if(iRandom == 10) {
     waveOne(25);
   }
   else if(iRandom == 11) {
     waveTwo(25);
   }

hollywood(6, strip.Color(255, 0, 0), strip.Color(255, 255, 255), strip.Color(0, 0, 255));
hollywood(5, strip.Color(255, 200, 0), strip.Color(255, 200, 0), strip.Color(255, 200, 0));
oneRainbow();
hal9000();
rainbow(10);
confettiOne(30);
rainbowCycle(2);
puddle();
confettiTwo(50);
confettiThree(50);
waveOne(25);
waveTwo(25);
colorWipe(strip.Color(255, 0, 0), 3); // Red
colorWipe(strip.Color(0, 255, 0), 3); // Green
colorWipe(strip.Color(0, 0, 255), 3); // Blue

}
void allOff() {
  for(int j=0; j<strip.numPixels(); j++) {
    strip.setPixelColor(j, strip.Color(0, 0, 0)); 
  }
}

void allOffShow() {
  allOff();
  strip.show();
}

//////////////////////////////////////////////////////////////////////////
void hal9000() {
  for(int k=0; k<2; k++) {
    for(int i = 10; i < 256; i ++) { 
      for(int j=0; j<strip.numPixels(); j++) {
        strip.setPixelColor(j, strip.Color(i, 0, i/2)); 
      }
      strip.show();
      delay(1);
    } 
    for(int i = 255; i >= 10; i --) { 
      for(int j=0; j<strip.numPixels(); j++) {
        strip.setPixelColor(j, strip.Color(i, 0, i/2)); 
      }      
      strip.show();
      delay(1);
    }
  }
  allOff();
}

//////////////////////////////////////////////////////////////////////////
void roulette() {
  allOff();
  for(uint16_t i = 0; i < strip.numPixels(); i++) {
    if (i > 0) {
      strip.setPixelColor(i-1, strip.Color(0, 0, 0)); 
    }
    strip.setPixelColor(i, strip.Color(255, 0, 0));
    strip.show();
    delay(10);
  } 
  strip.setPixelColor(strip.numPixels()-1, strip.Color(0,0,0));
}

//////////////////////////////////////////////////////////////////////////
void confettiOne(uint8_t wait) {
 allOff();

 for(uint16_t j = 0; j < 70; j++ ) {  
   for(uint16_t i = 0; i < strip.numPixels(); i++) {
   
   uint8_t color1 = rand()%255;
   uint8_t color2 = rand()%255;
   uint8_t color3 = rand()%255;
   
  switch(rand()%3) {   
  case 0:
  color1 = 0;
  break;
  
  case 1:
  color2 = 0;
  break;
  
  case 2:
  color3 = 0;
  break;
  }
  
 if(rand()%7 == 0){
   color1 = color2 = color3 = 0;
  }
 strip.setPixelColor(i, strip.Color(color1, color2, color3)); 
 }

 strip.show();
 delay(wait);

 }
}

//////////////////////////////////////////////////////////////////////////

void confettiTwo(uint8_t wait) {
 allOff();

 for(uint16_t j = 0; j < 70; j++ ) {  
   for(uint16_t i = 0; i < strip.numPixels(); i++) {
   
   uint8_t color1 = rand()%100;
   uint8_t color2 = rand()%100;
   uint8_t color3 = rand()%100;
   
  switch(rand()%3) {   
  case 0:
  color1 = 0;
  break;
  
  case 1:
  color2 = 0;
  break;
  
  case 2:
  color3 = 0;
  break;
  }
   strip.setPixelColor(i, strip.Color(color1, color2, color3)); 
   }
 strip.show();
 delay(wait);

 }
 }

//////////////////////////////////////////////////////////////////////////
void confettiThree(uint8_t wait) {
 allOff();

    for(uint16_t i=0; i<strip.numPixels(); i++) {
      confettiThreeHelper(i);
     }    

     for(uint16_t j = 0; j <100; j++ ) {  //going to the left
       for(uint16_t i = 0; i < strip.numPixels(); i++) {
         int r = (int)(getRed(i+1));
         int g = (int)(getGreen(i+1));
         int b = (int)(getBlue(i+1));
         
         strip.setPixelColor(i, strip.Color(r, g, b));
       }
       confettiThreeHelper(strip.numPixels()-1);
        strip.show();
       delay(wait);
     } 
     

     for(uint16_t j = 0; j <100; j++ ) {       //going to the right
       for(uint16_t i = strip.numPixels(); i > 0; i--) {
         int r = (int)(getRed(i-1));
         int g = (int)(getGreen(i-1));
         int b = (int)(getBlue(i-1));
         
         strip.setPixelColor(i, strip.Color(r, g, b));
       }
    confettiThreeHelper(0);
    strip.show();
    delay(wait);  
   }
 }
  
 void confettiThreeHelper(int index) { 
  uint8_t color1 = rand()%50;
  uint8_t color2 = rand()%50;
  uint8_t color3 = rand()%50;
  
  switch(rand()%4) {   
  case 0:
  color1 = 0;
  break;
  
  case 1:
  color2 = 0;
  break;
  
  case 2:
  color3 = 0;
  break;

  }
  strip.setPixelColor(index, strip.Color(color1, color2, color3)); 
 }
 
//////////////////////////////////////////////////////////////////////////
void waveOne(uint8_t wait) {
 allOff();
 /// part one, setting up the program
  uint8_t color1 = rand()%50;
  uint8_t color2 = rand()%50;
  uint8_t color3 = rand()%50;
    switch(rand()%3) {   
    case 0:
      color1 = 0;
      break;
    case 1:
      color2 = 0;
      break;
    case 2:
      color3 = 0;
      break;
    }

    for(uint16_t i=0; i<strip.numPixels(); i++) {
      strip.setPixelColor(i, strip.Color(color1, color2, color3));
     }    
     
    strip.show();
    delay(wait);
    
    //// part two
    waveOneHelper(color1, color2, color3, wait);
    
    for(uint16_t j = 0; j <250; j++ ) {  
      for(uint16_t i = strip.numPixels(); i > 0; i--) {
      
       int r = (int)(getRed(i-1));
       int g = (int)(getGreen(i-1));
       int b = (int)(getBlue(i-1));
       
        strip.setPixelColor(i, strip.Color(r, g, b));
      }
  
    if(rand()%20 == 1) {
       waveOneHelper(color1, color2, color3, wait);
       }
    
    
    strip.show();
    delay(wait); 
   }
}

void waveOneHelper(uint8_t color1, uint8_t color2, uint8_t color3, uint8_t wait) {
  int color1_rand = rand()%255-100;
  int color2_rand = rand()%255-100;
  int color3_rand = rand()%255-100;  
  
  while( (abs(color1_rand - color1) < 50) && (abs(color2_rand - color2) < 50) && (abs(color3_rand - color3) < 50))  {
    color1_rand = rand()%255-100;
    color2_rand = rand()%255-100;
    color3_rand = rand()%255-100;
  }
  
      switch(rand()%3) {   
    case 0:
      color1_rand = 0;
      break;
    case 1:
      color2_rand = 0;
      break;
    case 2:
      color3_rand = 0;
      break;
    }
    
   strip.setPixelColor(0, strip.Color(color1_rand, color2_rand, color3_rand));
   strip.show();
   delay(wait);
    
   for(uint16_t j = 1; j < 25; j++) {
     strip.setPixelColor(j, strip.Color(color1_rand, color2_rand, color3_rand));
     for(uint16_t i = j; i > 0; i--) {
      
        int r = (int)(getRed(i)*1.5 + (color1))/2;
        int g = (int)(getGreen(i)*1.5 + (color2))/2;
        int b = (int)(getBlue(i)*1.5 + (color3))/2;
       
        strip.setPixelColor(i-1, strip.Color(r, g, b));
   }
   for(uint16_t f = strip.numPixels(); f > j; f--) {
       int r = (int)(getRed(f-1));
       int g = (int)(getGreen(f-1));
       int b = (int)(getBlue(f-1));
       
        strip.setPixelColor(f, strip.Color(r, g, b));
   }
   
    strip.show();
    delay(wait);  
   }
  strip.setPixelColor(0, strip.Color(color1, color2, color3));   
}



//////////////////////////////////////////////////////////////////////////
void waveTwo(uint8_t wait) {
 allOff();

  uint8_t color1 = rand()%50;
  uint8_t color2 = rand()%50;
  uint8_t color3 = rand()%50;
    switch(rand()%3) {   
    case 0:
      color1 = 0;
      break;
    case 1:
      color2 = 0;
      break;
    case 2:
      color3 = 0;
      break;
    }
    for(uint16_t i=0; i<strip.numPixels(); i++) {
      strip.setPixelColor(i, strip.Color(color1, color2, color3));
     }    
     
     strip.show();
     delay(wait);
     
  int color1_rand = rand()%250;
  int color2_rand = rand()%250;
  int color3_rand = rand()%250;
  
  strip.setPixelColor(0, strip.Color(color1_rand, color2_rand, color3_rand));

  
     for(uint16_t j = 0; j <strip.numPixels(); j++ ) {
       strip.setPixelColor(j, strip.Color(color1_rand, color2_rand, color3_rand));
       for(uint16_t i = 0; i < j; i++) {
         int r = (int)(getRed(i+1) + (color1)/2.0);
         int g = (int)(getGreen(i+1) + (color2)/2.0);
         int b = (int)(getBlue(i+1) + (color3)/2.0);
         strip.setPixelColor(i, strip.Color(r, g, b));
       }
    strip.show();
    delay(wait);  
   }
 }
  
//////////////////////////////////////////////////////////////////////////
void puddle() {
 for(uint16_t i=0; i<strip.numPixels(); i++) {
   if(rand()%20 == 0){
     puddleHelper(i);
   } else {
     strip.setPixelColor(i, strip.Color(0, 0, 0));
   }
 }
 strip.show();
 delay(10);
 
 for(int j = 0; j < 300; j++) {
   if(rand() % 2 == 0) {
       puddleHelper(rand() % strip.numPixels());
   }
   for(int i = 1; i < strip.numPixels()-1; i++) {
  
     int avgr = (int)((getRed(i-1) + getRed(i) + getRed(i+1))/3.0);
     int avgg = (int)((getGreen(i-1) + getGreen(i) + getGreen(i+1))/3.0);
     int avgb = (int)((getBlue(i-1) + getBlue(i) + getBlue(i+1))/3.0);
     strip.setPixelColor(i, strip.Color(avgr, avgg, avgb));
   }
   strip.show();
   delay(10);
 }
}

//Sets the current index to a random pixel color.
void puddleHelper(int index) {
  uint8_t color1 = rand()*255;
  uint8_t color2 = rand()*255;
  uint8_t color3 = rand()*255;
  switch(rand()%3) {   
    case 0:
      color1 = 0;
      break;
    case 1:
      color2 = 0;
      break;
    case 2:
      color3 = 0;
      break;
  }
  strip.setPixelColor(index, strip.Color(color1, color2, color3));
}

//////////////////////////////////////////////////////////////////////////
void hollywood(int numrotate, uint32_t color0, uint32_t color1, uint32_t color2) {
  //yellow = strip.Color(255, 200, 0);
  for(int k = 0; k<20; k++) {
    for(int j = 0; j<numrotate; j++) {  
      hollywoodHelper(j, numrotate, k%3, color0, color1, color2);
    }
  }
  for(int k = 0; k<20; k++) {//why does this way not work?!
    for(int j = 0; j<numrotate; j++) {  
      hollywoodHelper(numrotate-j-1, numrotate, (3-(k%3)-1), color0, color1, color2);
    }
  }
}

void hollywoodHelper(int pos, int numrotate, int offset, uint32_t color0, uint32_t color1, uint32_t color2) {
  allOff();
  int count = 0;
  for(uint16_t i = 0; i < strip.numPixels(); i++) {
    if (i%numrotate==pos) {
     if(count == offset)
       strip.setPixelColor(i, color0); 
    if(count == (offset+1)%3)
       strip.setPixelColor(i, color1); 
    if(count == (offset+2)%3)
       strip.setPixelColor(i, color2); 
     count = (count+1) % 3;
    }
   } 
   strip.show();
   delay(50);
}
//////////////////////////////////////////////////////////////////////////
void colorWipe(uint32_t c, uint8_t wait) {
  for(uint16_t i=0; i<strip.numPixels(); i++) {
    strip.setPixelColor(i, c);
    strip.show();
    delay(wait);
  }
}

//////////////////////////////////////////////////////////////////////////
void rainbow(uint8_t wait) {
  uint16_t i, j;

  for(j=0; j<256; j++) {
    for(i=0; i<strip.numPixels(); i++) {
      strip.setPixelColor(i, Wheel((i+j) & 255));
    }
    strip.show();
    delay(wait);
  }
}

//////////////////////////////////////////////////////////////////////////
void rainbowCycle(uint8_t wait) {
  uint16_t i, j;

  for(j=0; j<256; j++) { // 5 cycles of all colors on wheel
    for(i=0; i< strip.numPixels(); i++) {
      strip.setPixelColor(i, Wheel(((i * 256 / strip.numPixels()) + j) & 255));
    }
    strip.show();
    delay(wait);
  }
}
//////////////////////////////////////////////////////////////////////////
void oneRainbow() {
  uint16_t i, j;
  for(int k = 0; k < 3; k++) {
    for(j=0; j<320; j++) { // 5 cycles of all colors on wheel
      for(i=0; i< strip.numPixels(); i++) {
        strip.setPixelColor(i, Wheel(((0 * 320 / strip.numPixels()) + j) & 255));
      }
      strip.show();
      delay(20);
    }
  }
}

uint32_t Wheel(byte WheelPos) {
  if(WheelPos <  85) {
    return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  } 
  if(WheelPos < 170) {
    WheelPos -= 85;
    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  } 
  if(WheelPos < 255) {
    WheelPos -= 170;
    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  else{
    WheelPos -= 255;
    return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  }
}
//////////////////////////////////////////////////////////////////////////

uint8_t getRed(uint16_t pixelindex) {
  return strip.getPixelColor(pixelindex) >> 16;
}

uint8_t getGreen(uint16_t pixelindex) {
  return (strip.getPixelColor(pixelindex) >> 8) & 255;
}

uint8_t getBlue(uint16_t pixelindex) {
  return strip.getPixelColor(pixelindex) & 255;
}
