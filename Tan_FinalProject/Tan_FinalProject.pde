//Cy Tan


//====================================================================================
//|                                   ***********                                    |
//|                                    Variables                                     |
//|                                   ***********                                    |
//====================================================================================


import ddf.minim.*;
import processing.opengl.*;

//Sound
AudioPlayer musicPlayer;
Minim minim;
AudioPlayer weatherPlayer;
AudioPlayer sfxPlayer;
AudioPlayer transitionSound;
AudioPlayer musicPlayer2, musicPlayer3, musicPlayer4, musicPlayer5, musicPlayer6;
AudioPlayer sfxPlayer1, sfxPlayer2;   
AudioPlayer crash;
AudioPlayer BGM1, BGM2, BGM3, BGM4;

AudioPlayer success;
   
//Cursor Variables
PImage cursor1, cursor2;
cursorMod mouseCursor;
//Background Variables
PImage bg1, bg2;
backgroundMod dynamicBG;
boolean pulse;
//Cutscene Variables


// - start
  cutscenes cutsceneSystem;
  PImage start1, start2, start3, start4, start5, start6, start7, imageTemp, questionMark, questionMark2;
  PImage heart,upsideHeart, heart3;
  button doorButton = new button((new PVector(830,330)), (new PVector(935,524)) );
  boolean run1, run2, run3, run4, run5, run6, run7, run8, run9, run10, run11, run12, run13, run14, run15, run16, run17, run18, run19, run20, run21, showWorld, showHub;
  transition transitionSystem;
  
  boolean invulnerable;
  
  PFont aliceFont, actFont1, actFont2, aliceFont100, aliceFont200;
  PFont aliceFontLarge;
  PFont antipasto60, antipasto160;
  PFont caviardreams150, caviardreams250;
  PFont newgarden150, newgarden250;
  PFont jellyka220, jellyka320; 
  PFont cambria80, cambria180; 
  PFont tnr72, tnr172; 
  PFont franchise100, franchise200, franchise101, franchise102;
  
  
// - acts
PImage actBG, actBG2, actBG3;
PImage heartParticleImage;
PImage skill1ButtonImage, skill2ButtonImage, skill3ButtonImage;
act actSystem;
map1 firstMap;
map2 secondMap;
map3 thirdMap;
map4 fourthMap;
//Buttons
boolean seeButtons=false;
boolean runTransition = false;

//Dialogue
ArrayList scene2Text;
ArrayList scene3Text;
ArrayList scene4Text;
ArrayList scene5Text;
ArrayList scene6Text;


ArrayList allDialogue;
boolean runDialogue;
PFont dgFont;
boolean dialogueAdvancePossible=true;

//Overworld
PImage dorothySprite, platformImage;
worldUnit dorothy;
boolean showUnits;
hub hubSystem;

boolean skill1, skill2, skill3;

PImage scene4Text1, scene4Text2;

PGraphics renderer;

//Map1 triggers
boolean m1Trigger1, m1Trigger2, m1Trigger3, m1Trigger4, m1Trigger5, m1Trigger6;
boolean m2Trigger1, m2Trigger2, m2Trigger3, m2Trigger4, m2Trigger5, m2Trigger6, m2Trigger7, m2Trigger8, m2Trigger9, m2Trigger10, m2Trigger11, m2Trigger12, m2Trigger13;
boolean m3Trigger1, m3Trigger2, m3Trigger3, m3Trigger4, m3Trigger5, m3Trigger6, m3Trigger7, m3Trigger8, m3Trigger9, m3Trigger10, m3Trigger11, m3Trigger12, m3Trigger13;
boolean m4Trigger1, m4Trigger2, m4Trigger3, m4Trigger4, m4Trigger5, m4Trigger6, m4Trigger7, m4Trigger8, m4Trigger9, m4Trigger10, m4Trigger11, m4Trigger12, m4Trigger13;

dialogueSys dialogueSystem;
//=============================================z=======================================
//|                                   ***********                                    |
//|                                      Setup                                       |
//|                                   ***********                                    |
//====================================================================================

void setup()
{
  
  
  textAlign(CENTER);
  
  frameRate(30);
  background(255);
  noStroke();
  size(1024,600, OPENGL);
  //Cursor Setup
  cursor1 = loadImage("cursor1.png");
  cursor2 = loadImage("cursor2.png");
  mouseCursor = new cursorMod();
  //Background Setup
  dynamicBG = new backgroundMod();
  bg1 = loadImage("bg1.PNG");
  bg2 = loadImage("bg2.PNG");
  //Cutscene Variables
  cutsceneSystem = new cutscenes();
  start1 = loadImage("start1.png");
  start2 = loadImage("start2.png");
  start3 = loadImage("start3.png");
  start5 = loadImage("start5.png");
  start6 = loadImage("start6.png");
  start7 = loadImage("start7.png");
  //triggers====
  run1 = true;
  run2 = false;
  run3 = false;
  run4 = false;
  run5 = false;
  run6 = false;
  run7 = true;
  run8 = false;
  run9 = false;
  run10 = false;
  run11 = false;
  run12 = false;
  run13 = false;  
  run14 = false;
  run15 = false;
  run16 = false;
  run17 = false;  
  run18 = false;
  run19 = false;
  run20 = false;
  run21 = false;
  //=====
  showWorld = false;
  showHub = false;
  transitionSystem = new transition();
  noCursor();
  
  aliceFont = loadFont("AliceinWonderland-150.vlw"); 
  aliceFont100 = loadFont("AliceinWonderland-100.vlw"); 
  aliceFont200 = loadFont("AliceinWonderland-200.vlw"); 
  aliceFontLarge = loadFont("AliceinWonderland-250.vlw"); 
  antipasto60 = loadFont("Antipasto-60.vlw");
  antipasto160 = loadFont("Antipasto-160.vlw");
  franchise100 = loadFont("SFNewRepublicSC-70.vlw");
  franchise101 = loadFont("SFNewRepublicSC-100.vlw");
  franchise102 = loadFont("SFNewRepublicSC-60.vlw");
  franchise200 = loadFont("SFNewRepublicSC-170.vlw");
  
  caviardreams150 = loadFont("CaviarDreams-150.vlw");
  caviardreams250 = loadFont("CaviarDreams-250.vlw");
  newgarden150 = loadFont("Champagne&Limousines-150.vlw");
  newgarden250  = loadFont("Champagne&Limousines-250.vlw");
  jellyka220 = loadFont("JellykaEstryasHandwriting-220.vlw");
  jellyka320 = loadFont("JellykaEstryasHandwriting-250.vlw");
  cambria80 = loadFont("Cambria-80.vlw");
  cambria180 = loadFont("Cambria-180.vlw");
  tnr72 = loadFont("TimesNewRomanPSMT-72.vlw");
  tnr172 = loadFont("TimesNewRomanPSMT-172.vlw");
  
  
  actFont1 = loadFont("English-100.vlw");
  actFont2 = loadFont("AnUnfortunateEvent-48.vlw");
  imageTemp = loadImage("imagetemp.PNG");
  questionMark = loadImage("questionMark.png");
  questionMark2 = loadImage("questionMark2.png");
  heart = loadImage("heart.PNG");
  upsideHeart = loadImage ("heart2.PNG");
  heart3 = loadImage ("heart3.PNG");
  actBG = loadImage("actBG.png");
  actBG2 = loadImage("actBG2.png");
  actBG3 = loadImage("actBG3.png");
  
  heartParticleImage = loadImage("heartParticle.png");
  
  skill3ButtonImage = loadImage("skill3Button.png");
  skill2ButtonImage = loadImage("skill2Button.png");
  skill1ButtonImage = loadImage("skill1Button.png");
  
  actSystem = new act("Act 1", "Welcome to Oz");
  
  //Overworld
  dorothySprite = loadImage("dorothySprite2.png");
  dorothy = new worldUnit (dorothySprite);
  showUnits = false;
  hubSystem = new hub();
  firstMap = new map1();
  secondMap = new map2();
  thirdMap = new map3();
  fourthMap = new map4();
   platformImage=loadImage("platform.PNG");
  
  //Dialogue
  scene2Text = new ArrayList();
  scene2Text.add(". . .");
  scene2Text.add("How perculiar.");
  scene2Text.add("I..");
  scene2Text.add("..I don't seem to..");
  scene2Text.add("..remember");
  scene2Text.add(". . .");
  scene2Text.add("Who am I?");
  scene2Text.add("I don't know..");
  scene2Text.add("..why don't I know?");
  scene2Text.add("I..");
  scene2Text.add("..I can't say..");
  scene2Text.add("but.");
  scene2Text.add("I feel..");
  scene2Text.add("..I feel I can't be..");
  scene2Text.add("Here.");
  scene2Text.add("I must..");
  scene2Text.add("go.");
  scene2Text.add("..go where?..");
  scene2Text.add(". . .");
  scene2Text.add("..home?");
  scene2Text.add("It sounds..");
  scene2Text.add("familiar..");
  scene2Text.add("familiar..");
  
  scene3Text = new ArrayList();
  scene3Text.add(new fadeTextObj(". . .", aliceFont, aliceFontLarge));
  scene3Text.add(new fadeTextObj("Mom..", aliceFont, aliceFontLarge));
  scene3Text.add(new fadeTextObj("..are you coming home soon?", aliceFont100, aliceFont200));
  scene3Text.add(new fadeTextObj("I'm already boarding the plane sweetie,", "I'll be there as soon as I can.", antipasto60, antipasto160));
  scene3Text.add(new fadeTextObj("Thanks mom, I..I..", aliceFont100, aliceFont200));
  scene3Text.add(new fadeTextObj("..just really miss you. ", aliceFont100, aliceFont200)); 
  scene3Text.add(new fadeTextObj("I don't think I can deal", "with all this.. ",aliceFont100, aliceFont200));
  scene3Text.add(new fadeTextObj("..all alone.", aliceFont, aliceFontLarge));
  scene3Text.add(new fadeTextObj("It's alright honey,","I'll always be there when you need me.", antipasto60, antipasto160));
  scene3Text.add(new fadeTextObj("It's alright honey,","I'll always be there when you need me.", antipasto60, antipasto160));
  
  scene4Text = new ArrayList();
  
  scene4Text.add(". . .");
  scene4Text.add("..mom?");
  scene4Text.add("1");
  scene4Text.add("..mom..?!");
  scene4Text.add("1");
  scene4Text.add("..MOM?!");
  scene4Text.add("1");
  scene4Text.add(". . .");
  scene4Text.add("..why?");
  scene4Text.add("..why?");
  
  scene5Text = new ArrayList();
  
  scene5Text.add(new fadeTextObj("Hello? Who is this?",franchise101, franchise200));
  scene5Text.add(new fadeTextObj(". . .", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("..Dad,..", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("Dorothy?! Where"," have you gone at this hour!",franchise102, franchise200));
  scene5Text.add(new fadeTextObj("..I..", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("..I can't be here..","..anymore.", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("Get a hold of yourself","Dorothy!",franchise100, franchise200));
  scene5Text.add(new fadeTextObj("..It's..It's...", aliceFont, aliceFontLarge));  
  scene5Text.add(new fadeTextObj("..all my fau-!", aliceFont, aliceFontLarge)); 
  scene5Text.add(new fadeTextObj("It's not", "your fault!", franchise101, franchise200));
  scene5Text.add(new fadeTextObj("B-but..", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("No buts!", franchise101, franchise200));
  scene5Text.add(new fadeTextObj(". . .", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("..b-but I made her","get on that plane..", aliceFont100, aliceFont200));
  scene5Text.add(new fadeTextObj("Don't blame yourself!", franchise102, franchise200));
  scene5Text.add(new fadeTextObj("She..", franchise101, franchise200));
  scene5Text.add(new fadeTextObj("..she wouldn't want you","to be like this..", franchise102, franchise200));
  scene5Text.add(new fadeTextObj("..but..", aliceFont, aliceFontLarge));  
  scene5Text.add(new fadeTextObj("..I can't stand to be here!", aliceFont100, aliceFont200));
  scene5Text.add(new fadeTextObj("..if only I was more","self reliant!..", aliceFont100, aliceFont200));
  scene5Text.add(new fadeTextObj("..than it wouldn't have","to be like this..", aliceFont100, aliceFont200));
  scene5Text.add(new fadeTextObj("You know that isn't true!","Now come back home!", franchise102, franchise200));
  scene5Text.add(new fadeTextObj("but..", aliceFont, aliceFont));
  scene5Text.add(new fadeTextObj("..I'm the reason she died!", aliceFont100, aliceFont200));
  scene5Text.add(new fadeTextObj("Don't be reckless Dorothy!","Turn around!", franchise102, franchise200));
  scene5Text.add(new fadeTextObj(". . .", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("Dorothy!", franchise101, franchise200));
  scene5Text.add(new fadeTextObj("", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("Dorothy?!", franchise101, franchise200));
  scene5Text.add(new fadeTextObj(". . .", aliceFont, aliceFontLarge));
  scene5Text.add(new fadeTextObj("Dorothy..?", franchise101, franchise200));
  scene5Text.add(new fadeTextObj("Dorothy..?", franchise101, franchise200));
  
  scene6Text = new ArrayList();
  
  /*
      PFont caviardreams150, caviardreams250; fd6565
  PFont newgarden150, newgarden250; a0c791
  PFont jellyka220, jellyka320;  af5d977
  PFont cambria80, cambria180; d7acfc
  PFont tnr72, tnr172; 62728d
  */
  
  scene6Text.add(new fadeTextObj(". . .",aliceFont, aliceFontLarge, color(120,120,120)));
  scene6Text.add(new fadeTextObj("Dorothy..?",caviardreams150, caviardreams250, color(#fd6565)));
  scene6Text.add(new fadeTextObj("Doooorothy?",newgarden150, newgarden250, color(#a0c791)));
  scene6Text.add(new fadeTextObj("I've got flowers again..!",jellyka220, jellyka320, color(#f5d977)));
  scene6Text.add(new fadeTextObj("Hey girl, you there?",cambria80, cambria180, color(#d7acfc)));
  scene6Text.add(new fadeTextObj("Waaaaaake up..?",newgarden150, newgarden250, color(#a0c791)));
  scene6Text.add(new fadeTextObj("Honey?",  franchise101, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj("I guess she isn't very", "responsive today Doctor.",franchise102, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj("Unfortunately.",tnr72, tnr172, color(#62728d)));
  scene6Text.add(new fadeTextObj("However, she is showing","signs of improvement.",tnr72, tnr172, color(#62728d)));
  scene6Text.add(new fadeTextObj("The recent scans look promising.",tnr72, tnr172, color(#62728d)));
  scene6Text.add(new fadeTextObj("Try to be hopeful.",tnr72, tnr172, color(#62728d)));
  scene6Text.add(new fadeTextObj("We can only hope for the best.",franchise102, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj("Right guys?",franchise101, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj("Yep!",jellyka220, jellyka320, color(#f5d977)));
  scene6Text.add(new fadeTextObj("Mhm.",newgarden150, newgarden250, color(#a0c791)));
  scene6Text.add(new fadeTextObj("Of course!",cambria80, cambria180, color(#d7acfc)));
  scene6Text.add(new fadeTextObj("All we can do is","be there for her.",franchise102, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj("And be by her side..",franchise100, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj("As we eagerly","await her return",franchise102, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj("Don't worry sir,", "we miss her too." ,jellyka220, jellyka320, color(#f5d977)));
  scene6Text.add(new fadeTextObj("Wait!",caviardreams150, caviardreams250, color(#fd6565)));
  scene6Text.add(new fadeTextObj("Doctor, she's moving!",cambria80, cambria180, color(#d7acfc)));
  scene6Text.add(new fadeTextObj("Her eyes..!",jellyka220, jellyka320, color(#f5d977)));
  scene6Text.add(new fadeTextObj("She's waking up!",franchise101, franchise200, color(120,120,120)));
  scene6Text.add(new fadeTextObj(". . .",aliceFont, aliceFontLarge, color(120,120,120)));
  scene6Text.add(new fadeTextObj(". . . . .",aliceFont, aliceFontLarge, color(120,120,120)));
  scene6Text.add(new fadeTextObj("I'm home..",aliceFont, aliceFontLarge, color(120,120,120)));
  scene6Text.add(new fadeTextObj("I'm home..",aliceFont, aliceFontLarge, color(120,120,120)));
  
  minim = new Minim(this);
  transitionSound = minim.loadFile("transition.mp3");
  musicPlayer = minim.loadFile("music1.mp3");
  crash = minim.loadFile("crash.mp3");
  weatherPlayer = minim.loadFile("rain.mp3");
  sfxPlayer1 = minim.loadFile("doorOpen.mp3");
  sfxPlayer2 = minim.loadFile("doorClose.mp3");
  
  musicPlayer2 = minim.loadFile("music2.mp3"); 
  musicPlayer3 = minim.loadFile("scene2.mp3"); 
  musicPlayer4 = minim.loadFile("scene3.MP3"); 
  musicPlayer5 = minim.loadFile("scene4.MP3"); 

  musicPlayer6 = minim.loadFile("music2.mp3"); 
  
  BGM1 = minim.loadFile("level1.mp3");
  BGM2 = minim.loadFile("level2.mp3");
  BGM3 = minim.loadFile("level3.mp3");
  BGM4 = minim.loadFile("level4.mp3");
  
  success = minim.loadFile("success.mp3");
  
  dynamicBG.turnOn();
  //====================================================================================
  //|                                   ***********                                    |
  //|                                 Dialogue Setup                                   |
  //|                                   ***********                                    |
  //====================================================================================
  
  scene4Text1 = loadImage ("scene4text1.PNG");
  scene4Text2 = loadImage ("scene4text2.PNG");
  
  runDialogue = false;
  dgFont = loadFont ("Champagne&Limousines-Bold-32.vlw");
  //Dorothy=======
  PImage dorothyPain = loadImage("dorothy_1.PNG");
  PImage dorothyPainListening = loadImage("dorothy_6.PNG");
  PImage dorothyNormal = loadImage("dorothy_2.PNG");
  PImage dorothySad = loadImage("dorothy_4.PNG");
  PImage dorothyAngry = loadImage("dorothy_10.PNG");
  PImage dorothyAngryListening = loadImage("dorothy_9.PNG");
  PImage dorothySad2 = loadImage("dorothy_3.PNG");
  PImage dorothyNormalListening = loadImage("dorothy_8.PNG");
  PImage dorothyNormalListening2 = loadImage("dorothy_5.PNG");
  PImage dorothyMelancholy = loadImage("dorothy_11.PNG");
  PImage dorothySurprised = loadImage("dorothy_13.PNG");
  PImage dorothyHappy = loadImage("dorothy_12.PNG");
  PImage dorothyHappyListening = loadImage("dorothy_7.PNG");
  //==============
  PImage tempFace = loadImage("tempFace.png");

  allDialogue = new ArrayList();
  
  allDialogue.add(new ArrayList());

  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("Oof! What a fall-|", dorothyPain, 5, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("...where am I?|", dorothyNormal, 2, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("My..my head..I don't feel quite right.|", dorothyNormal, 0, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("Why can't I seem to remember..|", dorothyNormal, 0, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("..anything..?|", dorothySad, 2, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("I..|", dorothySad, 0, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("..I feel..pain.|", dorothySad2, 0, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("My mind..|", dorothySad, 0, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("..it's going to pieces.|", dorothySad, 0, "???"));
  ((ArrayList)allDialogue.get(0)).add(new dialogue ("I best find a way out before I lose it.|", dorothyNormal, 9, "???"));
  
  allDialogue.add(new ArrayList());

  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(1)).add(new dialogue ("What an abrupt end..|", dorothySad, 1, "???"));
  ((ArrayList)allDialogue.get(1)).add(new dialogue ("...it's unfortunate, really..|..I felt as if it was calling to me.", dorothyNormal, 0, "???"));
  ((ArrayList)allDialogue.get(1)).add(new dialogue ("I wonder why there's a road that leads no where..|", dorothySad, 2, "???"));
  ((ArrayList)allDialogue.get(1)).add(new dialogue ("..my head..|..what a pain it's being", dorothyPain, 5, "???"));
  
  allDialogue.add(new ArrayList());

  //dialogue(String temp1, PImage temp2, int temp3, PImage temp4, int temp5, int temp6, String nametemp1, String nametemp2)
  
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("I see, I see, so you have returned.|Drawn to this path of brilliance I see?", dorothyNormalListening, 0, tempFace, 1, 2, "???", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Who..who are you?|", dorothyNormal, 2, tempFace, 0, 1, "???", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("I am crow, an old friend, or foe? You've no recall?|The four of us; us all. All filled with out flaws?", dorothyNormalListening, 0, tempFace, 0, 2, "???", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("...|", dorothyNormalListening2, 8, tempFace, 0, 1, "???", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("No words to say? Keeping me at bay? It is fine, today is the day.|It is the return of Dorothy, a maiden per se.", dorothyNormalListening, 0, tempFace, 2, 2, "???", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("..Dorothy?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Your name yes? Of course, it fits best.|It's a name among names, known for its fame.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("I..see.|", dorothyNormal, 8, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("You see?|That cannot be.", dorothyNormalListening2, 0, tempFace, 2, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("What do you mean..?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("The gift of sight is for those in the right.|", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("I am in the..right?|", dorothyAngry, 5, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("No, no, you've lost your way,|you've gone astray. You're not okay.", dorothyNormalListening2, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("I'm am okay, I've no idea what you're saying.|", dorothyAngry, 1, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("The void in your head. Empty instead.|You've lost your mind, and it's painful to find.", dorothyAngryListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("You..know about my headache?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("A headache?|This is no such small thing.", dorothyNormalListening2, 0, tempFace, 2, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("The emptiness in your head|has great troubles to bring.", dorothyNormalListening2, 0, tempFace, 2, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Like what..?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("For one, you've lost your sight, for two, you're losing life ,|and for three, your time is tight.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Time?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("You've only so much, you must hurry,| before you lose touch.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Than I must be on my way,|thank your for your help.", dorothyNormal, 0, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("My help? My help does not end here,|I will lend you my mind so you can endear.", dorothyNormalListening, 0, tempFace, 2, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Thank you, err..Crow. But why your mind?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Because you've been kind. You've helped me get mine mind.|It has been quite a long time, back then I did not rhyme.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Back then..huh|Unfortunately, I can't remember.", dorothySad,6, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("It is fine my dear, but go on, leave here.|Finish the road, find the gold.", dorothyNormalListening2, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("You mean the bridge? How?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("You now have my mind, you now have some sight.|It will guide as a light, and lead you alright.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("I see..|", dorothyNormal, 9, tempFace, 0, 1, "Dorothy", "Crow"));
  ((ArrayList)allDialogue.get(2)).add(new dialogue ("Of course, yes, you barely do.|Goodbye, Dorothy, I shall be gone too.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Crow"));


  allDialogue.add(new ArrayList());

  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(3)).add(new dialogue ("What is this, a brick?|", dorothyAngry, 1, "Dorothy"));
  ((ArrayList)allDialogue.get(3)).add(new dialogue ("This must be the \"gold\"|Crow was talking about.", dorothyNormal, 9, "Dorothy"));
  ((ArrayList)allDialogue.get(3)).add(new dialogue ("I guess, I'll take this with-|Wait, somethings not right.", dorothySad, 1, "Dorothy"));
  ((ArrayList)allDialogue.get(3)).add(new dialogue ("My head, it's being..|..flooded", dorothyPain, 0, "Dorothy"));
  
  allDialogue.add(new ArrayList());

  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("...|", dorothyPainListening,8, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("..what..|was that..?", dorothyNormal, 2, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("A memory..?|", dorothySad, 2, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("..\"mom\"..?|", dorothyNormal, 2, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("This word..|..it sounds so warm..", dorothyMelancholy, 3, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("..!|", dorothyNormal, 1, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("My chest..!|It..hurts..", dorothyPain, 1, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("This pain, why?|", dorothySad, 2, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("...|", dorothyNormalListening2, 8, "Dorothy"));
  ((ArrayList)allDialogue.get(4)).add(new dialogue ("I better get going,|it takes more than one brick to finish a road.", dorothyNormal, 9, "Dorothy"));

   allDialogue.add(new ArrayList());

  //dialogue(String temp1, PImage temp2, int temp3, PImage temp4, int temp5, int temp6, String nametemp1, String nametemp2)
  
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Ah, it's you.|You, you, you.", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("It's good to see you again dear,|come o'here. Give me a hug!", dorothyNormalListening, 0, tempFace, 4, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("...?!|", dorothySurprised,8, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Why are you hugging me!|Get off me!", dorothyAngry, 5, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("You must be kidding me!|You don't want a hug from your old, old friend?", dorothyAngryListening, 0, tempFace,1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Fortunately, I'm glad I don't remember you.|", dorothyAngry, 6, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("That hurts.|But you're forgiven, you're Dorothy after all.", dorothyAngryListening, 0, tempFace, 0, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("You..know my name?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("And you know mine?|", dorothyNormalListening, 0, tempFace, 2, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("...|", dorothyNormalListening, 8, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("No.|", dorothyNormal, 0, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("I'm heartbroken! But I forgive you,|I'm the Tinman, and I'm glad we're meeting again.", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("I see..?|", dorothySad2, 2, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Oh, of course you do, I see ol' crow must have lended you a bit of his mind.|Quite functional isn't it?", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("You know Crow?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("And he knows me!|Anyways, I heard you were looking for bricks?", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Ah, yes, the \"gold\".|", dorothyHappy, 6, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Is that what Crow is calling them these days?|What a laugh!", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Anyways, you'll probably be needing my help for the next one.|There's about four in all.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Four, that's not many..|..and why do I need your help?", dorothySad2, 2, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Because you're lost again dear!|", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("I can feel just fine.|", dorothyNormal, 5, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Hardly! You've lost your heart dear.|Don't you dare say otherwise.", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("My heart?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Yes, your heart, and without your heart..|..how could you ever survive?", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("There's no joy, no fun, no surprise,|and most of all, no love!", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Love..?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Yes, love.|With love you can jump with joy, be elated with surprise, even leap bounds!", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Hmph.|", dorothyAngryListening, 7, tempFace, 0, 1, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Well, anyways, you need a heart.|Take mine out for a spin, you'll find love soon enough.", dorothyNormalListening, 0, tempFace, 9, 2, "Dorothy", "Tinman"));
  ((ArrayList)allDialogue.get(5)).add(new dialogue ("Thanks..?|", dorothyNormalListening, 2, tempFace, 0, 1, "Dorothy", "Tinman"));
  
  allDialogue.add(new ArrayList());

  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(6)).add(new dialogue ("Another brick!|", dorothyHappy, 3, "Dorothy"));
  ((ArrayList)allDialogue.get(6)).add(new dialogue ("All that jumping..|..was quite a bit of fun..", dorothyNormal, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(6)).add(new dialogue ("Maybe a heart isn't so bad after-|", dorothyNormal, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(6)).add(new dialogue ("!..|", dorothySurprised, 1, "Dorothy"));
  ((ArrayList)allDialogue.get(6)).add(new dialogue ("It's happening again..|", dorothySad, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(6)).add(new dialogue ("My head..I'm falling..|", dorothyPain, 10, "Dorothy"));
  
  allDialogue.add(new ArrayList());
  
  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(7)).add(new dialogue (".....|", dorothyPainListening, 8, "Dorothy"));
  ((ArrayList)allDialogue.get(7)).add(new dialogue ("..Another memory?|", dorothySad, 2, "Dorothy"));
  ((ArrayList)allDialogue.get(7)).add(new dialogue ("This one was..|..painful..", dorothySad, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(7)).add(new dialogue ("Why do I remember..|..her?", dorothyPain, 2, "Dorothy"));
  ((ArrayList)allDialogue.get(7)).add(new dialogue ("I can't..|..I can't go on much longer..", dorothySad, 8, "Dorothy"));
  ((ArrayList)allDialogue.get(7)).add(new dialogue ("Mom..?|..I..", dorothySad, 2, "Dorothy"));
  ((ArrayList)allDialogue.get(7)).add(new dialogue ("I'm afraid..|", dorothyPain, 0, "Dorothy"));
  
  allDialogue.add(new ArrayList());
  
  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Fear not lass!|The great knight Leo has come to your aid.", dorothyNormalListening, 0, tempFace, 1, 2, "Dorothy", "???"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("My aid?|I am quite fine thank you.", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Fine?|If only you were so fortunate.", dorothyNormalListening, 0, tempFace, 2, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("How am I not fine..?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("You lack something of great importance, and without it, you will fail.|", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("What could you mean..?|", dorothyNormal, 0, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("I have a mind and a heart, what more could I need?|A liver?", dorothyAngry, 5, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Ah, well,|you're definitely not missing a sense of humor.", dorothyAngryListening, 0, tempFace, 6, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Haha?|", dorothyHappy, 0, tempFace, 6, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Ahem.|", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("What you're lacking is courage,|I sense the emptiness in you. Your fear..", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("..It is all-consuming. |", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("...|", dorothyPainListening, 8, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Be honest with yourself Dorothy.|It is okay to be afraid.", dorothyPainListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("I'm trembling..|", dorothySad, 0, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Do not waver, if you believe,|courage will carry you through.", dorothyNormalListening2, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("So you will lend me yours?|", dorothySad, 2, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("No, I won't.|", dorothyNormalListening2, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("...|", dorothyPainListening, 0, tempFace, 8, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("It is not that I am any less generous than Crow or Tin.| It is that courage is not something that is given..", dorothyNormalListening2, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("...?|", dorothyNormalListening, 2, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("..It is something that is earned.|", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Something that comes from within.|", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("It is neither the absence of fear|nor the unwillingness to accept it. ", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("It is facing your fears...|..to do what you are afraid to do..", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("..because you realize something is more important.|", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("..something more important?|", dorothyNormal, 2, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("It is a will to overcome, Dorothy.|", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("..To let go of the familiar|and forge ahead into new territory..", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("...|", dorothyNormalListening2, 8, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("But..|I'm not sure I can do it on my own...", dorothySad, 0, tempFace, 0, 1, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Do not invest in self-doubt Dorothy.|", dorothyNormalListening, 0, tempFace,1, 2, "Dorothy", "Leo"));
  ((ArrayList)allDialogue.get(8)).add(new dialogue ("Just remember this.|Be brave, and there is nothing you cannot do.", dorothyNormalListening, 0, tempFace, 0, 2, "Dorothy", "Leo"));


  allDialogue.add(new ArrayList());
  
  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(9)).add(new dialogue ("..the third brick!|", dorothyHappy, 3, "Dorothy"));
  ((ArrayList)allDialogue.get(9)).add(new dialogue ("I guess Leo was right..|..even in someone like me..", dorothyMelancholy, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(9)).add(new dialogue ("..there is courage.|", dorothyNormal, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(9)).add(new dialogue ("I just need to set my mind to it.|", dorothyHappy, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(9)).add(new dialogue ("I'm feeling a bit dizzy though..|..I guess this brick will also reveal another memory.", dorothyPain, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(9)).add(new dialogue ("..I'm not sure what it will be..|", dorothySad, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(9)).add(new dialogue ("..but I must be brave..|", dorothyAngry, 1, "Dorothy"));
  
  allDialogue.add(new ArrayList());
  
  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("...!|", dorothyNormalListening2, 1, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("...|", dorothyPainListening, 8, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("..these memories..|", dorothyPain, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("..they're so painful.|", dorothyPain, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("..I can still hear the sound..|..of twisting metal.", dorothySad, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("I can see why I was|trying to forget.", dorothySad, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("But I can't give up now.|", dorothySad, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("Even if the future is|uncertain and frightening.", dorothySad, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(10)).add(new dialogue ("I can't let Crow, Tinman, Leo,|and most of all, myself, down.", dorothyNormal, 10, "Dorothy"));
  
  
   allDialogue.add(new ArrayList());
  
  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("I made it!|", dorothyHappy, 1, "Dorothy"));
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("I finally made it..|", dorothyHappy, 3, "Dorothy"));
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("I can finally can|finish the bridge...", dorothyHappy, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("...and get to where I'm going..|", dorothyMelancholy, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("Wow..|..just holding this brick..", dorothyNormal, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("..makes me feel..|..lightheaded.", dorothyPain, 8, "Dorothy"));
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("I guess it's time..|..to get ready..", dorothyNormal, 0, "Dorothy"));
  ((ArrayList)allDialogue.get(11)).add(new dialogue ("..to go home.?|", dorothyMelancholy, 2, "Dorothy"));

  allDialogue.add(new ArrayList());
    
  //dialogue(String temp1, PImage temp2, int temp3, String nametemp1) 
  ((ArrayList)allDialogue.get(12)).add(new dialogue ("Welcome home..", dorothyHappyListening, 0, tempFace, 1, 2, "Dorothy", "Dad"));
  ((ArrayList)allDialogue.get(12)).add(new dialogue ("..glad to be back..", dorothyHappy, 2, tempFace, 3, 1, "Dorothy", "Dad"));
  
  dialogueSystem = new dialogueSys(allDialogue);
}



//====================================================================================
//|                                   ***********                                    |
//|                                     Systems                                      |
//|                                   ***********                                    |
//====================================================================================


//====================================================================================
//|                                   CursorClass                                    |
//====================================================================================
class cursorMod
{
  PImage active;
  boolean isActive;
  int pulseCounter, hoverCounter;
  boolean pulseOn;
  
  cursorMod()
  {
    isActive=false;
    active=cursor1;
    hoverCounter = 0;
  }
  void run()
  {
    if (hoverCounter>0) {hoverCounter--; active=cursor2;}
      else {active=cursor1;} 
    
    image(active,mouseX, mouseY);
    if (pulse)
    {
      if (pulseCounter<12 && pulseOn){pulseCounter+=1;}
        else {pulseOn=false; pulseCounter--;}
      tint(255,40);
      for(int i = 0; i<pulseCounter; i++)
      {      
        image(active,mouseX, mouseY);
      }
      noTint();
      if (pulseCounter<0) {pulse=false;}
    }
  }
  void pulse()
  {
    pulse =true;
    pulseCounter=0;
    pulseOn=true;
  }
  
  void hoverOn()
  {
    hoverCounter++;
  }
}

//====================================================================================
//|                                    Background                                    |
//====================================================================================
class backgroundMod
{
  boolean isActive, turnOn, turnOff;
  int fadePass, bgPass, fadeRate, bgSpeed, bgSpeedCounter;
  
  
  backgroundMod()
  {
    isActive=false;
    fadePass=0;
    bgPass = 0;
    turnOn = false;
    turnOff = false;
    fadeRate = 20;
    bgSpeedCounter = 0;
    bgSpeed=3;
  }
  
  void run()
  {
    if(!run2 && !run5 && !run8 && !run10 && !run12){
      if (isActive){
        if (turnOn)
        {
          if(fadePass<fadeRate)
          {
            fadePass++;
            tint(255,fadePass*(255/fadeRate));
          }
          bgSpeedCounter++;
          if (bgSpeedCounter==2) {bgSpeedCounter=0; bgPass++;}
          if (bgPass==height) {bgPass=0;}
          image (bg1,0,-bgPass);
          image (bg1,0,height-bgPass);
          image (bg2,0,0);
          noTint();
        }
      }
    }
  }
  
  void turnOn()
  {
    if (!isActive)
    {
      isActive=true;
      turnOn=true;
      fadePass=0;
    }
  }
  
  void turnOff()
  {
    turnOff=true;
    fadePass=0;
  }
}
//====================================================================================
//|                                    Cutscenes                                     |
//====================================================================================
class cutscenes
{
  int pass, startPass, startPassVelocity;
  PImage start1Temp, start2Temp;
  boolean startDoorBoolean;
  boolean resetted=true;
  boolean doorOpen;
  
  
  cutscenes()
  {
     pass=0;
     startPass = 0;
     startPassVelocity = 3;
     doorOpen=false;

  }
//========================Run1===============================
  void runStart()
  {
    if (doorButton.getHover())
    {
      start1Temp = start6;
      start2Temp = start7;
      if (!doorOpen)
      {
        sfxPlayer1.rewind();
        sfxPlayer1.play();
        doorOpen=true;
      }
    }
    else
    {
      start1Temp = start2;
      start2Temp = start3;
      if (doorOpen)
      {
        sfxPlayer2.rewind();
        sfxPlayer2.play();
        doorOpen=false;
      }
    }
    pass++;
    if (pass==10) {musicPlayer.loop();}
    if (pass==80) {weatherPlayer.loop();}
    tint(255,(pass-50)*2*2.55);
    image(start1,0,0);
    noTint();
    tint(255,(pass-100)*2*2.55);
    image(start1Temp,0,0);
    noTint();
    
    tint(255,(pass-100)*2*2.55);
    image(start5,0,(int)(startPass-startPass*.95));
    noTint();
    
    if (pass>150)
    {
      startPass+=startPassVelocity;
      tint(255, startPass);
      image(start2Temp, 0, 0);
      noTint();
      if (startPass>255)
      {
        startPassVelocity = startPassVelocity*-1;
      }
      else if (startPass<100)
      {
        startPassVelocity = 3;
      }
    }
    
    if (pass>70)
    {
      rainSystem.add(new rainParticle());
      rainSystem.add(new rainParticle());
      for (int i = 0; i< rainSystem.size(); i++)
      {
        ((rainParticle)rainSystem.get(i)).run();
        if (((rainParticle)rainSystem.get(i)).checkLife())
        {
          rainSystem.remove(i);
          i--;
        }
      }
     //Run button
     doorButton.run();
     if(doorButton.getClicked()) {runTransition=true;}
     if (runTransition) {
       musicPlayer.setGain(-(transitionSystem.getPass()/transitionSystem.getSpeed())*28);
       weatherPlayer.setGain(-(transitionSystem.getPass()/transitionSystem.getSpeed())*28);
     }
     if (transitionSystem.getPass()==transitionSystem.getSpeed()) {
       run1=false; run2=true; resetPass(); stringer = new fadeText(scene2Text); musicPlayer.pause(); weatherPlayer.pause();
       start1 = null;
       start5 = null;
       start2 = null;
       start3 = null;
       start1Temp = null;
       musicPlayer = null;
       weatherPlayer= null;
       start6 = null;
       start7 = null;
       sfxPlayer1 = null;
       sfxPlayer2 = null;
     }
    }
  }
  
  //========================Run2===============================
  
  boolean musicOn=true;
  
  void scene2()
  {
    if (musicOn) {musicOn=false; musicPlayer2.play();}
    
    fill(10,90);
    rect(0,0,width, height);
    noFill();
    
    if (((int)(random(0,3)))==2) {scene2System.add(new scene2Particle());}
    for (int i = 0; i< scene2System.size(); i++)
    {
      ((scene2Particle)scene2System.get(i)).run();
      if (((scene2Particle)scene2System.get(i)).checkLife())
      {
        scene2System.remove(i);
        i--;
      }
    }
    stringer.run();
    
    if (stringer.isDone() ) {
      if (resetted)
      {
        resetted=false;
        transitionSystem.reset(); 
        runTransition=true;
      }
      if (transitionSystem.ifMax()) {run2=false; run3=true;}
    }
    
  }
  
  //========================Run3===============================
  
  boolean musicOn2=true;
  
  void scene3()
  {
    if (musicOn2) {musicOn2=false; musicPlayer3.play();}
    
    fill(10,90);
    rect(0,0,width, height);
    noFill();
    
    if (((int)(random(0,3)))==2) {scene3System.add(new scene3Particle());}
    for (int i = 0; i< scene3System.size(); i++)
    {
      ((scene3Particle)scene3System.get(i)).run();
      if (((scene3Particle)scene3System.get(i)).checkLife())
      {
        scene3System.remove(i);
        i--;
      }
    }
    
    stringer2.run();
    
    if (stringer2.isDone() ) {
    if (resetted)
    {
        resetted=false;
        transitionSystem.reset(); 
        runTransition=true;
    }
    if (transitionSystem.ifMax()) {actSystem.reset("Act 2", "Heartbreak",2); run3=true; run5= false;}
    }
  }
  
  //========================Run4===============================
  
  boolean musicOn3=true;
  
  void scene4()
  {
    if (musicOn3) {musicOn3=false; musicPlayer4.play();}
    
    fill(10,90);
    rect(0,0,width, height);
    noFill();
    
    
    if (((int)(random(0,3)))==2) {scene3System.add(new scene3Particle(true));}
    for (int i = 0; i< scene3System.size(); i++)
    {
      ((scene3Particle)scene3System.get(i)).run();
      if (((scene3Particle)scene3System.get(i)).checkLife())
      {
        scene3System.remove(i);
        i--;
      }
    }

    stringer3.run();
    
    if (stringer3.isDone() ) {
    if (resetted)
    {
        resetted=false;
        transitionSystem.reset(); 
        runTransition=true;
    }
    if (transitionSystem.ifMax()) {actSystem.reset("Act 3", "Braving the Past",3); run8 = false; run3 = true; }
    }
  }
  
    
  //========================Run10===============================
  //don't forget to lookup nextString() for the run boolean
  
  boolean musicOn4=true;
  
  void scene5()
  {
    if (musicOn4) {musicOn4=false; musicPlayer5.play();}
    fill(240,90);
    rect(0,0,width, height);
    noFill();
    
    
    if (((int)(random(0,3)))==2) {scene3System.add(new scene3Particle(true,true));}
    for (int i = 0; i< scene3System.size(); i++)
    {
      ((scene3Particle)scene3System.get(i)).run();
      if (((scene3Particle)scene3System.get(i)).checkLife())
      {
        scene3System.remove(i);
        i--;
      }
    }
    
    
    stringer4.run();
    
    if (stringer4.isDone() ) {
    if (resetted)
    {
        resetted=false;
        transitionSystem.reset(); 
        runTransition=true;
    }
    if (transitionSystem.ifMax()) {actSystem.reset("Act 4", "Awakening",4); run10 = false; run3 = true; }
    }
  }
 //=============================================================
   //========================Run12===============================
  //don't forget to lookup nextString() for the run boolean
  
  boolean musicOn5=true;
  
  boolean goUp, goDown, reset;
  int slopeDist;
  float currentY = height/2;
  float slope;
  float slopeCounter;
  
  void scene6()
  {
    if (musicOn5) {musicOn5=false; musicPlayer6.play();}
    fill(240,90);
    rect(0,0,width, height);
    noFill();
    
    if (!goUp && !goDown) 
    {
      slopeCounter = 0;
      if (currentY>500) {goUp=true;}
      else if (currentY<200) {goDown=true;}
      else if ((int)(random(0,2))==1) {goUp=true;}
        else {goDown = true;}
      
      slopeDist = (int)(random(6,13));  
      
      int tempVal;
      
      if(goUp) {tempVal=-1;}
        else {tempVal=1;}
        
      
      if (slopeDist>=10){ slope = tempVal*random(2,7);}
      else { slope = tempVal*random(2,10);}
      
      if ((int)(random(0,9))==5) 
      {
        slope = 0;
      }
    }
    

    if (slopeCounter>=slopeDist)
    {
      if (goUp)
      {
        if ((int)(random(0,10))>1 && currentY<100){
          goDown=true;
          slopeCounter = 0;
          slopeDist = (int)(random(5,10));  
          slope = -1*random(4,10); 
        }
        goUp = false;
      }
      else if (goDown)
      {
        if ((int)(random(0,10))>1 && currentY>500){
          goUp=true;
          slopeCounter = 0;
          slopeDist = (int)(random(3,10));  
          slope = random(4,10);
        }
        goDown = false;
      }

    }
    if (slopeCounter<slopeDist)
    {
      slopeCounter+=.5;
      currentY+=(slope/2);
    }
    scene6System.add(new scene6Particle(-15, (int)currentY));
    if (slopeCounter<slopeDist)
    {
      slopeCounter+=.5;
      currentY+=(slope/2);
    }
    for (int i = 0; i< scene6System.size(); i++)
    {
      ((scene6Particle)scene6System.get(i)).run();
      if (((scene6Particle)scene6System.get(i)).checkLife())
      {
        scene6System.remove(i);
        i--;
      }
    }
    
    
    
    stringer5.run();
    
    if (stringer5.isDone() ) {
    if (resetted)
    {
        resetted=false;
        transitionSystem.reset(); 
        runTransition=true;
    }
    if (transitionSystem.ifMax()) {}
    }
  }
 //=============================================================
  void reset()
  {
    resetted=true;
  }
  int getPass()
  {
    return pass;
  }
  
  void resetPass()
  {
    pass=0;
    
  }
}

//====================================================================================
//|                                   ***********                                    |
//|                                 Letter Systems                                   |
//|                                   ***********                                    |
//====================================================================================

fadeText stringer;
fadeText stringer2;
fadeText stringer3;
fadeText stringer4;
fadeText stringer5;
fadeText stringer6;

class fadeText
{
  int pass;
  String mainString;
  int letters;
  int activeString;
  boolean inOut;
  ArrayList stringArray;
  boolean done;
  boolean special;
  PFont givenFont, givenFont2;
  int runType;

  
  fadeText (ArrayList temp)
  {
    runType = 0;
    special  = false;
    stringArray = temp;
    activeString=0;
    mainString = (String)stringArray.get(activeString);
    pass=0;
    letters=1;
    inOut=false;
    done = false;
  }
  
  fadeText (ArrayList temp, int val)
  {
    runType = val;
    special = true;
    stringArray = temp;
    activeString=0;
    if (val==1 || val==3 || val==4)
    {
      mainString = ((fadeTextObj)stringArray.get(activeString)).getString();
      givenFont = ((fadeTextObj)stringArray.get(activeString)).getFont();
    }
    else if (val==2)
    {
      mainString = (String)stringArray.get(activeString);
    }

    pass=0;
    letters=1;
    inOut=false;
    done = false;
  }
  
  void run()
  {
    if (runType==0){
      if (!inOut) {pass++;}
      else {pass--;}
      if (pass>=50) {inOut=true;}
      if (inOut && pass<7) {inOut=false;}
      textFont(aliceFont);
      textAlign(CENTER);
       fill(255,(pass*2*2.55)/2);
      text(mainString.substring(0,letters),width/2,height/2+50);
      fill(255,(pass*2*2.55)/18);
      text(mainString.substring(0,letters),width/2,height/2+55);
      textFont(aliceFontLarge);
      fill(255,(pass*2*2.55)/40);
      text(mainString.substring(0,letters),width/2,height/2+80);    
      noFill();
      if (pass>5 && letters<mainString.length()) {pass=0; letters++;}
      if (activeString==stringArray.size()-1) {done=true;}
    }
    else if (runType==1)
    {
      run2();
    }
    else if (runType==2)
    {
      run3();
    }
    else if (runType==3)
    {
      run4();
    }
    else if (runType==4)
    {
      run5();
    }
  }
  
  void run2()
  {
      if (!inOut) {pass++;}
      else {pass--;}
      if (pass>=50) {inOut=true;}
      if (inOut && pass<7) {inOut=false;}
      
      //======
      if (((fadeTextObj)stringArray.get(activeString)).getString2()==""){
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont());
        textAlign(CENTER);
        fill(255,(pass*2*2.55)/2);
        text(mainString,width/2,height/2+50);
        fill(255,(pass*2*2.55)/18);
        text(mainString,width/2,height/2+55);
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont2());
        fill(255,(pass*2*2.55)/40);
        text(mainString.substring(0,letters),width/2,height/2+80);    
        noFill();
      }
      else 
      {
        int heightOffset = 60;
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont());
        textAlign(CENTER);
        //you were working on the mom scene making two lines of words
        fill(255,(pass*2*2.55)/2);
        text(mainString + "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+50 - heightOffset);
        fill(255,(pass*2*2.55)/18);
        text(mainString+ "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+55 - heightOffset);
        
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont2());
        fill(255,(pass*2*2.55)/40);
        
        text(mainString.substring(0,letters) + "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+80 - heightOffset*2.2);    
        noFill();
      }
      //====
      
      if (activeString==stringArray.size()-1) {done=true;}
      //

  }
  
  void run3()
  {
    if (mainString != "1")
    {
      if (!inOut) {pass++;}
      else {pass--;}
      if (pass>=50) {inOut=true;}
      if (inOut && pass<7) {inOut=false;}
      textFont(aliceFont);
      textAlign(CENTER);
      fill(255,(pass*2*2.55)/2);
      text(mainString,width/2,height/2+50);
      fill(255,(pass*2*2.55)/18);
      text(mainString,width/2,height/2+55);
      textFont(aliceFontLarge);
      fill(255,(pass*2*2.55)/40);
      text(mainString,width/2,height/2+80);    
      noFill();
      
    }
    else 
    {
      if (!inOut) {pass++;}
      else {pass--;}
      if (pass>=50) {inOut=true;}
      if (inOut && pass<7) {inOut=false;}
      tint(255,(int)((pass*2*2.55)/40));
      image(scene4Text2,0,0);
      noTint();
      tint(255,(int)((pass*2*2.55)/2));
      image(scene4Text1,0,0);
      noTint();
    }
    if (activeString==stringArray.size()-1) {done=true;}
  }
  
  void run4()
  {
      if (!inOut) {pass++;}
      else {pass--;}
      if (pass>=50) {inOut=true;}
      if (inOut && pass<7) {inOut=false;}
      
      //======
      if (((fadeTextObj)stringArray.get(activeString)).getString2()==""){
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont());
        textAlign(CENTER);
        fill(0,(pass*2*2.55)/2);
        text(mainString,width/2,height/2+50);
        fill(0,(pass*2*2.55)/18);
        text(mainString,width/2,height/2+55);
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont2());
        fill(0,(pass*2*2.55)/40);
        text(mainString.substring(0,letters),width/2,height/2+80);    
        noFill();
      }
      else 
      {
        int heightOffset = 60;
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont());
        textAlign(CENTER);
        //you were working on the mom scene making two lines of words
        fill(0,(pass*2*2.55)/2);
        text(mainString + "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+50 - heightOffset);
        fill(0,(pass*2*2.55)/18);
        text(mainString+ "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+55 - heightOffset);
        
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont2());
        fill(0,(pass*2*2.55)/40);
        
        text(mainString.substring(0,letters) + "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+80 - heightOffset*2.2);    
        noFill();
      }
      if (activeString==26){crash.play();}
      //==== 
      if (activeString==stringArray.size()-1) {done=true;}
  }
  
  void run5()
  {
      if (!inOut) {pass++;}
      else {pass--;}
      if (pass>=50) {inOut=true;}
      if (inOut && pass<7) {inOut=false;}
      
      //======
      if (((fadeTextObj)stringArray.get(activeString)).getString2()==""){
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont());
        textAlign(CENTER);
        fill(((fadeTextObj)stringArray.get(activeString)).getColor(),(pass*2*2.55)/2);
        text(mainString,width/2,height/2+50);
        fill(((fadeTextObj)stringArray.get(activeString)).getColor(),(pass*2*2.55)/18);
        text(mainString,width/2,height/2+55);
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont2());
        fill(((fadeTextObj)stringArray.get(activeString)).getColor(),(pass*2*2.55)/40);
        text(mainString.substring(0,letters),width/2,height/2+80);    
        noFill();
      }
      else 
      {
        int heightOffset = 60;
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont());
        textAlign(CENTER);
        //you were working on the mom scene making two lines of words
        fill(((fadeTextObj)stringArray.get(activeString)).getColor(),(pass*2*2.55)/2);
        text(mainString + "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+50 - heightOffset);
        fill(((fadeTextObj)stringArray.get(activeString)).getColor(),(pass*2*2.55)/18);
        text(mainString+ "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+55 - heightOffset);
        
        textFont(((fadeTextObj)stringArray.get(activeString)).getFont2());
        fill(((fadeTextObj)stringArray.get(activeString)).getColor(),(pass*2*2.55)/40);
        
        text(mainString.substring(0,letters) + "\n" + ((fadeTextObj)stringArray.get(activeString)).getString2(),width/2,height/2+80 - heightOffset*2.2);    
        noFill();
      }
      //====
      
      if (activeString==stringArray.size()-1) {done=true;}
      //

  }
  void nextString()
  {
    if (activeString<stringArray.size()-1) {activeString++;}
    if (runType==0 || runType==2){
      mainString = (String)stringArray.get(activeString);
    }
    else
    {
      mainString = ((fadeTextObj)stringArray.get(activeString)).getString();
    }
    pass=0;
    letters=mainString.length();
    inOut=false;
  }
  
  boolean isDone()
  {
    return done;
  }
}

class fadeTextObj
{
  String givenString;
  String givenString2;
  PFont givenFont;
  PFont givenFont2;
  color givenColor;
  
  fadeTextObj(String temp1, PFont temp2, PFont temp3)
  {
    givenString = temp1;
    givenString2 = "";
    givenFont = temp2;
    givenFont2 = temp3;
  }
  
  fadeTextObj(String temp1, String temp1_1, PFont temp2, PFont temp3)
  {
    givenString = temp1;
    givenString2 = temp1_1;
    givenFont = temp2;
    givenFont2 = temp3;
  }
  
  fadeTextObj(String temp1, PFont temp2, PFont temp3, color tempColor)
  {
    givenString = temp1;
    givenString2 = "";
    givenFont = temp2;
    givenFont2 = temp3;
    givenColor = tempColor;
  }
  
  fadeTextObj(String temp1, String temp1_1, PFont temp2, PFont temp3 , color tempColor)
  {
    givenString = temp1;
    givenString2 = temp1_1;
    givenFont = temp2;
    givenFont2 = temp3;
    givenColor = tempColor;
  }
  
  PFont getFont()
  {
    return givenFont;
  }
  
  PFont getFont2()
  {
    return givenFont2;
  }
  
  String getString2()
  {
    return givenString2;
  }
  
  String getString()
  {
    return givenString;
  }
  
  color getColor()
  {
    return givenColor;
  }
}
//====================================================================================
//|                                   ***********                                    |
//|                                Transition System                                 |
//|                                   ***********                                    |
//====================================================================================

class transition
{
  
  float pass;
  color givenColor;
  boolean startUp;
  int startUpSpeed;
  boolean resetPossible, addNoMore;
  
  
  transition()
  {
   givenColor = 255; 

   pass = 0;
   startUp = true;
   startUpSpeed=100;
   resetPossible=false;
  }
  
  void run()
  {
    if(pass==0) {transitionSound.rewind();transitionSound.play();}
    
    if (startUp) {pass++;}
      else {pass--;}
    if (pass<3 && !startUp) {runTransition=false; transitionSound.pause();}
    if (pass>startUpSpeed) {startUp=false; transitionSound.rewind(); transitionSound.play();}
    if (pass==2) {resetPossible=true;}
    fill(givenColor, (pass)*(255/startUpSpeed));
    rect(0,0,width,height);
    noFill();
    if (transitionRects.size()<52){transitionRects.add(new transitionRect(givenColor)); }
    for (int i = 0; i< transitionRects.size(); i++)
    {
      if (!startUp) {((transitionRect)transitionRects.get(i)).setOpacity((int)(pass-10)*255/(startUpSpeed));}
      ((transitionRect)transitionRects.get(i)).run();
      
      if (((transitionRect)transitionRects.get(i)).checkLife())
      {
        transitionRects.remove(i);
      }
      
    }
  }
  
  float getPass()
  {
    return pass;
  }
  
  void setColor(color temp)
  {
    givenColor = temp;
  }
  
  void reset()
  {
    if (resetPossible)
    {
      
      pass = 0;
      startUp = true;
      resetPossible=false;
      transitionRects= new ArrayList();
    }
  }
  
  int getSpeed()
  {
    return startUpSpeed;
  }
  
  boolean ifMax()
  {
    return (pass==startUpSpeed);
  }
}
//====================================================================================
//|                                   ***********                                    |
//|                                    ActSystem                                     |
//|                                   ***********                                    |
//====================================================================================

class act
{
  String header, subLine;
  float velocities, location;
  int pass1, pass2;
  float acceleration;
  boolean flicker;
  int actCount;
  
  act(String temp1, String temp2)
  {
    header=temp1;
    subLine=temp2;
    pass1=0;
    pass2=0;
    velocities=44;
    location=0;
    acceleration=1;
    flicker = false;
    actCount = 1;
  }
  
  void run()
  {
    if(actCount == 1) {run1();}
    else if (actCount==2) {run2();}
    else if (actCount==3) {run3();}
    else if (actCount==4) {run4();}
  }
  void run1()
  {
    pass1++;
    if (!flicker) {pass2+=6;}
      else {pass2-=6;}
    if(pass2>160) {flicker=true;}
    if(pass2<30) {flicker=false;}
    if (pass1>110){
      location+=velocities;
      velocities+=acceleration/1.5;

    }
    else if (pass1>40)
    {
      location+=velocities;
      velocities-=acceleration;
      if (velocities<2) {velocities=2;}
    }
    
    if (pass1==155)
    {
      transitionSystem.reset();
      runTransition=true; 
    }
    
    musicPlayer2.setGain(-1.0*(float)(pass1/250.0)*28.0);
    
    if (pass1>250) {if (transitionSystem.ifMax()) {
    run3=false; dorothy.fall(); showUnits=true; run4=true; showHub=true; runDialogue=true; musicPlayer2.rewind(); musicPlayer2.pause();
    }}
    
    
    tint(255,((pass1-50)*(255/20))-100);
    image(actBG,0,0);
    noTint();
    textAlign(CENTER);
    fill(255);
    textFont(actFont1);
    text(header,(-width/2)+location,130);
    textFont(actFont2);
    text(subLine,width*1.5-location,280);
    //================
    tint(255,pass2);
    image(actBG2,width/2-actBG2.width/2,383);
    noTint();
    //====================
    //================
    tint(255,160);
    image(actBG3,0,0);
    noTint();
    //====================
    noFill();
  }
  
  void run2()
  {
    pass1++;
    if (!flicker) {pass2+=6;}
      else {pass2-=6;}
    if(pass2>160) {flicker=true;}
    if(pass2<30) {flicker=false;}
    if (pass1>110){
      location+=velocities;
      velocities+=acceleration/1.5;

    }
    else if (pass1>40)
    {
      location+=velocities;
      velocities-=acceleration;
      if (velocities<2) {velocities=2;}
    }
    
    if (pass1==155)
    {
      transitionSystem.reset();
      runTransition=true; 
    }
    
    musicPlayer3.setGain(-1.0*(float)(pass1/250.0)*28.0);
    
    if (pass1>250) {if (transitionSystem.ifMax()) {
      musicPlayer3.pause();
      musicPlayer3=null;
      run3=false; 
      run5 = false; 
      dorothy.reset();
      dorothy.fall(); 
      showUnits=true; 
      run6=true; 
      squareSystem = new ArrayList();
      dialogueSystem.reset(4); 
      runDialogue=true;}
    }
    
    
    tint(255,((pass1-50)*(255/20))-100);
    image(actBG,0,0);
    noTint();
    textAlign(CENTER);
    fill(255);
    textFont(actFont1);
    text(header,(-width/2)+location,130);
    textFont(actFont2);
    text(subLine,width*1.5-location,280);
    //================
    tint(255,pass2);
    image(actBG2,width/2-actBG2.width/2,383);
    noTint();
    //====================
    //================
    tint(255,160);
    image(actBG3,0,0);
    noTint();
    //====================
    noFill();
  }
  
  void run3()
  {
    pass1++;
    if (!flicker) {pass2+=6;}
      else {pass2-=6;}
    if(pass2>160) {flicker=true;}
    if(pass2<30) {flicker=false;}
    if (pass1>110){
      location+=velocities;
      velocities+=acceleration/1.5;

    }
    else if (pass1>40)
    {
      location+=velocities;
      velocities-=acceleration;
      if (velocities<2) {velocities=2;}
    }
    
    if (pass1==155)
    {
      transitionSystem.reset();
      runTransition=true; 
    }
    
    musicPlayer4.setGain(-1.0*(float)(pass1/250.0)*28.0);
    
    if (pass1>250) {if (transitionSystem.ifMax()) {
      run3=false; 
      run8 = false; 
      dorothy.reset();
      dorothy.fall(); 
      showUnits=true; 
      run9=true; 
      squareSystem = new ArrayList();
      dialogueSystem.reset(7); 
      musicPlayer4.pause();
      musicPlayer4= null;
      }
    }
    
    
    tint(255,((pass1-50)*(255/20))-100);
    image(actBG,0,0);
    noTint();
    textAlign(CENTER);
    fill(255);
    textFont(actFont1);
    text(header,(-width/2)+location,130);
    textFont(actFont2);
    text(subLine,width*1.5-location,280);
    //================
    tint(255,pass2);
    image(actBG2,width/2-actBG2.width/2,383);
    noTint();
    //====================
    //================
    tint(255,160);
    image(actBG3,0,0);
    noTint();
    //====================
    noFill();
  }
  
  void run4()
  {
    pass1++;
    if (!flicker) {pass2+=6;}
      else {pass2-=6;}
    if(pass2>160) {flicker=true;}
    if(pass2<30) {flicker=false;}
    if (pass1>110){
      location+=velocities;
      velocities+=acceleration/1.5;

    }
    else if (pass1>40)
    {
      location+=velocities;
      velocities-=acceleration;
      if (velocities<2) {velocities=2;}
    }
    
    if (pass1==155)
    {
      transitionSystem.reset();
      runTransition=true; 
    }
    
    musicPlayer5.setGain(-1.0*(float)(pass1/250.0)*28.0);
    
    if (pass1>250) {if (transitionSystem.ifMax()) {
      run3=false; 
      run10=false; 
      dorothy.reset();
      dorothy.fall(); 
      showUnits=true; 
      run11=true; 
      squareSystem = new ArrayList();
      dialogueSystem.reset(10); 
      musicPlayer5.pause();
      musicPlayer5 = null;
      }
    }
    
    
    tint(255,((pass1-50)*(255/20))-100);
    image(actBG,0,0);
    noTint();
    textAlign(CENTER);
    fill(255);
    textFont(actFont1);
    text(header,(-width/2)+location,130);
    textFont(actFont2);
    text(subLine,width*1.5-location,280);
    //================
    tint(255,pass2);
    image(actBG2,width/2-actBG2.width/2,383);
    noTint();
    //====================
    //================
    tint(255,160);
    image(actBG3,0,0);
    noTint();
    //====================
    noFill();
  }
  void reset(String temp1, String temp2, int actCountHolder)
  {
    actCount = actCountHolder;
    header=temp1;
    subLine=temp2;
    pass1=0;
    pass2=0;
    velocities=44;
    location=0;
    acceleration=1;
    flicker = false;
  }
  
}

//====================================================================================
//|                                   ***********                                    |
//|                                     Button                                       |
//|                                   ***********                                    |
//====================================================================================

class button
{
  PVector point1;  
  PVector point2;
  boolean hover;
  boolean clicked;
  
  button  (PVector temp1, PVector temp2)
  {
    point1 = temp1;
    point2 = temp2;
    clicked = false;
  }
  
  void run()
  {
    if (seeButtons) {
      rectMode(CORNER);
      fill(255);
      rect(point1.x+3,point1.y+3, point2.x+3-point1.x, point2.y+3-point1.y);
      noFill();
      rectMode(CENTER);
    }
    if (mouseX<point2.x &&  mouseX>point1.x && mouseY>point1.y && mouseY<point2.y)
    {
      mouseCursor.hoverOn();
      hover=true;
      if (mousePressed)
      {
        clicked=true;
      }
      else 
      {
        clicked=false;
      }
    }   
    else{
      hover=false;
    }
  }
  
  boolean getHover()
  {
    return hover;
  }
  
  boolean getClicked()
  {
    return clicked;
  }
}

//====================================================================================
//|                                   ***********                                    |
//|                                    Particles                                     |
//|                                   ***********                                    |
//====================================================================================

ArrayList rainSystem = new ArrayList();

class rainParticle
{
  int locX, locY;
  float velocity;
  
  rainParticle()
  {
    locX= (int)random(115,593);
    locY=220;
    velocity=5;
  }
  
  void run()
  {

    velocity+=.15;
    locY+=velocity;
    fill(255,200-(400-locY));
    rect(locX, locY, random(1,3),8);
    noFill();
  }
  
  boolean checkLife()
  {
    return (locY>height);
  }
  
}

ArrayList scene2System = new ArrayList();

class scene2Particle
{
  int locX, locY;
  float velocity;
  
  scene2Particle()
  {
    locX= (int)random(0,width);
    locY=height+30;
    velocity=(random(6,14));
  }
  
  void run()
  {

    locY-=velocity;
    velocity-=.2;
    //(400-locY))
    tint(200,50);
    int temp = locY-500;
    if (temp<0) {temp=0;}
    if (velocity<0) {tint(200,50-(temp));}
    image(questionMark,locX, locY);
    noTint();
  }
  
  boolean checkLife()
  {
    return (locY>height+100);
  }
  
}

ArrayList scene2System2 = new ArrayList();

class scene2Particle2
{
  int locX, locY;
  float velocity;
  
  scene2Particle2()
  {
    locX= (int)random(0,width);
    locY=-50;
    velocity=(random(3,8));
   
  }
  
  void run()
  {

    locY+=velocity;
    velocity+=.2;

    tint(0,200-(locY-330));
    image(questionMark,locX, locY);
    noTint();
  }
    
  boolean checkLife()
  {
    return (locY>height+100);
  }
  
}



ArrayList scene3System = new ArrayList();


class scene3Particle
{
  int locX, locY;
  float velocity;
  boolean hearty0, hearty, hearty2;
  
  scene3Particle()
  {
    hearty0 = true;
    locX= (int)random(0,width);
    locY=height+30;
    velocity=(random(6,14));
  }
  
  scene3Particle(boolean temp)
  {
    hearty = true;
    locX= (int)random(0,width);
    locY=height+30;
    velocity=(random(6,14));
  }
  
  scene3Particle(boolean temp, boolean temp2)
  {
    hearty2 = true;
    locX= (int)random(0,width);
    locY=height+30;
    velocity=(random(6,14));
  }
  
  void run()
  {

    locY-=velocity;
    velocity-=.2;
    //(400-locY))
    tint(200,50);
    int temp = locY-500;
    if (temp<0) {temp=0;}
    if (velocity<0) {tint(200,50-(temp));}
    if (hearty0)
    {
      image(heart,locX, locY);
    }
    else if (hearty)
    {
      image(upsideHeart,locX, locY);
    }
    else if (hearty2)
    {
      noTint();
      tint(30,50);
      image(heart3,locX, locY);
    }
    noTint();
  }
  
  boolean checkLife()
  {
    return (locY>height+100);
  }
  
}





ArrayList transitionRects = new ArrayList();

class transitionRect
{
  int velocity;
  int locX, locY;
  int boxCount;
  int opacity;
  color givenColor;
  
  transitionRect(color temp)
  {
    givenColor=temp;
    opacity=255;
    boxCount =50;
    locX= (width/boxCount)*(int)random(0,boxCount+2);
    locY=-height*4;
    velocity=(int)(random(15,25));
    if (!transitionRects.isEmpty())
    {
      for(int i2 =0; i2<800; i2++)
      {
         for (int i = 0; i<transitionRects.size(); i++)
         {
         if (locX==((transitionRect)(transitionRects.get(i))).getX())
           {
             locX= (width/boxCount)*(int)random(0,boxCount+2);
           }
         }
      }
       /*
       for (int i = 0; i<transitionRects.size(); i++)
       {
         if (locX==((transitionRect)(transitionRects.get(i))).getX())
         {
           locX= (width/boxCount)*(int)random(0,boxCount);
         }
       }
       for (int i = 0; i<transitionRects.size(); i++)
       {
         if (locX==((transitionRect)(transitionRects.get(i))).getX())
         {
           locX= (width/boxCount)*(int)random(0,boxCount);
         }
       }
       */
    }
  }
  
  void run()
  {
    fill(givenColor,opacity);
    locY+=velocity;
    velocity+=.3;
    rect(locX, locY, width/boxCount, height*4);
    noFill();
  }
  
  boolean checkLife()
  {
    return (locY>height*4);
  }
  
  int getX()
  {
    return locX;
  }
  
  void setOpacity (int temp)
  {
    opacity=temp;
  }
}

ArrayList squareSystem = new ArrayList();

class squareParticle
{
  int locX, locY;
  int velocity;
  int r;
  boolean colorType;
  
  squareParticle()
  {
    locX= (int)random(0,width);
    locY=-100;
    velocity=(int) random(4,11);
    r = (int) random(10,80);
    colorType = ((int)(random(0,2))==1);
  }
  
  void run()
  {
    if (colorType) {fill(245,40);}
      else {fill(0,255);}
    
    rect(locX, locY, r, r);
    noFill();
    locY+=velocity;

  }
  
  boolean checkLife()
  {
    return (locY>height);
  }
  
}

ArrayList fallSystem = new ArrayList();

class fallParticle
{
  int locX;
  int locY;
  int opacity;
  float velocityX, velocityY;
  int r;
  
  fallParticle()
  {
    locX = (int)random(width/2-15,width/2+15);
    locY = (int)random(height/2-5,height/2+15);
    opacity = 190;
    r = (int) random(5,10);
    velocityX = random(-8,8);
    velocityY = random(-3,-8);
  }
  
  void run()
  {
    fill(255,opacity);
    ellipse(locX,locY,r,r);
    noFill();
    locX+=velocityX;
    locY+=velocityY;
    opacity-=10;
  }
  
  boolean checkLife()
  {
    return (opacity<0);
  }
}

  ArrayList heartSystem = new ArrayList();

  class heartParticle
  {
    int locX;
    int locY;
    int opacity;
    float velocityX, velocityY;
    
    heartParticle(int temp1, int temp2)
    {
      locX = temp1;
      locY = temp2;
      opacity = 190;
      velocityX = random(-1,1);
      velocityY = random(2,1);
    }
    
    void run()
    {
      tint(255,opacity);
      image(heartParticleImage, locX,locY);
      noTint();
      locX+=velocityX;
      locY+=velocityY;
      opacity-=10;
    }
    
    boolean checkLife()
    {
      return (opacity<0);
    }
  }
  
  
  ArrayList speedSystem = new ArrayList();

  class speedParticle
  {
    int locX;
    int locY;
    int opacity;
    float velocityX, velocityY;
    int r;
    color particleColor;
    
    speedParticle(int temp1, int temp2)
    {
      locX = temp1;
      locY = temp2;
      opacity = 200;
      velocityX = random(-2,2);
      velocityY = random(-2,2);
      r = (int)random(2,6);
      particleColor = color(120,208,254);
    }
    
    speedParticle(int temp1, int temp2, boolean something)
    {
      locX = temp1;
      locY = temp2;
      opacity = 200;
      velocityX = random(-2,2);
      velocityY = random(-2,2);
      r = (int)random(2,6);
      particleColor = color(255);
    }
    
    void run(int tempX, int tempY)
    {
      fill(particleColor,opacity);
      ellipse(locX,locY,r,r);
      noFill();
      locX+=velocityX+tempX;
      locY+=velocityY+tempY;
      opacity-=4;
    }
    
    boolean checkLife()
    {
      return (opacity<0);
    }
  }
  
  ArrayList scene6System = new ArrayList();

  class scene6Particle
  {
    int locX;
    int locY;
    int opacity;
    float velocityX, velocityY;
    int r;
    color particleColor;
    int speed;
    
    scene6Particle(int temp1, int temp2)
    {
      locX = temp1;
      locY = temp2;
      opacity = 190;
      velocityX = 4;
      r = 4;
      particleColor = color(25,185,201);
    }
    
    void run()
    {
      fill(particleColor,180-(abs((width/2)-locX)/2));
      ellipse(locX,locY,r,r);
      noFill();
      locX+=4;
    }
    
    boolean checkLife()
    {
      return (locX>width+10);
    }
  }

//====================================================================================
//|                                   ***********                                    |
//|                                     Dialogue                                     |
//|                                   ***********                                    |
//====================================================================================


class dialogueSys
{
  ArrayList givenDialogues, activeArray;
  boolean active;
  int runner;
  PImage dialogueBox1, dialogueBox2;
  PImage expressionSprites, expressionSprites2;
  
  int activeArrayCounter;
  
  int letters;
  int lettersCounter;
  int letterSpeed;
  int characters;
  String activeDialogue1, activeDialogue2;
  boolean on;
  int delaytest;
  boolean turnOff;
  
  int expressionPass;
  int expressionPassCounter;
  int expressionSpeed;
  
  int dialogueCounter;
  dialogue dialogueHolder;
  int opacityDiff;
  
  dialogueSys(ArrayList temp)
  {
    givenDialogues = temp;
    active=false;
    runner=0;
    
    letters=0;
    lettersCounter=0;
    letterSpeed = 1;
    characters=0;
    
    
    dialogueCounter = 0;
    activeArrayCounter = 0;
    
    dialogueBox1 = loadImage("dgBox1.png");
    dialogueBox2 = loadImage("dgBox2.png");
    on = false;  
    turnOff =false;
    
    expressionSprites = loadImage("expressionSprites.PNG");
    expressionSprites2 = loadImage("expressionSprites2.png");
    expressionPass = 0;
    expressionPassCounter = 0;
    expressionSpeed = 1;
  }
  
  void reset(int temp)
  {
    runDialogue=true;
    active=false;
    runner=0;
    
    letters=0;
    lettersCounter=0;
    letterSpeed = 1;
    
    dialogueCounter = 0;
    activeArrayCounter = temp;
    characters=0;
    
    on = true;  
    turnOff =false;
    
    opacityDiff = 130;
    
    
    expressionPass = 0;
    expressionPassCounter = 0;
    expressionSpeed = 1;
  }
  
  void run()
  {
    if (!on) {delaytest++;}
    if (delaytest>100) {on=true;}
    if (on) {
    dialogueHolder = (dialogue) (((ArrayList)givenDialogues.get(activeArrayCounter)).get(dialogueCounter));
    int indexTemp = ((String)dialogueHolder.getDialogue()).length();
    for (int i = 0; i< ((String)dialogueHolder.getDialogue()).length(); i++)
    {
      if (((String)dialogueHolder.getDialogue()).charAt(i)=='|')
      {
        indexTemp=i;
      }
    }
    activeDialogue1 = ((String)dialogueHolder.getDialogue()).substring(0,indexTemp);
    activeDialogue2 = ((String)dialogueHolder.getDialogue()).substring(indexTemp, ((String)dialogueHolder.getDialogue()).length());
    characters = dialogueHolder.getCharacterCount();
    
    if(!active)
    {
       runner++;  
       if (characters==1)
       {
         tint (255,runner*2*2.55);
         image(dialogueHolder.getImage1(),0,0);
         image(dialogueBox1,0,0);
         noTint();
         fill(255,runner*2*2.55);
         textFont (dgFont);
         textAlign(CENTER);
         text (dialogueHolder.getName1(),222,422);
         noFill();
       }
       else if (characters==2)
       {
         if (dialogueHolder.getActive()==2)
           {tint(255,runner*2*2.55-opacityDiff);}
         else 
           {tint(255,runner*2*2.55);}
         image(dialogueHolder.getImage1(),0,0);
         noTint();
         if (dialogueHolder.getActive()==2)
           {tint(255,runner*2*2.55);}
         else 
           {tint(255,runner*2*2.55-opacityDiff);}
           
         image(dialogueHolder.getImage2(),0,0);
         noTint();
         tint(255,runner*2*2.55);

         image(dialogueBox2,0,0);
         noTint();
       }
       
       if (runner==50) {active=true;}
    }
    else if(turnOff)
    {
       runner--;  
       if (characters==1)
       {
         tint (255,runner*2*2.55);
         image(dialogueHolder.getImage1(),0,0);
         image(dialogueBox1,0,0);
         noTint();
         fill(255,runner*2*2.55);
         textFont (dgFont);
         textAlign(CENTER);
         text (dialogueHolder.getName1(),222,422);
         noFill();
       }
       else if (characters==2)
       {
         if (dialogueHolder.getActive()==2)
           {tint(255,runner*2*2.55-opacityDiff);}
         else 
           {tint(255,runner*2*2.55);}
         image(dialogueHolder.getImage1(),0,0);
         noTint();
         if (dialogueHolder.getActive()==2)
           {tint(255,runner*2*2.55);}
         else 
           {tint(255,runner*2*2.55-opacityDiff);}
           
         image(dialogueHolder.getImage2(),0,0);
         noTint();
         tint(255,runner*2*2.55);

         image(dialogueBox2,0,0);
         noTint();
         
         fill(255,runner*2*2.55);
         textFont (dgFont);
         textAlign(CENTER);
         text (dialogueHolder.getName1(),222,422);
         text (dialogueHolder.getName2(),840,422);
         noFill();
         
       }
       if (runner==0) {turnOff=false; runDialogue=false;}
    }
    else
    {
      if (characters==1)
      {

         image(dialogueHolder.getImage1(),0,0);
         image(dialogueBox1,0,0);
         if (dialogueHolder.getExpression1()!=0)
         {
           tint(255,400-expressionPass*(400/8));
           image(expressionSprites.get(expressionPass*32,(dialogueHolder.getExpression1()-1)*32,32,32),310,205);
           noTint();

           expressionPassCounter++;
           if (expressionPassCounter>expressionSpeed)
           {
             expressionPassCounter=0;
             expressionPass++;
           }
           if (expressionPass>8) {dialogueHolder.setExpression1(0);}
         }
         textFont(dgFont);
         if (((String)dialogueHolder.getDialogue()).length()-1>letters){lettersCounter++;}
         if (lettersCounter>=letterSpeed) {
           lettersCounter=0; letters++;
           if(letters<activeDialogue1.length()+activeDialogue2.length()-1)
           {
             letters++;
           }
         }

         fill(255,180);
         text (dialogueHolder.getName1(),222,422);
         if (letters<activeDialogue1.length())
         {
           text(activeDialogue1.substring(0,letters),width/2,495);
         }
         else { text(activeDialogue1.substring(0, activeDialogue1.length()),width/2,495);}
         if (letters>activeDialogue1.length())
         {
           text(activeDialogue2.substring(1,letters-activeDialogue1.length()+1),width/2,530);
         }
         noFill();
         
         
         
      }
      
      if (characters==2)
      {
        //copy pasta from above
         if (dialogueHolder.getActive()==2)
         {tint(255,255-opacityDiff);}
         image(dialogueHolder.getImage1(),0,0);
         noTint();
         
         if (dialogueHolder.getActive()==1)
         {tint(255,120);}
         image(dialogueHolder.getImage2(),0,0);
         noTint();
         
         image(dialogueBox2,0,0);
         
         if (dialogueHolder.getExpression1()!=0)
         {
           tint(255,400-expressionPass*(400/8));
           image(expressionSprites.get(expressionPass*32,(dialogueHolder.getExpression1()-1)*32,32,32),310,205);
           noTint();

           expressionPassCounter++;
           if (expressionPassCounter>expressionSpeed)
           {
             expressionPassCounter=0;
             expressionPass++;
           }
           if (expressionPass>8) {dialogueHolder.setExpression1(0);}
         }
         
         if (dialogueHolder.getExpression2()!=0)
         {
           pushMatrix();
             tint(255,400-expressionPass*(400/8));
             image(expressionSprites2.get((8-expressionPass)*32,(dialogueHolder.getExpression2()-1)*32,32,32),710,205);
             noTint();
           popMatrix();
           
           expressionPassCounter++;
           if (expressionPassCounter>expressionSpeed)
           {
             expressionPassCounter=0;
             expressionPass++;
           }
           if (expressionPass>8) {dialogueHolder.setExpression2(0);}
         }
         
         
         textFont(dgFont);
         if (((String)dialogueHolder.getDialogue()).length()-1>letters){lettersCounter++;}
         if (lettersCounter>=letterSpeed) {lettersCounter=0; letters++;}
         fill(255,180);
         
         text (dialogueHolder.getName1(),222,422);
         text (dialogueHolder.getName2(),840,422);
         
         if (letters<activeDialogue1.length())
         {
           text(activeDialogue1.substring(0,letters),width/2,495);
         }
         else { text(activeDialogue1.substring(0, activeDialogue1.length()),width/2,495);}
         if (letters>activeDialogue1.length())
         {
           text(activeDialogue2.substring(1,letters-activeDialogue1.length()+1),width/2,530);
         }
         noFill();
      }
      
      if ((mousePressed || (keyPressed && key==' '))&& dialogueAdvancePossible )
      {
        dialogueAdvancePossible=false;
        if (letters>=activeDialogue1.length())
        {
          if(dialogueCounter==(((ArrayList)givenDialogues.get(activeArrayCounter)).size())-1 && letters>1)
          {
            turnOff = true;
          }
          letters=0;
          lettersCounter=0;
          expressionPass = 0;
          expressionPassCounter = 0;
          if (dialogueCounter<((ArrayList)givenDialogues.get(activeArrayCounter)).size()-1)
          {
            dialogueCounter++;
          }

        }
        else
        {
          letters=activeDialogue1.length()+activeDialogue2.length()-1;
        }
      }
     
    } 
  }
  }
  
  
}

//===================================================

class dialogue
{
  int characters;
  int expression1 , expression2;
  int active;
  String givenString;
  PImage firstImage;
  PImage secondImage;
  String name1, name2;
  
  dialogue(String temp1, PImage temp2, int temp3, String nametemp1)
  {
    characters=1;
    expression1 = temp3;
    active = 1;
    givenString = temp1;
    firstImage = temp2;
    
    name1 = nametemp1;
  }
  // (dg, image, expression, image, expression, active(
  
  dialogue(String temp1, PImage temp2, int temp3, PImage temp4, int temp5, int temp6, String nametemp1, String nametemp2)
  {
    characters=2;
    expression1 = temp3;
    expression2 = temp5;
    active = temp6;
    givenString = temp1;
    firstImage = temp2;
    secondImage = temp4;
    
    name1 = nametemp1;
    name2 = nametemp2;
  }
  
  String getDialogue()
  {
    return givenString;
  }
  
  int getCharacterCount()
  {
    return characters;
  }
  
  PImage getImage1()
  {
    return firstImage;
  }
  
  PImage getImage2()
  {
    return secondImage;
  }
  
  int getExpression1()
  {
    return expression1;
  }
  
  int getExpression2()
  {
    return expression2;
  }
  
  int getActive()
  {
    return active;
  }
  
  String getName1()
  {
    return name1;
  }
  
  String getName2()
  {
    return name2;
  }
  
  void setExpression1(int temp)
  {
    expression1 = temp;
  }
  
  void setExpression2(int temp)
  {
    expression2 = temp;
  }
}

//====================================================================================
//|                                   ***********                                    |
//|                                    Overworld                                     |
//|                                   ***********                                    |
//====================================================================================
class worldUnit
{
  float locX, locY, velocity;
  boolean standing;
  PImage active, spriteImage, shadow;
  int state;
  int pass;
  int runSpeed, runCounter;
  int spriteSize;
  float velocity2, acceleration;
  boolean falling;
  PImage deathSprite;

  int life;
  int lifeRegen;
  int lifeRegenRate;
  float velocityBonus;
  
  float deathVelocityX, deathVelocityY;
  boolean death;
  int deathCounter;
  int deathPass;
  float jumpHeight, jumpVelocityStart, gravity, jumpVelocity;
  
  boolean jumpPossible, jumping;
  
  PImage north1, north2, north3;
  PImage east1, east2, east3;
  PImage south1, south2, south3;
  PImage west1, west2, west3;
  
  worldUnit(PImage temp)
  {
    velocity = 8;
    locX = width/2;
    locY = height/2;
    spriteImage = temp;
    state=3;
    standing = true;
    pass  = 0;
    runCounter = 0;
    runSpeed = 5;
    spriteSize = 50;
    velocity2 = -7;
    acceleration=.55;
    falling =false;
    deathSprite = loadImage("death.PNG");
    life=100;
    shadow = loadImage("shadow.png");
    
    jumpPossible=true;
    jumpVelocityStart = 6;
    gravity = .5;
    
    lifeRegenRate= 5;
    
    //image generation
     north1 = spriteImage.get(0, spriteSize*3, spriteSize, spriteSize);
     north2 = spriteImage.get(spriteSize, spriteSize*3, spriteSize, spriteSize);
     north3 = spriteImage.get(spriteSize*2, spriteSize*3, spriteSize, spriteSize);
     east1 = spriteImage.get(0, spriteSize*2, spriteSize, spriteSize);
     east2 = spriteImage.get(spriteSize, spriteSize*2, spriteSize, spriteSize);
     east3 = spriteImage.get(spriteSize*2, spriteSize*2, spriteSize, spriteSize);
     south1 = spriteImage.get(0, 0, spriteSize, spriteSize);
     south2 = spriteImage.get(spriteSize, 0, spriteSize, spriteSize);
     south3 = spriteImage.get(spriteSize*2, 0, spriteSize, spriteSize);
     west1 = spriteImage.get(0, spriteSize, spriteSize, spriteSize);
     west2 = spriteImage.get(spriteSize, spriteSize, spriteSize, spriteSize);
     west3 = spriteImage.get(spriteSize*2, spriteSize, spriteSize, spriteSize);
  }
  
  void reset()
  {
    velocity = 8;
    locX = width/2;
    locY = height/2;
    state=3;
    standing = true;
    pass  = 0;
    runCounter = 0;
    runSpeed = 5;
    spriteSize = 50;
    velocity2 = -7;
    acceleration=.55;
    falling =false;
    life=100;
  }
  
  void fall()
  {
    falling = true;
  }
  
  void run()
  {
    jumpSystem();
    lifeRegeneration();
    speedSystem();
    heartGenSystem();
    if (falling)
    {

      pass+=velocity2;
      velocity2+=acceleration;
      image(south2, locX-18, locY-30-800+pass);
      if (pass>800) 
      {
        pass=0; 
        falling=false; 
        for (int i = 0; i<45; i++)
        {
          fallSystem.add(new fallParticle());
        }
      }
    }
    else
    {
      fallSystem();
      if(death)
      {
        deathPass++;
        if (deathPass>18) {deathPass=0;}
        locX+=deathVelocityX;
        locY+=deathVelocityY;
        deathCounter++;
        if (deathCounter>51) {death=false; }
        image(deathSprite.get(deathPass*120,0,120,120),locX-60, locY-60);
      }
      else{runWalk();}
    }

  }
  
  void jumpSystem()
  {
    if (jumping)
    {
      jumpHeight-=jumpVelocity;
      jumpVelocity-=gravity;
      if ((int)(random(1,3)) == 2 && jumpVelocity>0 && jumpHeight<-25) {heartSystem.add(new heartParticle((int)(locX-spriteSize/2)+20, (int)(locY-.85*spriteSize+jumpHeight)+30));}
      if (jumpHeight>=0) {jumpHeight=0; jumping = false; jumpPossible=true;}
    }
        //============jump system
    if (keyPressed && key == 'x' && !runDialogue && skill2)
    {
      if (jumpPossible) 
      {
        jumping=true;
        jumpVelocity = jumpVelocityStart;
        jumpPossible=false;
      }
    } 
  }
  
  void runDeath(PVector starttemp, PVector endtemp)
  {
    if (!death) {
      dorothy.loseLife(20);
      if (run7){firstMap.blood();}
      if (run6){secondMap.blood();}
      if (run9) {thirdMap.blood();}
      death=true;
      deathVelocityX = (starttemp.x-endtemp.x)/50;
      deathVelocityY = (starttemp.y-endtemp.y)/50;
      deathCounter=0;
      
      
    }
  }
  
  void lifeRegeneration()
  {
    if (life<100)
    {
      lifeRegen++;
      if (lifeRegen>lifeRegenRate)
      {
        life++;
        lifeRegen=0;
      }
    }
  }
  
  boolean isJumping()
  {
    return jumping;
  }
  
  float getVelocity()
  {
    return velocity;
  }
  
  void heartGenSystem()
  {
     if (!heartSystem.isEmpty())
      {
        for (int i = 0; i< heartSystem.size(); i++)
        {
          ((heartParticle)heartSystem.get(i)).run();
          if (((heartParticle)heartSystem.get(i)).checkLife())
          {
            heartSystem.remove(i);
            i--;
          }
        }
      }
  }
  
  void speedSystem()
  {
    if(velocityBonus>0)
    {
      if((int)random(0,5.1-(velocityBonus/2)) == 0) {
        if (velocityBonus<9.5)
        {
         speedSystem.add(new speedParticle((int)random((locX-spriteSize/2)+17,(locX-spriteSize/2)+42), (int)random((locY-.85*spriteSize+jumpHeight)+24,(locY-.85*spriteSize+jumpHeight)+38)));
         speedSystem.add(new speedParticle((int)random((locX-spriteSize/2)+17,(locX-spriteSize/2)+42), (int)random((locY-.85*spriteSize+jumpHeight)+24,(locY-.85*spriteSize+jumpHeight)+38))); 
        }   
        else
        {
         speedSystem.add(new speedParticle((int)random((locX-spriteSize/2)+17,(locX-spriteSize/2)+42), (int)random((locY-.85*spriteSize+jumpHeight)+24,(locY-.85*spriteSize+jumpHeight)+38),true));
         speedSystem.add(new speedParticle((int)random((locX-spriteSize/2)+17,(locX-spriteSize/2)+42), (int)random((locY-.85*spriteSize+jumpHeight)+24,(locY-.85*spriteSize+jumpHeight)+38), true)); 
        }      
      }
    }
  }
  void fallSystem()
  {
      if (!fallSystem.isEmpty())
      {
        for (int i = 0; i< fallSystem.size(); i++)
        {
          ((fallParticle)fallSystem.get(i)).run();
          if (((fallParticle)fallSystem.get(i)).checkLife())
          {
            fallSystem.remove(i);
            i--;
          }
        }
      }
  }
  void mapCheck()
  {
    locX = width/2;
    locY = height/2;
  }
  
  boolean isStanding()
  {
    return(standing);
  }
  void loseLife(int amountLost)
  {
    life-=amountLost;
    if (life<=0) {exit();}
  }
  
  int getLife()
  {
    return life;
  }
  float getX()
  {
    return locX;
  }
  
  float getY()
  {
    return locY;
  }
  
  void setX(float temp)
  {
    locX = temp;
  }
  
  void setY(float temp)
  {
    locY=temp;
  }
  
  boolean isDead()
  {
    return death;
  }
  void runWalk()
  {
    if(skill1){velocity=1;}
      else {velocity=8;}
      state=direction;
      standing = !moving;
      
      runCounter++;
      if (runCounter == runSpeed)
      {
        runCounter=0;
        pass++;
      }

      if (standing)
      {
        if (velocityBonus>0 && skill3) 
        {
          velocityBonus-=2;
          if (velocityBonus<0) {velocityBonus=0;}
        }
        pass = 1;
        switch(state)
          {
            case 1: 
              active =north2;
              break;
            case 2: 
              active = east2;
              break;
            case 3: 
              active = south2;
              break;
            case 4: 
              active = west2;
              break;  
          }
      }
      else {
        if (velocityBonus<10  && skill3)
        {
          velocityBonus+=.12;
        }
        switch(state)
          {

            case 1: 
              locY-=(velocity+velocityBonus);
              switch(pass){
                case 0:
                  active = north1; break;
                case 1:
                  active = north2; break;
                case 2:
                  active = north3; break;
              }
            break;
            case 2: 
              locX+=(velocity+velocityBonus);
              switch(pass){
                case 0:
                  active = east1; break;
                case 1:
                  active = east2; break;
                case 2:
                  active = east3; break;}
              break;
            case 3: 
              locY+=(velocity+velocityBonus);
              switch(pass){
                case 0:
                  active = south1; break;
                case 1:
                  active = south2; break;
                case 2:
                  active = south3; break;}
              break;
            case 4: 
              locX-=(velocity+velocityBonus);
              switch(pass){
                case 0:
                  active = west1; break;
                case 1:
                  active = west2; break;
                case 2:
                  active = west3; break;}
              break;  
          }
      }
      
      if (pass==2)
      {
        pass=0;
      }
      pushMatrix();
        imageMode(CENTER);
        translate(locX, locY);
        scale((102+jumpHeight)/102);
        
        image(shadow, 0,0);
        imageMode(CORNER);
        popMatrix();
      image(active, locX-spriteSize/2, locY-.85*spriteSize+jumpHeight);
  }
}
//====================================================================================
//|                                   ***********                                    |
//|                                      misc                                        |
//|                                   ***********                                    |
//====================================================================================

class hub
{
  int pass1, pass2;
  PImage hub1, hub2, hub3, hub4, lifeBar;
  int delayTime, speed,delay1, delay2;
  boolean glow;
  int life;
  float lifeCounter;
  int lifeRegen, lifeRegenRate;
  ArrayList lifeBarLevels;
  
  hub()
  {
    hub1 = loadImage("hub1.png");
    hub2 = loadImage("hub2.png");
    hub3 = loadImage("hub3.png");
    hub4 = loadImage("hub4.png");
    lifeBar = loadImage("lifeBar.PNG");
    delayTime=0;
    speed=4;
    delay1 =100;
    delay2 =200;
    glow = true;
    pass1=100;
    lifeCounter=100;
    lifeRegenRate=5;
    lifeBarLevels = new ArrayList();
    
    for (int i=0; i<101; i++)
    {
      lifeBarLevels.add(lifeBar.get(0,0, (int)((float)lifeBar.width*((float)i/100.0)), lifeBar.height));
    }
  }
  
  void run()
  {
    pass2+=2;

    if (pass2<height/4+delay1) {image(hub2,0,-height/4-delay1+pass2); image(hub3,0,-height/4-delay1+pass2); image(hub4,0,-height/4-delay1+pass2);}
    else 
    {
      image(hub2,0,0);
      
      image((PImage)(lifeBarLevels.get((int)lifeCounter)),533,42);
      if (lifeCounter<dorothy.getLife())
      {
        lifeCounter++;
      }
      else if (lifeCounter>dorothy.getLife())
      {
        lifeCounter--;
      }

      image(hub4,0,0);
      if (pass1>=80) {glow=false;}
      else if (pass1<=10) {glow=true;}

    }
    if (pass2<height/4) {image(hub1,0,-height/4+pass2);}
      else {image(hub1,0,0);}
      

  }
  
  
}

//====================================================================================
//|                                   ***********                                    |
//|                                      Map1                                        |
//|                                   ***********                                    |
//====================================================================================

class map1
{
  float locX, locY, locX2, locY2;
  int offsetX, offsetY;
  PImage theMap, theMapOverlay, overlayHolder, mapHolder, collisionMap1, collisionMap2, collisionMap, collisionMap1Holder, skill1Image, skill1Map, bloodImage;
  platform p1;
  PImage crowSprite;
  int pass;
  boolean goingUp;
  float savedlocX,savedlocY;
  int skill1Counter;
  int invulnPass;
  ArrayList platformHolder;
  boolean done;
  boolean bgmBoolean;
  
  int skill1Opacity;
  
  boolean bloodOn;
  int bloodCounter;
  
  int crowOpacity;

  
  map1()
  {
    
    crowOpacity = 50;
    platformHolder = new ArrayList();
    
    platformHolder.add (new platform(width/2,2590, 800, 2));
    platformHolder.add (new platform(width/2,2658, 600, 3));
    platformHolder.add (new platform(width/2,2726, 1000, 6));
    platformHolder.add (new platform(width/2,2794, 300, 2));
    platformHolder.add (new platform(width/2,2794+68, 400, 1));
    
    locX=0;
    locY=0;
    theMap = loadImage("map1.png");
    skill1Image = loadImage("skill1.png");
    skill1Map = loadImage("map1_2.png");
    theMapOverlay = loadImage("map1Overlay.png");
    goingUp = true;
    crowSprite = (loadImage("crowSprite.png")).get(50,100,50,50);
    
    //generatecollisionMap
    collisionMap1 = loadImage("map1_collision.png");
    collisionMap2 = loadImage("map1_collision2.png");
    
    skill1ButtonImage = loadImage("skill1Button.png");
    
    bloodImage = loadImage("blood.PNG");
    bloodOn = false;
    
    
  }
  
  boolean isDone()
  {
    return done;
  }
  
  void run()
  {
    
    if (!bgmBoolean) {bgmBoolean=true; BGM1.loop();}
    //===
    
    //===
    if (skill1 && skill1Counter<50)
    {
      skill1Counter++;
    }
    else if(!skill1 && skill1Counter>0)
    {
      skill1Counter-=2;
    }
    
    if ((int)(random(0,6))==5) {squareSystem.add(new squareParticle());}
      for (int i = 0; i< squareSystem.size(); i++)
      {
        ((squareParticle)squareSystem.get(i)).run();
        if (((squareParticle)squareSystem.get(i)).checkLife())
        {
          squareSystem.remove(i);
          i--;
        }
      }
    
    if (goingUp) {pass++;}
      else {pass--;}
      
    if(pass>100) {goingUp = false;}
      else if (pass<0) {goingUp = true;}
      
    image(theMap,locX,locY);
    triggerSystem();
    //===New sight
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Map,locX, locY);
      noTint();
    }
    
    //====
    
    tint(255,pass*2.55);
    image(theMapOverlay, locX, locY);
    noTint();
    
    //==Overlay
    
    //check
   println("LocX: " + locX);
   println("LocY: " + locY);
    
    //===New sight
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Image,0, 0);
      noTint();
    }
    
    //====
    
    //platforms
    for (int i=0; i<platformHolder.size(); i++)
    {
      ((platform)platformHolder.get(i)).run((int)locX, (int)locY, skill1Counter);
    }
    
    collisionCheck();
    locX+= (float)width/2 - dorothy.getX();
    locY+= (float)height/2 - dorothy.getY();
    
    collisionCheck();
    
    skill1Button();
    runBlood();
    //test
        
    dorothy.mapCheck();
  }
  
  void skill1Button()
  {
    if (m1Trigger3)
    {
      if (skill1Opacity<50) {skill1Opacity++; tint(255,skill1Opacity*2*2.55);
      image(skill1ButtonImage,0,0);
      noTint();}
      else
      {image(skill1ButtonImage,0,0);}
    }
  }
  
  void runBlood()
  {
    if (bloodOn)
    {
      bloodCounter+=2;
    }
    else if (bloodCounter>0 )
    {
      bloodCounter--;
    }
    
    if (bloodCounter>0)
    {
      tint(255,bloodCounter*4*2.55);
      image(bloodImage,0,0);
      noTint();
    }
    
    if (bloodCounter>25)
    {
      bloodOn=false;
    }
  }
  
  void blood()
  {
    bloodOn=true;
  }

  
  
  
  void collisionCheck()
  {
      
    boolean tempPlat = false;
  
    for (int i=0; i<platformHolder.size(); i++)
    {
      if(((platform)platformHolder.get(i)).checkOn())
      {
        tempPlat = true;
      }
    }
    if (!dorothy.isDead()){
      if ((alpha(collisionMap.get((int)(width/2-locX), (int)(height/2-locY))))<40 && !tempPlat && !dorothy.isJumping())
      {
        locX = savedlocX;
        locY = savedlocY;
      }
      else
      {
         savedlocX = locX;
         savedlocY = locY;
      }
      if ((alpha(collisionMap.get(width/2-(int)locX, height/2-(int)locY)))<40 && !tempPlat && !dorothy.isJumping() && !invulnerable)
      {
        dorothy.runDeath(new PVector((int)locX,(int)locY), new PVector (0,(int)(-2550+height/2)));
      }
  }
  }
  
  void triggerSystem()
  {
    if (triggerCheck(new PVector (-756,-1144), new PVector(-944, -1176)) && !m1Trigger1)
    {
      dialogueSystem.reset(1);
      m1Trigger1 = true;
      //rundialogue
    }
    if (m1Trigger1)
    {
      if(m1Trigger3)
      {
        if (crowOpacity>0)
        {
          crowOpacity--;
          tint(255,crowOpacity*2*2.55);
        }
      }
      if (crowOpacity>0) {image(crowSprite,locX+width/2-52,locY+height/2+1118);}
      noTint();
      collisionMap = collisionMap2;
    }
    else
    {
      collisionMap = collisionMap1;
    }
    //location triggers
    if (triggerCheck( new PVector (78, -1120),new PVector (-16, -1216)) && !m1Trigger2 && m1Trigger1)
    {
      m1Trigger2 = true;
      dialogueSystem.reset(2);
    }
    if (triggerCheck( new PVector (25, -2633),new PVector (-30, -2649)) && !m1Trigger4 )
    {
      success.rewind();
      success.play();
      m1Trigger4 = true;
      dialogueSystem.reset(3);
    }
    if (m1Trigger4 && !runDialogue && !m1Trigger5)
    {  
      m1Trigger5 = true; 
      transitionSystem.reset();
      runTransition = true; 
    }
    if (m1Trigger5) {BGM1.setGain(((float)(transitionSystem.getPass())/(float)(transitionSystem.getSpeed()))*(28.0)*(-1.0));}
    if (m1Trigger5 && transitionSystem.getPass()==transitionSystem.getSpeed())
    {
      stringer2 = new fadeText(scene3Text, 1);
      showUnits = false;
      showHub = false;
      background(0);
      run7 = false;
      run5 = true;
      cutsceneSystem.reset();
      runDialogue=false;
      BGM1.pause();
      BGM1=null;
    }
    //
    if (m1Trigger2 && !runDialogue && !m1Trigger3)
    {
      m1Trigger3 = true;
    }
  }
    

  
  boolean triggerCheck(PVector upperbound, PVector lowerbound)
  {
    return (locX<upperbound.x+1 && locX>lowerbound.x-1 && locY<upperbound.y+1 && locY>lowerbound.y-1);
  }
}

//====================================================================================
//|                                   ***********                                    |
//|                                      Map2                                        |
//|                                   ***********                                    |
//====================================================================================

class map2
{
  float locX, locY, locX2, locY2;
  int offsetX, offsetY;
  PImage theMap, theMapOverlay, overlayHolder, mapHolder, collisionMap1, collisionMap2, collisionMap, collisionMap1Holder, skill1Image, skill1Map, bloodImage;
  PImage tinSprite;
  int pass;
  boolean goingUp;
  float savedlocX,savedlocY;
  int skill1Counter;
  int invulnPass;
  ArrayList platformHolder;
  int respawnVal;
  
  int skill2Opacity;
  
  boolean bloodOn;
  int bloodCounter;

  int tinOpacity;
  boolean tempPlat;
  PVector respawnUp, respawnDown;
  float collisionAlphaVal;
  boolean bgmBoolean;
  
  map2()
  {
    //m1Trigger3 = true;
    tinOpacity = 50;
    platformHolder = new ArrayList();
    
    //852
    platformHolder.add (new platform(width/2+950,height/2+852, 500, 2));
    platformHolder.add (new platform(width/2+2245,height/2+1040, 250, 5));
    platformHolder.add (new platform(width/2+2245,height/2+1240, 500, 2));
    platformHolder.add (new platform(width/2+2245,height/2+1400, 400, 3));
    
    locX=0;
    locY=0;
    theMap = loadImage("map2.png");
    skill1Image = loadImage("skill1.png");
    skill1Map = loadImage("map2_2.png");
    theMapOverlay = loadImage("map2Overlay.png");
    goingUp = true;
    tinSprite = (loadImage("tinSprite.png")).get(50,0,50,50);
    
    //generatecollisionMap
    collisionMap1 = loadImage("map2_collision.png");
    collisionMap2 = loadImage("map2_collision2.png");
    
    collisionMap = collisionMap1;
    
    skill2ButtonImage = loadImage("skill2Button.png");
    skill1ButtonImage = loadImage("skill1Button.png");
    
    bloodImage = loadImage("blood.PNG");
    bloodOn = false;
    respawnUp = new PVector((int)locX,(int)locY);
    respawnDown =  new PVector (-1053,0);
  }
  
  void run()
  {
    if (!bgmBoolean) {bgmBoolean=true; BGM2.loop();}
    
    if (!m1Trigger3) {m1Trigger3=true;}
    //===
    
    //===
    if (skill1 && skill1Counter<50)
    {
      skill1Counter++;
    }
    else if(!skill1 && skill1Counter>0)
    {
      skill1Counter-=2;
    }
    
    if ((int)(random(0,6))==5) {squareSystem.add(new squareParticle());}
    
      for (int i = 0; i< squareSystem.size(); i++)
      {
        ((squareParticle)squareSystem.get(i)).run();
        if (((squareParticle)squareSystem.get(i)).checkLife())
        {
          squareSystem.remove(i);
          i--;
        }
      }
    
    if (goingUp) {pass++;}
      else {pass--;}
      
    if(pass>100) {goingUp = false;}
      else if (pass<0) {goingUp = true;}
      
    
    
    //===New sight
    
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Map,locX, locY);
      noTint();
    }
    
    image(theMap,locX,locY);
    showTin();
    //====
    
    tint(255,pass*2.55);
    image(theMapOverlay, locX, locY);
    noTint();
    
    //==Overlay
    
    //check
    println("LocX: " + locX);
    //println("LocY: " + locY);
    
    //===New sight
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Image,0, 0);
      noTint();
    }
    
    triggerSystem();
    //====
    
    //platforms
    for (int i=0; i<platformHolder.size(); i++)
    {
      ((platform)platformHolder.get(i)).run((int)locX, (int)locY, skill1Counter);
    }
    
    collisionCheck();
    locX+= (float)width/2 - dorothy.getX();
    locY+= (float)height/2 - dorothy.getY();
    
    collisionCheck();
    
    skill1Button();
    runBlood();   
    dorothy.mapCheck();
  }
  
  void skill1Button()
  {
    image(skill1ButtonImage,0,0);
  }
  
  void runBlood()
  {
    if (bloodOn)
    {
      bloodCounter+=2;
    }
    else if (bloodCounter>0 )
    {
      bloodCounter--;
    }
    
    if (bloodCounter>0)
    {
      tint(255,bloodCounter*4*2.55);
      image(bloodImage,0,0);
      noTint();
    }
    
    if (bloodCounter>25)
    {
      bloodOn=false;
    }
  }
  
  void blood()
  {
    bloodOn=true;
  }

  
  
  
  void collisionCheck()
  {
      
    tempPlat = false;
  
    for (int i=0; i<platformHolder.size(); i++)
    {
      if(((platform)platformHolder.get(i)).checkOn())
      {
        tempPlat = true;
      }
    }
    
    if (!dorothy.isDead()){
      if ((alpha(collisionMap.get((int)(width/2-locX), (int)(height/2-locY))))<40 && !tempPlat && !dorothy.isJumping())
      {
        locX = savedlocX;
        locY = savedlocY;
      }
      else
      {
         savedlocX = locX;
         savedlocY = locY;
      }
      if ((alpha(collisionMap.get(width/2-(int)locX, height/2-(int)locY)))<40 && !tempPlat && !dorothy.isJumping()&& !invulnerable)
      {
        dorothy.runDeath(new PVector((int)locX,(int)locY), respawnDown);
      }
    }
  }
  
  void triggerSystem()
  {
    //repspawn changers
    if (triggerCheck(new PVector (-1757,-187), new PVector(-1916, -267)) && !m2Trigger1)
    {
      m2Trigger1 = true;
      respawnDown = new PVector(-1844,-235);
    }
    if (triggerCheck(new PVector (-2250,-860), new PVector(-2315, -931)) && !m2Trigger2)
    {
      m2Trigger2 = true;
      respawnDown = new PVector(-2282.5,-906.96);
    }
    
    if (triggerCheck(new PVector (-2773,-294), new PVector(-2884, -438)) && !m2Trigger3)
    {
      m2Trigger3 = true;
      respawnDown = new PVector(-2828,-371);
    }
    
    if (triggerCheck(new PVector (-2254,-1642), new PVector(-2318, -1778)) && !m2Trigger4)
    {
      m2Trigger4 = true;
      respawnDown = new PVector(-2286,-1714);
    }
   //===================
   if (triggerCheck(new PVector (-946.399,107.5), new PVector(-1170.15, 14)) && !m2Trigger5)
   {
     m2Trigger5 = true;
     dialogueSystem.reset(5);
   }
   if (m2Trigger5 && !m2Trigger6 && !runDialogue)
   {
     m2Trigger6 = true;
     skill2 = true;
   }
   if (m2Trigger6)
   {
     if (tinOpacity>0) {tinOpacity--;}
     if (skill2Opacity<50) {skill2Opacity++; tint(255,skill2Opacity*2*2.55);
     image(skill2ButtonImage,0,0);
     noTint();}
     else    
     {image(skill2ButtonImage,0,0);}
   }  
   if (triggerCheck(new PVector (-1360,-1688), new PVector(-1472, -1720)) && !m2Trigger8)
   {
     m2Trigger8 = true;
     dialogueSystem.reset(6);
     success.rewind();
      success.play();
   }
   if (m2Trigger8 && !m2Trigger9 && !runDialogue)
   {
     m2Trigger9 = true;
     transitionSystem.reset();
     runTransition = true;
   }
   if (m2Trigger9) {BGM2.setGain(((float)(transitionSystem.getPass())/(float)(transitionSystem.getSpeed()))*(28.0)*(-1.0));}
   if (m2Trigger9 && transitionSystem.getPass()==transitionSystem.getSpeed())
   {
     run6 = false;
     stringer3 = new fadeText(scene4Text, 2);
      showUnits = false;
      showHub = false;
      background(0);
      runDialogue = false;
      run8 = true;
      cutsceneSystem.reset();
      BGM2.pause();
      BGM2=null;
   }
  }
    

  
  boolean triggerCheck(PVector upperbound, PVector lowerbound)
  {
    return (locX<upperbound.x+1 && locX>lowerbound.x-1 && locY<upperbound.y+1 && locY>lowerbound.y-1);
  }
  
  void showTin()
  {
    if (tinOpacity>0)
    {
      tint(255, tinOpacity*2*2.55);
      image(tinSprite,locX+width/2+1030,locY+height/2-140);
      noTint();
    }
  }
}

//================Platform

class platform
{

  int locX, locY;
  int locXOffset, locYOffset;
  int distance, distanceCounter, directionDeterminate;
  boolean direction;
  int velocity;
  boolean switching;

  
  platform(int temp1, int temp2, int tempdist, int tempvelocity)
  {

    locXOffset = temp1;
    locYOffset = temp2;
    distance = tempdist;
    velocity = tempvelocity;
   
  }
  
  void run(int temp1, int temp2, int temp3)
  {
    locX+=(temp1-locX)+locXOffset;
    locY+=(temp2-locY)+locYOffset;

    
    if (distanceCounter>distance/2)
    {
      direction = false;
      //dorothy.setX(dorothy.getX()-100);
    }
    else if (distanceCounter<(-distance/2))
    {
      direction = true;
      //dorothy.setX(dorothy.getX()+100);
    }
    
    if (!direction)
    {
      locXOffset-=velocity;
      distanceCounter-=velocity;
    }
    else 
    {
      locXOffset+=velocity;
      distanceCounter+=velocity;
    }
    
    if (checkOn() && !dorothy.isDead() && !dorothy.isJumping())
    {
      if(direction) {
        dorothy.setX(dorothy.getX()+velocity);
      }
      else {
        dorothy.setX(dorothy.getX()-velocity);
        //if (!checkOn()) {dorothy.setX(dorothy.getX()+velocity*4);}
      }
    }
    tint(255, temp3*2*2.55);
    image(platformImage,locX-71,locY-96);
    noTint();
  }
  
  boolean checkOn()
  {
    if (locX>360 && locX<515 && locY<305 && locY>230)
    {
     return true;
    }
    else {return false;}
  }
  
  int getVelocity()
  {
    return velocity;
  }
  
  int getDirection()
  {
    if (direction)
    {
      return 1;
    }
    else {return -1;}
  }
  
  boolean isSwitching()
  {
    return switching;
  }
  
}

//====================================================================================
//|                                   ***********                                    |
//|                                      Map3                                      |
//|                                   ***********                                    |
//====================================================================================

class map3
{
  float locX, locY, locX2, locY2;
  int offsetX, offsetY;
  PImage theMap, theMapOverlay, overlayHolder, mapHolder, collisionMap1, collisionMap2, collisionMap, collisionMap1Holder, skill1Image, skill1Map, bloodImage;
  PImage tinSprite;
  int pass;
  boolean goingUp;
  float savedlocX,savedlocY;
  int skill1Counter;
  int invulnPass;
  ArrayList platformHolder;
  int respawnVal;
  
  int skill2Opacity;
  
  boolean bloodOn;
  int bloodCounter;
  
  PImage tempMap;
  
  int tinOpacity;
  
  PVector respawnUp, respawnDown;
  
  boolean bgmBoolean;
  
  map3()
  {
    //m1Trigger3 = true;
    tinOpacity = 50;
    platformHolder = new ArrayList();
    
    
    platformHolder.add (new platform(width/2+1240,height/2+300, 300, 2));
    platformHolder.add (new platform(width/2+1300,height/2+150, 200, 4));
    platformHolder.add (new platform(width/2+1240,height/2, 600, 3));

    //platformHolder.add (new platform(width/2+2245,height/2+1040, 250, 8));
    //platformHolder.add (new platform(width/2+2245,height/2+1240, 500, 4));
    //platformHolder.add (new platform(width/2+2245,height/2+1400, 400, 5));
   
    
    locX=0;
    locY=0;
    theMap = loadImage("map3.png");
    skill1Image = loadImage("skill1.png");
    skill1Map = loadImage("map3_2.png");
    theMapOverlay = loadImage("map3Overlay.png");
    goingUp = true;
    tinSprite = (loadImage("leoSprite.png")).get(50,0,50,50);
    
    //generatecollisionMap
    collisionMap1 = loadImage("map3_collision.png");
    collisionMap2 = loadImage("map3_collision.png");
    
    collisionMap = collisionMap1;
    

    
    bloodImage = loadImage("blood.PNG");
    bloodOn = false;
    respawnUp = new PVector((int)locX,(int)locY);
    respawnDown =  new PVector (-30,0);
  }
  
  void run()
  {
    if (!m1Trigger3) {m1Trigger3=true;}
    //===
    if (!bgmBoolean) {bgmBoolean=true; BGM3.loop();}
    //===
    if (skill1 && skill1Counter<50)
    {
      skill1Counter++;
    }
    else if(!skill1 && skill1Counter>0)
    {
      skill1Counter-=2;
    }
    
    if ((int)(random(0,6))==5) {squareSystem.add(new squareParticle());}
    
      for (int i = 0; i< squareSystem.size(); i++)
      {
        ((squareParticle)squareSystem.get(i)).run();
        if (((squareParticle)squareSystem.get(i)).checkLife())
        {
          squareSystem.remove(i);
          i--;
        }
      }
    
    if (goingUp) {pass++;}
      else {pass--;}
      
    if(pass>100) {goingUp = false;}
      else if (pass<0) {goingUp = true;}
      
    
    
    //===New sight
    
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Map,locX, locY);
      noTint();
    }
    
    
    image(theMap,locX,locY);
    //====
    showTin();
    tint(255,pass*2.55);
    image(theMapOverlay, locX, locY);
    noTint();
    
    //==Overlay
    
    //check
    println("LocX: " + locX);
    println("LocY: " + locY);
    
    //===New sight
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Image,0, 0);
      noTint();
    }
    
    triggerSystem();
    //====
    
    //platforms
    for (int i=0; i<platformHolder.size(); i++)
    {
      ((platform)platformHolder.get(i)).run((int)locX, (int)locY, skill1Counter);
    }
    
    collisionCheck();
    locX+= (float)width/2 - dorothy.getX();
    locY+= (float)height/2 - dorothy.getY();
    
    collisionCheck();
    speedRunner();
    skill1Button();
    runBlood();   
    dorothy.mapCheck();
  }
  
  void skill1Button()
  {
    image(skill1ButtonImage,0,0);
    image(skill2ButtonImage,0,0);
  }
  
  void runBlood()
  {
    if (bloodOn)
    {
      bloodCounter+=2;
    }
    else if (bloodCounter>0 )
    {
      bloodCounter--;
    }
    
    if (bloodCounter>0)
    {
      tint(255,bloodCounter*4*2.55);
      image(bloodImage,0,0);
      noTint();
    }
    
    if (bloodCounter>25)
    {
      bloodOn=false;
    }
  }
  
  void blood()
  {
    bloodOn=true;
  }

  
  
  
  void collisionCheck()
  {
      
    boolean tempPlat = false;
  
    for (int i=0; i<platformHolder.size(); i++)
    {
      if(((platform)platformHolder.get(i)).checkOn())
      {
        tempPlat = true;
      }
    }
    
    if (!dorothy.isDead()){
      if ((alpha(collisionMap.get((int)(width/2-locX), (int)(height/2-locY))))<40 && !tempPlat && !dorothy.isJumping())
      {
        locX = savedlocX;
        locY = savedlocY;
      }
      else
      {
         savedlocX = locX;
         savedlocY = locY;
      }
      if ((alpha(collisionMap.get(width/2-(int)locX, height/2-(int)locY)))<40 && !tempPlat && !dorothy.isJumping() && !invulnerable)
      {
        dorothy.runDeath(new PVector((int)locX,(int)locY), respawnDown);
      }
    }
  }
  
  void triggerSystem()
  {
    if (triggerCheck(new PVector (24.5,-487.36), new PVector(-66, -707)) && !m3Trigger1)
    {
      m3Trigger1 = true;
      respawnDown = new PVector(-20,-810);
    }
    if (triggerCheck(new PVector (14,-1642), new PVector(-46, -1719)) && !m3Trigger2)
    {
      m3Trigger2 = true;
      respawnDown = new PVector(-16,-1809);
    }
    if (triggerCheck(new PVector (-1497,-1680), new PVector(-1961, -1918)) && !m3Trigger3)
    {
      m3Trigger3 = true;
      respawnDown = new PVector(-1730,-1730);
    }
    if (triggerCheck(new PVector (-1131,-500), new PVector(-1801, -576)) && !m3Trigger4)
    {
      m3Trigger4 = true;
      respawnDown = new PVector(-1219,-544);
    }
    //leo
    if (triggerCheck(new PVector (15,-760), new PVector(-60, -840)) && !m3Trigger5)
    {
      m3Trigger5 = true;
      dialogueSystem.reset(8);
            success.rewind();
      success.play();
    }
    if (m3Trigger5 && !m3Trigger6 && !runDialogue)
    {
       m3Trigger6 = true;
       skill3 = true;
    }
    if(m3Trigger6)
    {
     if (tinOpacity>0) {tinOpacity--;}
     if (skill2Opacity<50) {skill2Opacity++; tint(255,skill2Opacity*2*2.55);
     image(skill3ButtonImage,0,0);
     noTint();}
     else    
     {image(skill3ButtonImage,0,0);}
   } 
   if (triggerCheck(new PVector (-2663,-1195), new PVector(-2750, -1275)) && !m3Trigger7)
   {
     m3Trigger7 = true;
     dialogueSystem.reset(9);
           success.rewind();
      success.play();
   }
   if (m3Trigger7 && !runDialogue && !m3Trigger8)
   {
     m3Trigger8 = true;
     transitionSystem.reset();
     runTransition = true;
   }
   if (m3Trigger8) {BGM3.setGain(((float)(transitionSystem.getPass())/(float)(transitionSystem.getSpeed()))*(28.0)*(-1.0));}
   if (m3Trigger8 && transitionSystem.getPass()==transitionSystem.getSpeed())
   {
      run9 = false;
      stringer4 = new fadeText(scene5Text, 3);
      showUnits = false;
      showHub = false;
      background(255);
      runDialogue = false;
      run10 = true;
      cutsceneSystem.reset();
      BGM3.pause();
      BGM3=null;
   }

 
  }
    

  
  boolean triggerCheck(PVector upperbound, PVector lowerbound)
  {
    return (locX<upperbound.x+1 && locX>lowerbound.x-1 && locY<upperbound.y+1 && locY>lowerbound.y-1);
  }
  
  void showTin()
  {
    if (tinOpacity>0)
    {
      tint(255, tinOpacity*2*2.55);
      image(tinSprite,locX+width/2-5,locY+height/2+765);
      noTint();
    }
  }
  
  void speedRunner()
  {
      if (!speedSystem.isEmpty())
      {
        for (int i = 0; i< speedSystem.size(); i++)
        {
          ((speedParticle)speedSystem.get(i)).run((int)(width/2 - dorothy.getX()),(int)(height/2 - dorothy.getY()));
          if (((speedParticle)speedSystem.get(i)).checkLife())
          {
            speedSystem.remove(i);
            i--;
          }
        }
      }
  }
}


//====================================================================================
//|                                   ***********                                    |
//|                                      Map4                                      |
//|                                   ***********                                    |
//====================================================================================

class map4
{
  float locX, locY, locX2, locY2;
  int offsetX, offsetY;
  PImage theMap, theMapOverlay, overlayHolder, mapHolder, collisionMap1, collisionMap2, collisionMap, collisionMap1Holder, skill1Image, skill1Map, bloodImage;
  PImage tinSprite;
  int pass;
  boolean goingUp;
  float savedlocX,savedlocY;
  int skill1Counter;
  int invulnPass;
  ArrayList platformHolder;
  int respawnVal;
  
  int skill2Opacity;
  
  boolean bloodOn;
  int bloodCounter;
    
  int tinOpacity;
  boolean bgmBoolean;
  PVector respawnUp, respawnDown;
  
  map4()
  {
    tinOpacity = 50;
    platformHolder = new ArrayList();

    platformHolder.add (new platform(width/2+1003,height/2+1620, 200, 1));
    platformHolder.add (new platform(width/2+1003,height/2+1450, 320, 2));

    platformHolder.add (new platform(width/2+1003,height/2+1010, 170, 3));
    platformHolder.add (new platform(width/2+1003,height/2+840, 400, 3));

    platformHolder.add (new platform(width/2+1003,height/2+490, 520, 2));
    platformHolder.add (new platform(width/2+1003,height/2+320, 340, 3));
    
    locX=0;
    locY=0;
    theMap = loadImage("map4.png");
    skill1Image = loadImage("skill1.png");
    skill1Map = loadImage("map4_2.png");
    theMapOverlay = loadImage("map4Overlay.png");
    goingUp = true;
    tinSprite = loadImage("leoSprite.png");
    
    //generatecollisionMap
    collisionMap1 = loadImage("map4_collision.png");
    
    collisionMap = collisionMap1;
    

    
    bloodImage = loadImage("blood.PNG");
    bloodOn = false;
    respawnUp = new PVector((int)locX,(int)locY);
    respawnDown =  new PVector (33,-8.27);
  }
  
  void run()
  {
    if (!bgmBoolean) {bgmBoolean=true; BGM4.loop();}
    if (!m1Trigger3) {m1Trigger3=true;}

    if (skill1 && skill1Counter<50)
    {
      skill1Counter++;
    }
    else if(!skill1 && skill1Counter>0)
    {
      skill1Counter-=2;
    }
    
    if ((int)(random(0,6))==5) {squareSystem.add(new squareParticle());}
    
      for (int i = 0; i< squareSystem.size(); i++)
      {
        ((squareParticle)squareSystem.get(i)).run();
        if (((squareParticle)squareSystem.get(i)).checkLife())
        {
          squareSystem.remove(i);
          i--;
        }
      }
    
    if (goingUp) {pass++;}
      else {pass--;}
      
    if(pass>100) {goingUp = false;}
      else if (pass<0) {goingUp = true;}
      
    
    
    //===New sight
    
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Map,locX, locY);
      noTint();
    }
    
    
    image(theMap,locX,locY);
    //====
    showTin();
    tint(255,pass*2.55);
    image(theMapOverlay, locX, locY);
    noTint();
    
    //==Overlay
    
    //check
    println("LocX: " + locX);
    println("LocY: " + locY);
    
    //===New sight
    if (skill1Counter>0)
    {
      tint(255,skill1Counter*2.55*2);
      image(skill1Image,0, 0);
      noTint();
    }
    
    triggerSystem();
    //====
    
    //platforms
    for (int i=0; i<platformHolder.size(); i++)
    {
      ((platform)platformHolder.get(i)).run((int)locX, (int)locY, skill1Counter);
    }
    
    collisionCheck();
    locX+= (float)width/2 - dorothy.getX();
    locY+= (float)height/2 - dorothy.getY();
    
    collisionCheck();
    speedRunner();
    skill1Button();
    runBlood();   
    dorothy.mapCheck();
  }
  
  void skill1Button()
  {
    image(skill1ButtonImage,0,0);
    image(skill2ButtonImage,0,0);
    image(skill3ButtonImage,0,0);
  }
  
  void runBlood()
  {
    if (bloodOn)
    {
      bloodCounter+=2;
    }
    else if (bloodCounter>0 )
    {
      bloodCounter--;
    }
    
    if (bloodCounter>0)
    {
      tint(255,bloodCounter*4*2.55);
      image(bloodImage,0,0);
      noTint();
    }
    
    if (bloodCounter>25)
    {
      bloodOn=false;
    }
  }
  
  void blood()
  {
    bloodOn=true;
  }

  
  
  
  void collisionCheck()
  {
      
    boolean tempPlat = false;
  
    for (int i=0; i<platformHolder.size(); i++)
    {
      if(((platform)platformHolder.get(i)).checkOn())
      {
        tempPlat = true;
      }
    }
    
    if (!dorothy.isDead()){
      if ((alpha(collisionMap.get((int)(width/2-locX), (int)(height/2-locY))))<40 && !tempPlat && !dorothy.isJumping())
      {
        locX = savedlocX;
        locY = savedlocY;
      }
      else
      {
         savedlocX = locX;
         savedlocY = locY;
      }
      if ((alpha(collisionMap.get(width/2-(int)locX, height/2-(int)locY)))<40 && !tempPlat && !dorothy.isJumping() && !invulnerable)
      {
        dorothy.runDeath(new PVector((int)locX,(int)locY), respawnDown);
      }
    }
  }
  
  void triggerSystem()
  {
    //respawn system
    if (triggerCheck(new PVector (63,-1717), new PVector(-164, -1940)) && !m4Trigger1)
    {
      m4Trigger1 = true;
      respawnDown = new PVector(-51,-1837);
    }
    if (triggerCheck(new PVector (-1002,-1790), new PVector(-1107, -1873)) && !m4Trigger2)
    {
      m4Trigger2 = true;
      respawnDown = new PVector(-1058,-1838);
    }
    if (triggerCheck(new PVector (-1005,-1201), new PVector(-1109, -1307)) && !m4Trigger3)
    {
      m4Trigger3 = true;
      respawnDown = new PVector(-1058,-1262);
    }
    if (triggerCheck(new PVector (-1010,-658), new PVector(-1109, -759)) && !m4Trigger4)
    {
      m4Trigger4 = true;
      respawnDown = new PVector(-1058,-712);
    }
    if (triggerCheck(new PVector (-864,-52), new PVector(-1236, -231)) && !m4Trigger5)
    {
      m4Trigger5 = true;
      respawnDown = new PVector(-1046,-148);
    }
    if (triggerCheck(new PVector (-1836,-1528), new PVector(-1966, -1643)) && !m4Trigger6)
    {
      m4Trigger6 = true;
      dialogueSystem.reset(11);
    }
    if(m4Trigger6 && !runDialogue && !m4Trigger7)
    {
      m4Trigger7 = true;
      transitionSystem.reset();
      runTransition=true;
            success.rewind();
      success.play();
    }
    if (m4Trigger7) {BGM4.setGain(((float)(transitionSystem.getPass())/(float)(transitionSystem.getSpeed()))*(28.0)*(-1.0));}
    if(m4Trigger7 && transitionSystem.getPass()==transitionSystem.getSpeed())
    {
      run11 = false;
      stringer5 = new fadeText(scene6Text, 4);
      showUnits = false;
      showHub = false;
      background(255);
      runDialogue = false;
      run12 = true;
      cutsceneSystem.reset();
      BGM4.pause();
      BGM4=null;
    }
  }
    

  
  boolean triggerCheck(PVector upperbound, PVector lowerbound)
  {
    return (locX<upperbound.x+1 && locX>lowerbound.x-1 && locY<upperbound.y+1 && locY>lowerbound.y-1);
  }
  
  void showTin()
  {

  }
  
  void speedRunner()
  {
      if (!speedSystem.isEmpty())
      {
        for (int i = 0; i< speedSystem.size(); i++)
        {
          ((speedParticle)speedSystem.get(i)).run((int)(width/2 - dorothy.getX()),(int)(height/2 - dorothy.getY()));
          if (((speedParticle)speedSystem.get(i)).checkLife())
          {
            speedSystem.remove(i);
            i--;
          }
        }
      }
  }
}



//====================================================================================
//|                                   ***********                                    |
//|                                    Draw Loop                                     |
//|                                   ***********                                    |
//====================================================================================
void draw()
{
  //long free = Runtime.getRuntime().freeMemory();
  //println (free);
  dynamicBG.run();
  if (run1) {cutsceneSystem.runStart();}
  if (showUnits) {
    if (run7){firstMap.run();}
    else if (run6){secondMap.run();}
    else if (run9){thirdMap.run();}
    else if (run11){fourthMap.run();}
    dorothy.run();
    hubSystem.run();
  }
  if (runDialogue) {dialogueSystem.run();}
  else if (run2) {cutsceneSystem.scene2();}
  else if (run3) {actSystem.run();}
  else if (run5) {cutsceneSystem.scene3();}
  else if (run8) {cutsceneSystem.scene4();}
  else if (run10) {cutsceneSystem.scene5();}
  else if (run12) {cutsceneSystem.scene6();}
  mouseCursor.run();
  
  if (runTransition) {transitionSystem.run();}
  
  if (keyPressed)
  {
    if (key=='1')
    {
      musicPlayer.pause();
      run7 = true;
      
      run1=false;
      showUnits=true;
    }
    else if (key=='2')
    {
      musicPlayer.pause();
      run6 = true;
      m3Trigger8 =true;
      run7 = false;
      run1=false;
      showUnits=true;
      
    }
    else if (key=='3')
    {
      musicPlayer.pause();
      m3Trigger8 =true;

      run7 = false;
      run9 = true;
    

      skill2=true;
      run1=false;
   
      showUnits=true;
    }
    else if (key=='4')
    {
      musicPlayer.pause();
      m3Trigger8 =true;
      run7 = false;
      run11 = true;
 
      skill3=true;
      skill2=true;
      run1=false;
    
      showUnits=true;

    }
    if (key=='i')
    {
      invulnerable=!invulnerable;
    }
  }

}


//====================================================================================
//|                                   ***********                                    |
//|                                    Controls                                      |
//|                                   ***********                                    |
//====================================================================================

void mousePressed()
{
  mouseCursor.pulse();
  println ("X: " + mouseX);
  println ("Y: " + mouseY);
  
  if (run2)
  {
    stringer.nextString();
  }
  
  if (run5)
  {
    stringer2.nextString();
  }
  
  if (run8)
  {
    stringer3.nextString();
  }
  
  if (run10)
  {
    stringer4.nextString();
  }
  
  if (run12)
  {
    stringer5.nextString();
  }
}

boolean[] keys = new boolean[4];
boolean moving = false;
int direction = 3;

void keyPressed()
{
  if (key=='q')
  {
    seeButtons=!seeButtons;
  }
  else if (key=='z' && m1Trigger3)
  {
    skill1=true;
  }
  else if ((key == CODED && !runDialogue && !dorothy.isJumping()) || (dorothy.isJumping() && key == CODED && dorothy.isStanding())) {
    if (keyCode == UP) {keys[0] = true; direction = 1; moving =true;}
    else if (keyCode == DOWN) {keys[1] = true; direction = 3; moving =true;}
    else if (keyCode == LEFT) {keys[2] = true; direction = 4; moving =true;}
    else if (keyCode == RIGHT) {keys[3] = true; direction = 2; moving =true;}
  }
}

void mouseReleased()
{
  dialogueAdvancePossible=true;
}


void keyReleased ()
{
  if (key=='z')
  {
    skill1=false;
  }
  else if (key==' ')
  {
    dialogueAdvancePossible=true;
  }
  else if (key == CODED ) {
    if (keyCode == UP) {keys[0] = false;}
    else if (keyCode == DOWN) {keys[1] = false;}
    else if (keyCode == LEFT) {keys[2] = false;}
    else if (keyCode == RIGHT) {keys[3] = false;}
  }
  if (!keys[0] && !keys[1] && !keys[2] && !keys[3])
  {
    moving = false;
  }
}

