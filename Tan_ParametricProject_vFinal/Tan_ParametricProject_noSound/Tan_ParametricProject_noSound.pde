//CY Tan

//Parametric Project | Optimization v4.3 w/o Sound


   //shape variables
   float cx, cy;
   int score, bgColor, increment = 1, BGC_available = 0, slide_offset = -265, exitCounter = 0;
   float[] rotateBG_x = new float[30];
   float[] rotateBG_y = new float[30];
   color[] shapeColors = new color[8];
   color shape1Color;
   boolean newShapeNeeded = true;
   boolean enterShape1 = true, shape1Entering, shape1Exiting = false;
   boolean exitShape1 = false;
   String shape1Shape; 
   int shape1Increment, shape1Y;
   color[] shape2Colors = new color[5];
   String[] shape2Shapes = new String[5];
   int[] shapes2Offset = new int[5];
   int correctShape;
   int successRadius = 60;
   //game variables
   boolean successful=false;
   int lives = 3, livesOffset=3,livesOffsetTotal=0;
   int gameOverOffset = -450;
   boolean gameActive = false;
   int gameStartRing = 0;
   int startOffset = 0;
   int combo=0;
   int highestCombo=0;
   int displayedScore = 0;
   boolean lostLife=false;
   int lostLifeCounter;
   float bgVal1=10, bgVal2=1, bgVal3=8;
   float bgVal1Increment=1.1, bgVal2Increment=.1, bgVal3Increment=1;
   color comboColor;
   int comboColorCounter = 0;
   float timer = 10;
   //sound variables
   boolean musicOn=false;
   boolean playSFX=false;
   int macVariable=0;
   
 
   


//=====================================================
void setup() {
  size(450, 450);
  frameRate(60);

  smooth();
  noStroke();
  bgColor=60;
  setuprotateBG ();
  //available shape colors defined in array
  shapeColors[0] = #ff3636;//red
  shapeColors[1] = #fa74f2;//pink
  shapeColors[2] = #a947fc;//purple
  shapeColors[3] = #4754fc;//blue
  shapeColors[4] = #47c7fc;//cyan
  shapeColors[5] = #76fa2e;//green
  shapeColors[6] = #f3fa2e;//yellow
  shapeColors[7] = #fab42e;//orange
  for (int i = 0; i<5; i++)
  {
    shapes2Offset[i]=-300+150*i;
  }  
}
//=====================================================
void draw ()
{
  
  if (gameActive){activate();}
  
  gameStart();
  if (lives<=0) {gameOver();}
}
//=====================================================
void generateParametricBG (float R , float r, float d, int xcoord, int ycoord)
{
  for (float i = 0; i <= 360; i=i+.5)
  {
    float theta = radians(i);
    float ix = (R+r)*cos(theta) - (r+d)*cos(((R+r)/r)*theta);
    float iy = (R+r)*sin(theta) - (r+d)*sin(((R+r)/r)*theta);
    fill(255-bgColor);
    noStroke();
    ellipse(ix+xcoord,iy+ycoord,3,3);
  }
}
//=====================================================  
void reset()
{
  score=0;
  for (int i = 0; i<5; i++)
  {
    shapes2Offset[i]=-300+150*i;
  }
   increment = 1; 
   BGC_available = 0;
   slide_offset = -265; 
   exitCounter = 0;
   newShapeNeeded = true;
   enterShape1 = true;
   shape1Exiting = false;
   exitShape1 = false;
   successRadius = 60;
   //game variables
   successful=false;
   lives = 3; 
   livesOffset=3;
   livesOffsetTotal=0;
   gameOverOffset = -450;
   gameActive = false;
   gameStartRing = 0;
   startOffset = 0;
   combo=0;
   highestCombo=0;
   displayedScore = 0;
   lostLife=false;
   bgVal1=10; 
   bgVal2=1; 
   bgVal3=8;
   bgVal1Increment=1.1; 
   bgVal2Increment=.1;
   bgVal3Increment=1;
   comboColorCounter = 0;
   timer = 10;
   
}
//=====================================================
void gameStart(){
  if (startOffset<=450) {
    fill(10);
    rect(0,0-startOffset,width,height);
    noFill();
    fill(250);
    PFont myFont = createFont("Lucida Console", 16);
    textFont(myFont);
    textAlign (CENTER);
    text("MATCH THE SHAPES TO SUCCEED AT SOCIALIZING", width/2, height/2-180-startOffset);
    text("TRY NOT TO RUN OUT OF TIME OR MOTIVATION", width/2, height/2-150-startOffset);
    text("PRESS 'm' for MACS", width/2, height/2+150-startOffset);
    text("START", width/2, height/2 -startOffset);
    noFill();
    stroke(250);
    ellipse (width/2, height/2 - 5 -startOffset,70,70);
    if (gameStartRing+45 >= 360) {gameStartRing=-45 ;}
    for (float t=gameStartRing ; t<gameStartRing+45; t++) {
      float theta = radians(t);
      theta = radians(t+180);
      if (t%5==0)
      {      
        float cx1 = (70)*sin(theta);
        float cy1 = (70)*cos(theta);
        float cx2 = (100)*sin(theta);
        float cy2 = (100)*cos(theta);
        line(width/2+cx1, height/2 - 5+cy1-startOffset, width/2+cx2, height/2 - 5+cy2-startOffset);
      }
    }
    noStroke();
    gameStartRing++;
    if (gameActive) {startOffset+=5; lives=3; timer = 10; }
    musicOn=true;
  }
}
//=====================================================
void activate ()
{
    float incrementRate=.5;
    bgVal1+=(bgVal1Increment*incrementRate);
    if (bgVal1>=320) {bgVal1Increment=bgVal1Increment*-1;}
    else if (bgVal1<=9.9) {bgVal1Increment=bgVal1Increment*-1;}
    else if (bgVal1>=50) {bgVal2Increment=bgVal2Increment*-1;}
    else if (bgVal2<=.9) {bgVal2Increment=bgVal2Increment*-1;}
    else if (bgVal3>=290) {bgVal1Increment=bgVal3Increment*-1;}
    else if (bgVal3<=7.9) {bgVal1Increment=bgVal3Increment*-1;}
    generateBG ();
    generateParametricBG(bgVal1, bgVal2, bgVal3, width/2,height/2);
    drawSlide(205,220);
    drawShapes2();
    generateFrames();
    if (newShapeNeeded) {
      setShape1Color();
      shape1Shape = setShape1();
      newShapeNeeded = false;
      setupShapes2();
    }
    EnterExit (shape1Shape);
    success();
    generateBar (score); 
    drawLives();
    runTimer();
}
//=====================================================
void runTimer()
{
  color temp = (240);
  if (timer<4) {temp=color(#FA2D2D);}
  fill(temp);
  PFont myFont = createFont("Lucida Console", 18);
  textFont(myFont);
  textAlign (CENTER);
  text(nf(timer,1,2), width-40, 30);
  timer-=.02;
  noFill();
  if (timer<=0 && lives>0) {timer=10; lives--; lostLife =true; lostLifeCounter=20; }
}
//=====================================================
void gameOver()
{
  fill (50);
  rect(0,gameOverOffset,width,height);
  noFill();
  fill (10);
  rect(0,gameOverOffset+425,width,25);
  noFill();
  fill (250);
  rect(0,gameOverOffset+430,width,15);
  noFill();
  fill (250);
  PFont myFont = createFont("Lucida Console", 36);
  textFont(myFont);
  textAlign (CENTER);
  text("OH HEY,", width/2, gameOverOffset+100);
  text("YOU'RE  A LOSER!", width/2, gameOverOffset+150);
  
  myFont = createFont("Lucida Console", 32);
  textFont(myFont);
  text("YOUR SCORE:" + score, width/2, gameOverOffset+250);
  myFont = createFont("Lucida Console", 25);
  textFont(myFont);
  text("HIGHEST COMBO:" + highestCombo, width/2, gameOverOffset+285);
  myFont = createFont("Lucida Console", 22);
  textFont(myFont);
  text("PRESS 'ENTER' TO TRY AGAIN", width/2, gameOverOffset+350);
  text("AT SOCIALIZING", width/2, gameOverOffset+380);
  noFill();
  if (gameOverOffset<=-15) {gameOverOffset+=15; }
}
//=====================================================
void success ()
{
  int secondBoxOffset=220;
  if (successful)
  {
    comboColor = shape1Color;
    comboColorCounter = 10;
     successRadius++;
     for (float theta=0; theta<2*PI; theta= theta+0.45) {
       float cx = successRadius*cos(theta);
       float cy = successRadius*sin(theta);
       fill(255);
       if (shape1Shape=="Square") {drawBGSquare ((int)(116+cx),(int)(218+cy),10,color (shape1Color)); drawBGSquare ((int)(116+secondBoxOffset+cx),(int)(218+cy),10,color (shape1Color));}
       else if (shape1Shape=="Pentagon") {drawBGPentagon ((int)(116+cx),(int)(218+cy),10,color (shape1Color));drawBGPentagon ((int)(116+secondBoxOffset+cx),(int)(218+cy),10,color (shape1Color));}
       else if (shape1Shape=="Star") {drawBGStar ((int)(116+cx),(int)(218+cy),10, 7,color (shape1Color));drawBGStar ((int)(116+secondBoxOffset+cx),(int)(218+cy),10, 7,color (shape1Color));}
       else if (shape1Shape=="Circle") {drawBGCircle ((int)(116+cx),(int)(218+cy),10,color (shape1Color));drawBGCircle ((int)(116+secondBoxOffset+cx),(int)(218+cy),10,color (shape1Color));}
       noFill();}
     if (successRadius==100) {successRadius=60; successful=false;}
  }
}
//=====================================================
void drawLives ()
{
  fill (235);
  PFont myFont = createFont("Lucida Console", 24);
  textFont(myFont);
  textAlign (LEFT);
  text("MOTIVATION", 10, 33);
  noFill();
  for (int i = 0; i < lives; i++)
  {
    pushMatrix();
    scale(.25);
    int yoffset = 100;
    int xoffset = 140;
    if (i==0) {drawSquare(690+macVariable+i*xoffset, yoffset+livesOffsetTotal, 90, color(#ff3636), true);}
    else if (i==1) {drawStar(690+macVariable+i*xoffset, yoffset-10+livesOffsetTotal, 60, 40, color(#4754fc), true);}
    else if (i==2) {drawPentagon(690+macVariable+i*xoffset, yoffset-5+livesOffsetTotal, 55, color(#f3fa2e), true);}
    popMatrix();
  }
  livesOffsetTotal+=livesOffset;
  if (livesOffsetTotal>=12) {livesOffset = -3;}
  else if (livesOffsetTotal<=-12) {livesOffset=3;}
}
//=====================================================
void setupShapes2 ()
{
  correctShape = (int) (random(0,5));
  shape2Colors[correctShape] = shape1Color;
  shape2Shapes[correctShape] = shape1Shape;
  String shapevalue;
  //=====This Segment ensures there will be no duplicate matching shapes====
  for (int i=0; i<5; i++)
  {
    int randomColor = (int) (random (0,8));
    int randomShape = (int) (random (1,5));
    if (randomShape == 1) {shapevalue = "Square";}
    else if (randomShape == 2) {shapevalue = "Circle";}
    else if (randomShape == 3) {shapevalue = "Star";}
    else if (randomShape == 4) {shapevalue = "Pentagon";}
    else {shapevalue = "Square";}
    while (randomColor == shape1Color || shapevalue == shape1Shape) {
      randomColor = (int) (random (0,8));
      randomShape = (int) (random (1,5));
      if (randomShape == 1) {shapevalue = "Square";}
      else if (randomShape == 2) {shapevalue = "Circle";}
      else if (randomShape == 3) {shapevalue = "Star";}
      else if (randomShape == 4) {shapevalue = "Pentagon";}
      else {shapevalue = "Square";}}
    if (i != correctShape){ 
      shape2Colors[i] = shapeColors[randomColor];
      shape2Shapes[i] = shapevalue;}
  } 
}
//=====================================================
void drawShapes2()
{
  int centerX = 335;
  int margins = 150;
  for (int i=0; i<5; i++)
  {
    if(shapes2Offset[i]>=450) {shapes2Offset[i]=-300;}
    shapes2Offset[i]+=5+(score/400);
    if (shape2Shapes[i] == "Square") {drawSquare (centerX,shapes2Offset[i],90, color (shape2Colors[i]), shape1Exiting);}
    else if (shape2Shapes[i] == "Circle") {drawCircle (centerX,shapes2Offset[i],100, color (shape2Colors[i]), shape1Exiting);}
    else if (shape2Shapes[i] == "Star") {drawStar (centerX,shapes2Offset[i],60,40, color (shape2Colors[i]), shape1Exiting);}
    else if (shape2Shapes[i] == "Pentagon") {drawPentagon (centerX,shapes2Offset[i],55, color (shape2Colors[i]), shape1Exiting);} 
  } 
}

//=====================================================
String setShape1()
{
  int shapeValue = (int) (random (1,5));
  if (shapeValue == 1) {return "Square";}
  else if (shapeValue == 2) {return "Circle";}
  else if (shapeValue == 3) {return "Star";}
  else if (shapeValue == 4) {return "Pentagon";}
  else {return "Square";}
}
//=====================================================
void setShape1Color()
{
  shape1Color = shapeColors[(int) (random (0,8))];
}
//=====================================================
void EnterExit (String shape1)
{
  //218
  if (enterShape1){shape1Y=-50; enterShape1=false; shape1Entering=true;}
  if (shape1 == "Square") {drawSquare (117,shape1Y,90, color (shape1Color), shape1Exiting);}
  else if (shape1 == "Star") {drawStar(117,shape1Y,60, 40, color (shape1Color), shape1Exiting);}
  else if (shape1 == "Circle") {drawCircle (117,shape1Y,100, color (shape1Color), shape1Exiting);}
  else if (shape1 == "Pentagon") {drawPentagon (117,shape1Y,55, color (shape1Color), shape1Exiting);}
  if (shape1Entering) {
    shape1Increment=((620-shape1Y)/400);
    shape1Y=shape1Y+shape1Increment*10;}
    if (shape1Y >= 218 && !shape1Exiting) {shape1Y=218; shape1Entering=false;}
  //=========================  
  if (shape1Exiting) {exitCounter++;}
  if (shape1Exiting && exitCounter>=20) {
    shape1Increment=((700-shape1Y)/200);
    shape1Y=shape1Y+shape1Increment*10;;}
    if (shape1Y >= 500 && lives>0 ) {shape1Exiting=false;newShapeNeeded=true; enterShape1=true; exitCounter=0; score=score+100;}
}
//=====================================================

void setuprotateBG ()
{
  int i = 0;
  for (float theta=0; theta<2*PI; theta= theta+0.21) {
    float cx = 180*cos(theta);
    float cy = 180*sin(theta);
    rotateBG_x[i] = 225+cx;
    rotateBG_y[i] = 225+cy;
    i++;
 }
}
//=====================================================
void mousePressed(){
  if (shape1Y == 218 && shapes2Offset[correctShape]>170 && shapes2Offset[correctShape]<320 && lives>0){println ("great success!");shape1Exiting=true; successful=true; combo++; timer+=(2+(1000/(score+100))); }
  else if (gameActive && lives>0)  {lives--; combo=0; lostLife =true; lostLifeCounter=15; }
  if (combo>highestCombo) {highestCombo=combo;}
  
  if (!gameActive)
  {
    if ( sq(mouseX - width/2) + sq(mouseY - (height/2-5)) < sq(35))
    {
      gameActive =true;
      print ("yay!");
    }
  }
}
//=====================================================
void keyPressed()
{
  if (key == 'c' && score<20000) {score+=20000;}
  else if (key == 'c'){score-=20000;}
  if (key == 'm' && !gameActive) {gameActive =true; macVariable=55;}
  if (keyCode == ENTER && lives<=0 ) {reset();}
  

}

//==========================Fixed Values============================

void generateFrames()
{
  rectMode (CENTER);
    fill (20);
  rect (115,224,150,150);
  noFill();
  fill (255-bgColor);
  rect (115,220,150,150);
  noFill();

  fill (255-bgColor/1.5);
  rect (115,220,135,135);
  noFill();
  fill (20);
  rect (265,224,15,150);
  rect (405,224,15,150);
  rect (335,156,150,15);
  rect (335,291,150,15);
  noFill();
  fill (255-bgColor);
  rect (265,220,15,150);
  rect (405,220,15,150);
  rect (335,152,150,15);
  rect (335,287,150,15);
  noFill();

  rectMode (CORNER);
}
void generateBG ()
{
  if (BGC_available==30){BGC_available=0;}
  BGC_available++;
  if (bgColor<60) {increment=1;}
  else if (bgColor>=235) {increment=-1;}
  bgColor = bgColor+increment;
  if (!lostLife)
  {background(bgColor);}
  else {background(#FC9696); lostLifeCounter--;}
  if (lostLifeCounter<=0) {lostLife=false;}
  
  int i_initial = 0;
  if (BGC_available>6) {i_initial = BGC_available-5;}
  for (int i = i_initial; i<BGC_available; i++)
  {
    fill (255-bgColor);
    ellipse (rotateBG_x[i],rotateBG_y[i],25,25);
    noFill();
  }
  //Combo
  PFont myFont = createFont("Lucida Console", 22);
  textFont(myFont);
  textAlign (CENTER);
    fill (25);
  text("COMBO", width/2, 101);
  noFill();
  
  color temp = color(255-bgColor);
  if (comboColorCounter>0) {comboColorCounter--; temp = comboColor;}
  fill (temp);
  text("COMBO", width/2, 100);
  myFont = createFont("Lucida Console", 32);
  textFont(myFont);
  fill (25);
  text(combo, width/2, 131);
  noFill();
  fill (temp);
  text(combo, width/2, 130);
  noFill();  

}
void generateBar (int score)// generates bottom bar while taking in the score
{
  fill (20);
  rect (0, 0, 450, 50);
  rect (0, 390, 450, 300);
  noFill();
  fill (40);
  rect (0, 390, 450, 10);
  noFill();
  fill (235);
  PFont myFont = createFont("Lucida Console", 24);
  textFont(myFont);
  textAlign (LEFT);
  text("HAPPINESS", 10, 430);
  textAlign (RIGHT);
  text(""+displayedScore, 430, 430);
  noFill();
  if (displayedScore<score) {displayedScore+=1.5;}
  else if (displayedScore>score) {displayedScore-=.01;}
}
//==========================Draw Shapes============================

void drawSlide (int x_coord, int y_coord)
{
  rectMode (CENTER);
  fill (255);
  rect(225,220,450,80);
  noFill();
  rectMode (CORNER);
  if (slide_offset>=340) {slide_offset=-265;}
  fill(bgColor);
  beginShape();
  vertex (x_coord+10-slide_offset,y_coord-40);
  vertex (x_coord+30-slide_offset,y_coord-40);
  vertex (x_coord-slide_offset,y_coord);
  vertex (x_coord+30-slide_offset,y_coord+40);
  vertex (x_coord+10-slide_offset,y_coord+40);
  vertex (x_coord-20-slide_offset,y_coord);
  endShape(CLOSE);
  beginShape();
  x_coord=x_coord + 60;
  vertex (x_coord+10-slide_offset,y_coord-40);
  vertex (x_coord+30-slide_offset,y_coord-40);
  vertex (x_coord-slide_offset,y_coord);
  vertex (x_coord+30-slide_offset,y_coord+40);
  vertex (x_coord+10-slide_offset,y_coord+40);
  vertex (x_coord-20-slide_offset,y_coord);
  endShape(CLOSE);
  beginShape();
  x_coord=x_coord + 60;
  vertex (x_coord+10-slide_offset,y_coord-40);
  vertex (x_coord+30-slide_offset,y_coord-40);
  vertex (x_coord-slide_offset,y_coord);
  vertex (x_coord+30-slide_offset,y_coord+40);
  vertex (x_coord+10-slide_offset,y_coord+40);
  vertex (x_coord-20-slide_offset,y_coord);
  endShape(CLOSE);
  noFill();
  slide_offset = slide_offset+10;
}

void drawBGStar (int x_coord, int y_coord, int R, int r, color starcolor)
{
  fill(starcolor);
  beginShape();
    for (float t=0; t<360; t++) {
      float theta = radians(t);
      theta = radians(t+180);
      int checksum = (int)(t/36);
      if (t%36==0){      
        if (is_even(checksum)){
        cx = R*sin(theta);
        cy = R*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
        else{
        cx = r*sin(theta);
        cy = r*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
      }
    }
  endShape(CLOSE);
  noFill();
}

void drawStar (int x_coord, int y_coord, int R, int r, color starcolor, boolean happy) //draws a star of designated color, shape, and size at a given location
{
  y_coord= y_coord +5;
  //shadow
  fill (40);
  pushMatrix();
  translate (0,4);
  beginShape();
    for (float t=0; t<360; t++) {
      float theta = radians(t);
      theta = radians(t+180);
      int checksum = (int)(t/36);
      if (t%36==0)
      {      
        if (is_even(checksum)){
        cx = (R+4)*sin(theta);
        cy = (R+4)*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
        else{
        cx = (r+4)*sin(theta);
        cy = (r+4)*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
      }
    }
  endShape(CLOSE);
  popMatrix();
  noFill();
  //outline
  fill (250);
  beginShape();
    for (float t=0; t<360; t++) {
      float theta = radians(t);
      theta = radians(t+180);
      int checksum = (int)(t/36);
      if (t%36==0)
      {      
        if (is_even(checksum)){
        cx = (R+4)*sin(theta);
        cy = (R+4)*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
        else{
        cx = (r+4)*sin(theta);
        cy = (r+4)*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
      }
    }
  endShape(CLOSE);
  noFill();
  //actual shape
  fill(starcolor);
  beginShape();
    for (float t=0; t<360; t++) {
      float theta = radians(t);
      theta = radians(t+180);
      int checksum = (int)(t/36);
      if (t%36==0){      
        if (is_even(checksum)){
        cx = R*sin(theta);
        cy = R*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
        else{
        cx = r*sin(theta);
        cy = r*cos(theta);
        vertex(x_coord+cx, y_coord+cy);
        }
      }
    }
  endShape(CLOSE);
  noFill();
  //mouth
  stroke(10);
  strokeWeight(2); 
  if (happy)
  {
    curveTightness(-1);
    beginShape();
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord,  y_coord+8);
    curveVertex(x_coord+5, y_coord+5);
    curveVertex(x_coord+5, y_coord+5);
    endShape();
  }
  else
  {
    beginShape();
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord,  y_coord+5);
    curveVertex(x_coord+5, y_coord+8);
    curveVertex(x_coord+5, y_coord+8);
    endShape();
  }
  noStroke();
  //eyes
  fill(10);
  ellipse(x_coord-25, y_coord-5, 12,12);
  ellipse(x_coord+25, y_coord-5, 12,12);
  noFill();
  fill(250);
  ellipse(x_coord-22, y_coord-8, 3,3);
  ellipse(x_coord+28, y_coord-8, 3,3);
  noFill();
}

void drawBGPentagon (int x_coord, int y_coord, int R, color pentaColor)
{
  fill(pentaColor);
  beginShape();
  for (float theta=0; theta<2*PI; theta= theta+PI/2.5) {
  float cx = R*cos(theta-PI/11);
  float cy = R*sin(theta-PI/11);
  vertex(x_coord+cx, y_coord+cy);}
  endShape(CLOSE);
  noFill();

}

void drawPentagon (int x_coord, int y_coord, int R, color pentaColor, boolean happy)
{
  int radialOffset = 18;
  //shadow
   y_coord=y_coord+3;
   fill(40);
   pushMatrix();
   translate(0,4);
   beginShape();
   for (float theta=0; theta<2*PI; theta= theta+PI/2.5) {
     float cx = (R+4)*cos(theta-radians(radialOffset));
     float cy = (R+4)*sin(theta-radians(radialOffset));
     vertex(x_coord+cx, y_coord+cy);
   }
   endShape(CLOSE);
   noFill();
   popMatrix();
  //outline
   fill(250);
   beginShape();
   for (float theta=0; theta<2*PI; theta= theta+PI/2.5) {
     float cx = (R+4)*cos(theta-radians(radialOffset));
     float cy = (R+4)*sin(theta-radians(radialOffset));
     vertex(x_coord+cx, y_coord+cy);
   }
   endShape(CLOSE);
   noFill();
   //actual shape
   fill(pentaColor);
   beginShape();
   for (float theta=0; theta<2*PI; theta= theta+PI/2.5) {
     float cx = R*cos(theta-radians(radialOffset));
     float cy = R*sin(theta-radians(radialOffset));
     vertex(x_coord+cx, y_coord+cy);
   }
  endShape(CLOSE);
  noFill();
  //mouth
  stroke(10);
  strokeWeight(2); 
  if (happy)
  {
    curveTightness(-1);
    beginShape();
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord,  y_coord+8);
    curveVertex(x_coord+5, y_coord+5);
    curveVertex(x_coord+5, y_coord+5);
    endShape();
  }
  else
  {
    beginShape();
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord,  y_coord+5);
    curveVertex(x_coord+5, y_coord+8);
    curveVertex(x_coord+5, y_coord+8);
    endShape();
  }
  noStroke();
  //eyes
  fill(10);
  ellipse(x_coord-25, y_coord-5, 12,12);
  ellipse(x_coord+25, y_coord-5, 12,12);
  noFill();
  fill(250);
  ellipse(x_coord-22, y_coord-8, 3,3);
  ellipse(x_coord+28, y_coord-8, 3,3);
  noFill();
}

void drawBGCircle (int x_coord, int y_coord, int R, color circleColor)
{
  fill(circleColor);
  ellipse (x_coord, y_coord, R, R);
  noFill();
}

void drawCircle (int x_coord, int y_coord, int R, color circleColor, boolean happy)
{
  //shadow
  fill(40);
  ellipse (x_coord, y_coord+4, R+4, R+4);
  noFill();
  //outline
  fill(250);
  ellipse (x_coord, y_coord, R+4, R+4);
  noFill();
  //actual shape
  fill(circleColor);
  ellipse (x_coord, y_coord, R, R);
  noFill();
  //mouth
  stroke(10);
  strokeWeight(2); 
  if (happy)
  {
    curveTightness(-1);
    beginShape();
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord,  y_coord+8);
    curveVertex(x_coord+5, y_coord+5);
    curveVertex(x_coord+5, y_coord+5);
    endShape();
  }
  else
  {
    beginShape();
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord,  y_coord+5);
    curveVertex(x_coord+5, y_coord+8);
    curveVertex(x_coord+5, y_coord+8);
    endShape();
  }
  noStroke();
  //eyes
  fill(10);
  ellipse(x_coord-25, y_coord-5, 12,12);
  ellipse(x_coord+25, y_coord-5, 12,12);
  noFill();
  fill(250);
  ellipse(x_coord-22, y_coord-8, 3,3);
  ellipse(x_coord+28, y_coord-8, 3,3);
  noFill();
}

void drawBGSquare (int x_coord, int y_coord, int R, color squareColor)
{
  fill(squareColor);
  rect(x_coord, y_coord, R, R);
  noFill();
}

void drawSquare (int x_coord, int y_coord, int R, color squareColor, boolean happy)
{
  rectMode(CENTER);

  //shadow
  fill(40);
  rect(x_coord, y_coord+4, R+4, R+4);
  noFill();
  //outline
  fill(250);
  rect(x_coord, y_coord, R+4, R+4);
  noFill();
  //actual shape
  fill(squareColor);
  rect(x_coord, y_coord, R, R);
  noFill();
  rectMode(CORNER);
  //eyes
  fill(10);
  ellipse(x_coord-25, y_coord-5, 12,12);
  ellipse(x_coord+25, y_coord-5, 12,12);
  noFill();
  fill(250);
  ellipse(x_coord-22, y_coord-8, 3,3);
  ellipse(x_coord+28, y_coord-8, 3,3);
  noFill();
  //mouth
  stroke(10);
  strokeWeight(2); 
  if (happy)
  {
    curveTightness(-1);
    beginShape();
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord-5,  y_coord+5);
    curveVertex(x_coord,  y_coord+8);
    curveVertex(x_coord+5, y_coord+5);
    curveVertex(x_coord+5, y_coord+5);
    endShape();
  }
  else
  {
    beginShape();
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord-5,  y_coord+8);
    curveVertex(x_coord,  y_coord+5);
    curveVertex(x_coord+5, y_coord+8);
    curveVertex(x_coord+5, y_coord+8);
    endShape();
  }
  noStroke();
}

////==========================Misc.============================
boolean is_even (int value) //checks if a value is even or odd
{
  if (value%2==0) return true;
  else return false;
}

 
