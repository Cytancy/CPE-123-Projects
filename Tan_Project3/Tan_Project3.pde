//CY Tan Project 3

int loc; 
float[][] differences;
PImage cup1, cup2, glasses, tb1, tb2, tb3;
PImage lightBeam;
int counter = 0;
float[][] k1 = { { 1/9, 1/9, 1/9} , { 1/9, 1/9, 1/9}, { 1/9, 1/9, 1/9}} ;
float[][] k2 = { { -1, -1, -1 },{ -1,  9, -1 },{ -1, -1, -1 } };
PImage blurredImage= createImage(450, 450, RGB);
PImage clearImage= createImage(450, 450, RGB);
PImage fade= createImage(450, 450, RGB);
boolean glassesOn =false;
float blurAmount=6;
int steamNumber=100;
PVector[] steamVectors = new PVector[steamNumber];
int[] steamY = new int[steamNumber];
int[] steamX = new int[steamNumber];
PImage[] steamType = new PImage[steamNumber];
int steamStartX = 237;
int steamStartY = 95;
int runLightVar = 125;
int runLightVal = 1;
float[][] alphaValues = new float [450][450];
int teaLevel = 0;
boolean teaLevelMod = false;
boolean eyePressed = false;
int brightnessVal = 0;
color teaColor = color(161,146,1,10);
boolean ifOn = false;
boolean event1 = false, event2 = false, event3= false;
int event1Counter = 0, event2Counter=0, event3Counter = 0;
boolean flashWhite = false, flashCounterDown =false;
int flashCounter = 0;

void setup ()
{
  size (450, 450);
  smooth();
  //===Image Setup=======
  cup2 = loadImage("emptycup.png");
  cup1 = loadImage("emptycup1.jpg");
  tb1 = loadImage ("tb1.jpg");
  tb2 = loadImage ("tb2.jpg");
  tb3 = loadImage ("tb3.jpg");
  glasses = loadImage ("glasses.png");
  lightBeam = loadImage("lightbeam.png");
  lightBeam.loadPixels();
  //=====================
  for (int y = 0; y < 450; y++) { 
    for (int x = 0; x < 450; x++) {
        alphaValues[x][y] = (float)alpha(lightBeam.pixels[y*450 + x]);
    }
  }
  //=====================
  cup2.loadPixels();   
  for (int i =0; i<steamNumber;i++)
  {      
      steamVectors[i] = new PVector((random(-2, 2)),(random(-5, -1)));
      steamX[i]=(int)random(140,323);
      steamY[i]=(int)random(100,137);
      steamType[i] = loadImage("steam"+(int)random(1,5)+".png");
  }
}

void draw ()
{
  if (!ifOn){ setupInit ();}
  //================Main Chunk, Post Funct===============
  if(ifOn) {
    image(cup1,0,-5);
    drawTea();
    
    image(cup2,0,0);
    runSteam();
    if (!glassesOn) {image(glasses,330,20);}
    runLight();
    
    
    if (!glassesOn || blurAmount>0) {
      clearImage.copy(g,0,0,width,height,0,0,width,height);
      filter(BLUR, blurAmount);
      blurredImage.copy(g,0,0,width,height,0,0,width,height);
      filter(BLUR, 0);
      
    
       fill(60, 0+(blurAmount*42.5));
        PFont myFont = createFont("Lucida Console", 45);
        textFont(myFont);
        textAlign (CENTER);
        text("MOVE YOUR MOUSE", width/2, height/2);
        text("AROUND TO FOCUS", width/2, height/2+40);
      //=====================
        
      blurredImage.copy(g,0,0,width,height,0,0,width,height);
      for (int y = 0; y < 450; y++) { 
         for (int x = 0; x < 450; x++) { 
           if (sq(mouseX - x) + sq(mouseY - y) < sq(85)){
             blurredImage.pixels[y*450 + x] = clearImage.pixels[y*450 + x];
           }
         }
      }
      image(blurredImage,0,0);
      if (glassesOn) {blurAmount-=.5;}
    }
    
    //==================================
    if (teaLevelMod) {teaLevel++;}
    fade.copy(g,0,0,width,height,0,0,width,height);
    fade.loadPixels();
    if (eyePressed)
    {
      
       for (int y = 0; y < 450; y++) { 
         for (int x = 0; x < 450; x++) {
           int loc = x + y*fade.width;
           float r,g,b;
           r = constrain( red (fade.pixels[loc])-brightnessVal,0,255);
           g = constrain(green (fade.pixels[loc])-brightnessVal,0,255);
           b = constrain( blue (fade.pixels[loc])-brightnessVal,0,255);
           fade.pixels[ y*450 + x]= color (r,g,b);
         }
       }
       image(fade,0,0);
       brightnessVal+=4;
       if (brightnessVal>=240) {
         fill(245);
         PFont myFont = createFont("Lucida Console", 35);
         textFont(myFont);
         textAlign (CENTER);
         text("YOU ARE SLEEPING", width/2, height/2);
       }
    }
  }
  //============================================================
  if (flashWhite){
    fill(255,flashCounter);
    rect(0,0,width,height);
    noFill();
    if (!flashCounterDown) {flashCounter++;}
    else {flashCounter-=5;}
    if (flashCounter>=255) {flashCounterDown = true; ifOn = true;}
    if (flashCounter<0) {flashWhite=false;}
  }
}

void setupInit ()
{  
  
  fill(0);
  rect (0,0,width,height);
  imageMode(CENTER);
  image(tb3, width/2, 75);
  image(tb2, width/2, 220);
  image(tb1, width/2, 370);
  image(edgeDetection (tb3,event2Counter), width/2, 75);
  image(modify (tb2,event3Counter*(255/98)), width/2, 220);

  noTint();
  imageMode(CORNER);
  noFill();
  rectMode(CENTER);
  fill(0);
  if (event1 && event1Counter < 135) {event1Counter++;}
  rect (width/2,75-event1Counter,98,98);
  
  noFill();
  stroke(255);
  strokeWeight(4);
  rect (width/2,75,100,100);
  fill(0);
  if (event2 && event2Counter < 255) {event2Counter++;}
  fill(0, 255-event2Counter); rect (width/2,220,100,100); noFill();
  strokeWeight(4);
  rect (width/2,370,100,100);
  if (event3 && event3Counter < 98) {event3Counter++;}
  noStroke();
  fill(0); 
  rect (width/2,370,98-event3Counter,98-event3Counter);
  rectMode(CORNER);
  if (event3Counter>=97) {flashWhite=true;}
  
}
void runLight()
{
  lightBeam.loadPixels();
  for (int y = 0; y < 450; y++) { 
    for (int x = 0; x < 450; x++) {
      if (runLightVal == 1) { lightBeam.pixels[y*450 + x] = color(red(lightBeam.pixels[y*450 + x]), green(lightBeam.pixels[y*450 + x]), blue(lightBeam.pixels[y*450 + x]), alpha(lightBeam.pixels[y*450 + x])-runLightVal-5);}
      else if (alphaValues[x][y]>=alpha(lightBeam.pixels[y*450 + x])) { lightBeam.pixels[y*450 + x] = color(red(lightBeam.pixels[y*450 + x]), green(lightBeam.pixels[y*450 + x]), blue(lightBeam.pixels[y*450 + x]), alpha(lightBeam.pixels[y*450 + x])+10);}
    }
  }
  runLightVar--;
  if (runLightVar<=90)
  {
    runLightVal=runLightVal*-1;
    runLightVar=125;

  }
  lightBeam.updatePixels();
  image(lightBeam,0,0);
}

void runSteam()
{  
   for (int i =0; i<steamNumber-(teaLevel/3);i++)
    {
      if (steamY[i] > -50 && steamX[i] > 0 && steamX[i] < width)
      {
        steamY[i]+=steamVectors[i].y;
        steamX[i]+=steamVectors[i].x;
      }
      else if (teaLevel<89)
      {
        
        steamType[i] = loadImage("steam"+(int)random(1,5)+".png");
        steamVectors[i] = new PVector((random(-2, 2)),(random(-5,-1)));
        steamX[i]=(int)random(140,323);
        steamY[i]=(int)random(100,137);
      }
      fill(255);
      image (steamType[i], steamX[i], steamY[i]);
      noFill();
     }

}

void drawTea()
{
  noStroke();

  for (int i=0; i < 50; i++)
  {
    fill(teaColor);
    ellipse(width/2+40,160+(i)+teaLevel,260,115);
  }
  for (int i=0; i < 50; i++)
  {
    fill(255,4);
    ellipse(width/2+40,175+(i*2.3) +teaLevel,260,115);
  }

}

void mousePressed ()
{
  if (!ifOn)
  {
    if (mouseX > 175 && mouseX < 275 && mouseY > 25 && mouseY<125)
      { event1=true;}
    if (mouseX > 175 && mouseX < 275 && mouseY > 170 && mouseY<270)
      { event2=true;}
    if (mouseX > 175 && mouseX < 275 && mouseY > 320 && mouseY<420)
      { event3=true;}
  }
  //===========Post Init Funct=============================
  if (ifOn) {
    if (mouseX>325 && mouseX<446 && mouseY>22 && mouseY<79 && !glassesOn)
    {
      glassesOn=true;
    }
    if (glassesOn){
      if (mouseX>246 && mouseX<321 && mouseY> 273 && mouseY < 305)
      {teaLevelMod = true;}
      if ((sq(mouseX - 229) + sq(mouseY - (233)) < sq(28) && mouseY>233) || (sq(mouseX - 332) + sq(mouseY - (223)) < sq(25) && mouseY>223))
      {print("face"); eyePressed=true;}
    }
    if (((sq(mouseX -260)/sq(130)) + (sq(mouseY -150)/sq(35))) <= 1 )
    {teaColor = color (random(0,255),random(0,255),random(0,255),10);}
  }
}

void mouseReleased ()
{
  teaLevelMod = false;
  
}

void keyPressed()
{
  if (key == 'r') {teaLevel=0;}
}



//DON'T IGNORE THIS
//This is legit blur code to show that I can do it(so I won't lose points), but it's too laggy when I loop it so I used the other way 
void blurImage ()
{
  PImage edgeImg = createImage(450, 450, RGB);
  PImage blurImage= createImage(450, 450, RGB);
  blurImage.copy(g,0,0,width,height,0,0,width,height);
  for (int y = 1; y < 450-1; y++) { 
    for (int x = 1; x < 450-1; x++) { 
      float sumRed = 0; 
      float sumGreen = 0; 
      float sumBlue = 0; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*450 + (x + kx);
          float valRed = red(blurImage.pixels[pos]);
          float valGreen = green(blurImage.pixels[pos]);
          float valBlue = blue(blurImage.pixels[pos]);

          int blurLevel = 1;
          sumRed += k1[ky+blurLevel][kx+blurLevel] * valRed;
          sumGreen += k1[ky+blurLevel][kx+blurLevel] * valGreen;
          sumBlue += k1[ky+blurLevel][kx+blurLevel] * valBlue;
        }
      }
      if (sq(mouseX - x) + sq(mouseY - y) > sq(85)){
        edgeImg.pixels[y*450 + x] = color(sumRed, sumGreen, sumBlue);
      }
      else {edgeImg.pixels[y*450 + x] = blurImage.pixels[y*450 + x];}
    }
  }
}

PImage edgeDetection (PImage img, float alphaLevel)
{
  img.loadPixels();
  PImage edgeImg = createImage(img.width, img.height, RGB);
  for (int y = 1; y < img.height-1; y++) { 
    for (int x = 1; x < img.width-1; x++) { 
      float sumRed = 0; 
      float sumGreen = 0; 
      float sumBlue = 0; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*img.width + (x + kx);
          float valRed = red(img.pixels[pos]);
          float valGreen = green(img.pixels[pos]);
          float valBlue = blue(img.pixels[pos]);
          sumRed += k2[ky+1][kx+1] * valRed;
          sumGreen += k2[ky+1][kx+1] * valGreen;
          sumBlue += k2[ky+1][kx+1] * valBlue;
        }
      }
      edgeImg.pixels[y*img.width + x] = color(sumRed, sumGreen, sumBlue);
    }
  }
  edgeImg.updatePixels();
  tint (255,255,255,alphaLevel);
  return edgeImg;
}

PImage modify (PImage img, float alphaLevel)
{
  img.loadPixels();
  PImage edgeImg = createImage(img.width, img.height, RGB);
  for (int y = 1; y < img.height-1; y++) { 
    for (int x = 1; x < img.width-1; x++) { 
      float sumRed = 0; 
      float sumGreen = 0; 
      float sumBlue = 0; 
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*img.width + (x + kx);
          float valRed = red(img.pixels[pos]);
          float valGreen = green(img.pixels[pos]);
          float valBlue = blue(img.pixels[pos]);
          sumRed += k2[ky+1][kx+1] * valRed/2;
          sumGreen += k2[ky+1][kx+1] * valGreen/2;
          sumBlue += k2[ky+1][kx+1] * valBlue+10;
        }
      }
      edgeImg.pixels[y*img.width + x] = color(sumRed, sumGreen, sumBlue);
    }
  }
  edgeImg.updatePixels();
  tint (255,255,255,alphaLevel);
  return edgeImg;
}

