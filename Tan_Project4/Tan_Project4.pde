//CY Tan

//Project 4

//====================================================================================
//|                                    Variables                                     |
//====================================================================================

//Dialogue Varaibles===================================
  PImage diagBox, diagBox2, heroPortrait, heroPortrait2, heroPortrait3, heroPortrait4, mentorPortrait, mentorPortrait2, mentorPortrait3, heroGuyPic;
  dgBox dialogueBox, dialogueBox2, dialogueBox3, dialogueBox4, dialogueBox5, dialogueBox6, dialogueBox7, dialogueBox8;
  PFont dgFont;
  boolean run1, run2, run3, run4, run5, run6, run7, battle1;
  dgBox activeDialogueBox;
  

//Starting Screen======================================
  PImage startBG1, startBG2, startBG3, startBG4, startBG5, startBG6, startBG7, startBG8, startBG9, startBG9_2, startBG10, startBG10_2, startBG11, startBG12, endBG;
  titleScreen title;
   cloud test;
   boolean mouseHover1, mouseHover2;
   boolean gameActive;
   boolean exitScreen;
   boolean activeFight;
   
//Game================================================
  game theGame;
  PImage cursor1, cursor2, cursor3, act1_0, act1_1, act1_2, hub_1, hub_2, hub_3, hub_4, hub_5, hub_6 , hub_7, bg, bg2;
  boolean mouseActive;
//Maps================================================
  PImage map1, battleMap1_1, battleMap1_2, map1Walls, dialogueBubble, heroGuyBattleSprite, mentorBattleSprite, possibleMoves, possibleMoves_1, possibleMoves_2, damage;
  ArrayList walls = new ArrayList();
  battleUnit heroGuyBattle, mentorBattle;
  
  boolean runPossibleMovesBoolean, pMoves1, pMoves2;
//Sprites=============================================
  PImage heroSprite;
  hero heroGuy;  
//Story===============================================
  ArrayList stories = new ArrayList();
  
  ArrayList particles = new ArrayList();
  
  

//====================================================================================
//====================================================================================

void setup() {
  size(720, 480);
  frameRate(30);
  smooth();
  noStroke();
//=======test area=========

//Dialogue Setup======================================
  stories.add( new ArrayList());
  ((ArrayList) stories.get(0)).add(new String ("Ok. So once again, we have a heroic    tale of a hero called hero guy."));
  ((ArrayList) stories.get(0)).add(new String ("This hero, called 'hero guy', must con-quer some sort of horrablifying terrib-"));
  ((ArrayList) stories.get(0)).add(new String ("ness so he can be super awesome and    stuffs."));
  ((ArrayList) stories.get(0)).add(new String ("Unfortunately, this time, evil's reallyreally tough (like ultra tough) so he")); 
  ((ArrayList) stories.get(0)).add(new String ("might actually have some difficulty in trying to be all cool and stuffs."));
  ((ArrayList) stories.get(0)).add(new String ("Luckily for him, our hero wouldn't be ahero if things were actually tough for"));
  ((ArrayList) stories.get(0)).add(new String ("him. He'll pretty much just own up somebaddies with his fist of epictastic"));
  ((ArrayList) stories.get(0)).add(new String ("awesome deathly deadliness and weapons that aren't his fist when he gets bored."));
  ((ArrayList) stories.get(0)).add(new String ("Anyhow, get ready for this super       amazing funtastic adventure of compell-"));
  ((ArrayList) stories.get(0)).add(new String ("ing, propelling story telling yelling.  "));
  
  stories.add( new ArrayList());
  ((ArrayList) stories.get(1)).add(new String ("Oh wow, I'm in my MEGA COOLTASTIC room.Guess that means I should start a super"));
  ((ArrayList) stories.get(1)).add(new String ("awesome adventure quest turbo extreme  plus. "));
  ((ArrayList) stories.get(1)).add(new String ("But first I should probably talk to    that old guy over there."));
  ((ArrayList) stories.get(1)).add(new String ("Especially, since he's in my house and I have no idea how he got here."));
  ((ArrayList) stories.get(1)).add(new String ("Weird, I remember having locked my     door."));
  //((ArrayList) stories.get(1)).add(new String (""));
  
  
  stories.add( new ArrayList());
  ((ArrayList) stories.get(2)).add(new String ("Salutations hero guy! How are you?"));
  ((ArrayList) stories.get(2)).add(new String ("WHO THE HELL ARE YOU? GET OUT OF MY    HOUSE YOU CREEP!"));
  ((ArrayList) stories.get(2)).add(new String ("DUN WORRIES, I am generic mentor, I'm  here to help."));
  ((ArrayList) stories.get(2)).add(new String ("Oh."));
  ((ArrayList) stories.get(2)).add(new String ("I'm just here to confabulate some heartwarming tale of your past to"));
  ((ArrayList) stories.get(2)).add(new String ("motivate you and junk like that. "));
  ((ArrayList) stories.get(2)).add(new String ("I'll also teach you basics about how toplay the game."));
  ((ArrayList) stories.get(2)).add(new String ("COOLIO, I'm so mega-pumped for an      adventure in this super swell, well"));
  ((ArrayList) stories.get(2)).add(new String ("designed world of exploretastical      magic. "));
  ((ArrayList) stories.get(2)).add(new String ("So you ready to hear meh story?!"));
  ((ArrayList) stories.get(2)).add(new String ("HECK NO BROTATO; LET'S FIGHT!"));
  ((ArrayList) stories.get(2)).add(new String ("WHAAAAAA??!"));
  
  stories.add( new ArrayList());
  ((ArrayList) stories.get(3)).add(new String ("What are you doing?! Why are you       challenging your SUPER FRIENDLY and"));
  ((ArrayList) stories.get(3)).add(new String ("HARMLESS old mentor?!                  "));
  ((ArrayList) stories.get(3)).add(new String ("BECAUSE I KNOW WHO YOU ARE! I've       DISCOVERED that it was in fact YOU who"));
  ((ArrayList) stories.get(3)).add(new String ("has been pulling the DARK STRINGS of   FATE ALL ALONG!"));
  ((ArrayList) stories.get(3)).add(new String ("GASP! You have SOMEHOW discovered my   secret even though you've just met me!"));
  ((ArrayList) stories.get(3)).add(new String ("Well, THE ACTS OVER. I'm actually the  SUPER EVIl DARKLORD ROTNEM in DISGUISE"));
  ((ArrayList) stories.get(3)).add(new String ("I KNEW IT!"));
  ((ArrayList) stories.get(3)).add(new String ("BUT HOW DID YOU FIGURE IT OUT SUPER    COOL HERO GUY?"));
  ((ArrayList) stories.get(3)).add(new String ("BECAUSE, you said it yourself, I'm     just TOO SUPER COOL!"));
  ((ArrayList) stories.get(3)).add(new String ("GOSH DARNIT, you've found the FLAW in  my SUPER FLAWLESS PLAN!"));
  ((ArrayList) stories.get(3)).add(new String ("Ha! I'm just too INTELLIGENT! But I    must know before I TERMINATE you with"));
  ((ArrayList) stories.get(3)).add(new String ("my PAINSWORD, why you are such an      EVIL MEANIE?!"));
  ((ArrayList) stories.get(3)).add(new String ("BECAUSE SUPER COOL HERO GUY, you've    done the UNTHINKABLE!"));
  ((ArrayList) stories.get(3)).add(new String ("You..You KILLED my SON!"));
  ((ArrayList) stories.get(3)).add(new String ("No..NO ROTNEM! I AM YOUR SON!"));
  ((ArrayList) stories.get(3)).add(new String ("NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"));
  ((ArrayList) stories.get(3)).add(new String ("..."));
  ((ArrayList) stories.get(3)).add(new String ("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO!"));
  ((ArrayList) stories.get(3)).add(new String ("Are you calm now?")); 
  ((ArrayList) stories.get(3)).add(new String ("Yeah. ANYWAYS, now that I HAVE         DISCOVERED MY LONG LOST SON, I MUST.."));
  ((ArrayList) stories.get(3)).add(new String ("Catch up on lost time and be the       father you've never been?!"));//21
  ((ArrayList) stories.get(3)).add(new String ("NO! I must KILL YOU!"));
  ((ArrayList) stories.get(3)).add(new String ("Wait, WHY?!"));
  ((ArrayList) stories.get(3)).add(new String ("I have NO IDEA! I GUESS it's because   I AM THE VILLAIN AND STUFFS!"));
  ((ArrayList) stories.get(3)).add(new String ("MY GOODNESS, you're RIGHT!"));
  ((ArrayList) stories.get(3)).add(new String ("THEN GET READY! I'M ACTIVATING MY      MAXIMUM OVERDRIVE! HYAAAAAA!!"));
  ((ArrayList) stories.get(3)).add(new String ("COME AT ME BRO! Err..I MEAN SON!"));
  
  stories.add( new ArrayList());
  ((ArrayList) stories.get(4)).add(new String ("IS THAT ALL?!"));
  ((ArrayList) stories.get(4)).add(new String ("JUST YOU WAIT!"));
  
  stories.add( new ArrayList());
  ((ArrayList) stories.get(5)).add(new String ("HA! Your attacks did NOTHING! I am     IMPERVIOUS to your PUNY damage."));
  ((ArrayList) stories.get(5)).add(new String ("Guess you're not so SUPER COOL after   all SUPER COOL hero guy!"));
  ((ArrayList) stories.get(5)).add(new String ("Well, the JOKE is on YOU! LOOK AGAIN   FOOL!"));
  ((ArrayList) stories.get(5)).add(new String ("Wait, WHAT?!"));
  ((ArrayList) stories.get(5)).add(new String ("That's RIGHT, LOOK AGAIN!"));
  ((ArrayList) stories.get(5)).add(new String ("Huh?...What? Oh wait.. I'M LOSING      OPACITY!")); 
  ((ArrayList) stories.get(5)).add(new String ("HOW COULD YOU?!"));
  ((ArrayList) stories.get(5)).add(new String ("That's right! I'm using my SECRET      TECHNIQUE: SUPER ULTRA MEGA "));
  ((ArrayList) stories.get(5)).add(new String ("ATOMIC FACEMELTER! My ULTIMATE and ONLYmove!"));
  ((ArrayList) stories.get(5)).add(new String ("You have NO CHANCE! The POWER of my    FACEMELTER ability cuts at something "));
  ((ArrayList) stories.get(5)).add(new String ("much more IMPORTANT than your life!"));
  ((ArrayList) stories.get(5)).add(new String ("Instead, it QUICKLY MELTS away your    ALPHA LEVELS!"));  
  ((ArrayList) stories.get(5)).add(new String ("And once you're INVISIBLE, you're as   good as dead!"));
  ((ArrayList) stories.get(5)).add(new String ("OH NO! Why does that move exist?! AND  WHY ISN'T IT MORE FLASHY?"));
  ((ArrayList) stories.get(5)).add(new String ("BECAUSE the PROGRAMMER was LAZY. AND   didn't want to PROGRAM ACTUAL"));
  ((ArrayList) stories.get(5)).add(new String ("DAMAGE or MORE EFFECTS."));
  ((ArrayList) stories.get(5)).add(new String ("Anyways, YOU'RE FINISHED with this nextattack!"));
  ((ArrayList) stories.get(5)).add(new String ("Not if I KILL YOU first! You forget    that even with half my visibiliy, I'm"));  
  ((ArrayList) stories.get(5)).add(new String ("still just as STRONG!"));  
  ((ArrayList) stories.get(5)).add(new String ("Wait..Why CAN'T I MOVE?!"));
  ((ArrayList) stories.get(5)).add(new String ("You UNDERESTIMATE how LAZY the pro-    grammer is! You DON'T EVEN HAVE ATTACK")); 
  ((ArrayList) stories.get(5)).add(new String ("ANIMATIONS!"));
  ((ArrayList) stories.get(5)).add(new String ("CURSE YOU PROGRAMMER! I WOULD ATTACK   THE PROGRAMMER TOO IF IF I COULD ATTACK!"));
  
  stories.add( new ArrayList());
  ((ArrayList) stories.get(6)).add(new String ("OH NO! My alpha levels are all gone    now! I am now NOTHING!"));
  ((ArrayList) stories.get(6)).add(new String ("AHAHAHAHA! You have FALLEN to my MIGHTYMIGHT and POWERFUL POWER!"));
  ((ArrayList) stories.get(6)).add(new String ("I have CRUSHED you and ALL THAT YOU ARE!"));
  ((ArrayList) stories.get(6)).add(new String ("GASP! Son, you ALMOST sound EVIL! I    don't know what to say..except.."));
  ((ArrayList) stories.get(6)).add(new String ("I'm so PROUD of you SON!"));
  ((ArrayList) stories.get(6)).add(new String ("Really Dad?! That's all I ever wanted  to hear! THANK YOU!"));
  ((ArrayList) stories.get(6)).add(new String ("NO PROBLEMO SON!"));
  ((ArrayList) stories.get(6)).add(new String ("COOL BEANS DAD!"));
  ((ArrayList) stories.get(6)).add(new String ("Hey, maybe you could even carry on my  legacy or something!"));
  ((ArrayList) stories.get(6)).add(new String ("Yeah, that sounds pretty AWESOME."));
  ((ArrayList) stories.get(6)).add(new String ("Now, that You CAN no LONGER TERRORIZE  the DENIZENS of THIS LAND, I guess.."));
  ((ArrayList) stories.get(6)).add(new String ("I'll DO IT INSTEAD!"));
  ((ArrayList) stories.get(6)).add(new String ("AHAHAHAHAHAHAHAHAHAHAHAHAAHAHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAAAHAHAHAHAHAH"));
  ((ArrayList) stories.get(6)).add(new String ("*sniff* How could a father be more     proud!"));
  ((ArrayList) stories.get(6)).add(new String ("AHAHAHAHAHAHAHAHAHAHAHAHAAHAHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAAAHAHAHAHAHAH"));
  ((ArrayList) stories.get(6)).add(new String ("AHAHAHAHAHAHAHAHAHAHAHAHAAHAHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAAAHAHAHAHAHAH"));
  ((ArrayList) stories.get(6)).add(new String ("AHAHAHAHAHAHAHAHAHAHAHAHAAHAHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAAAHAHAHAHAHAH"));
  ((ArrayList) stories.get(6)).add(new String ("AHAHAHAHAHAHAHAHAHAHAHAHAAHAHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAAAHAHAHAHAHAH"));
  ((ArrayList) stories.get(6)).add(new String ("AHAHAHAHAHAHAHAHAHAHAHAHAAHAHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAHAHAAAHAHAHAHAHAH"));
  
  stories.add( new ArrayList());
  ((ArrayList) stories.get(7)).add(new String ("I better talk to that old guy first he might steal all my stuffs"));
  
  
  dgFont = loadFont("ProggyCleanTT-32.vlw");
  diagBox = loadImage("MainDgBox.png");
  diagBox2 = loadImage("SubDgBox.png");  
  
  heroPortrait = loadImage("heroPortrait.PNG");
  heroPortrait2 = loadImage("heroPortrait2.PNG");
  heroPortrait3 = loadImage("heroPortrait3.PNG");
  heroPortrait4 = loadImage("heroPortrait4.PNG");
  mentorPortrait = loadImage("mentorPortrait.png");
  mentorPortrait2 = loadImage("mentorPortrait2.png");
  mentorPortrait3 = loadImage("mentorPortrait3.png");
  heroGuyPic = loadImage("heroGuy.PNG");
  heroGuyBattleSprite = loadImage("heroBattleSprite.png");
  mentorBattleSprite = loadImage("mentorBattleSprite.png");
  
  heroGuyBattle = new battleUnit(heroGuyBattleSprite,1);
  mentorBattle = new battleUnit(mentorBattleSprite,2);
  
  possibleMoves = loadImage("possibleMoves.PNG");
  possibleMoves_1 = loadImage("possibleMoves_1.PNG");
  possibleMoves_2 = loadImage("possibleMoves_2.PNG");
  
  damage = loadImage("damage.PNG");
  
  dialogueBox = new dgBox ("", 50, ((ArrayList) stories.get(0)));
  dialogueBox2 = new dgBox ("", 50, ((ArrayList) stories.get(1)), heroPortrait);
  dialogueBox3 = new dgBox ("", 50, ((ArrayList) stories.get(2)), heroPortrait2, mentorPortrait);
  dialogueBox4 = new dgBox ("", 50, ((ArrayList) stories.get(3)), heroPortrait2, mentorPortrait);
  dialogueBox5 = new dgBox ("", 50, ((ArrayList) stories.get(4)), heroPortrait2, mentorPortrait);
  dialogueBox6 = new dgBox ("", 50, ((ArrayList) stories.get(5)), heroPortrait2, mentorPortrait);
  dialogueBox7 = new dgBox ("", 50, ((ArrayList) stories.get(6)), heroPortrait2, mentorPortrait3);
  dialogueBox8 = new dgBox ("", 50, ((ArrayList) stories.get(7)), heroPortrait2);
  activeDialogueBox=dialogueBox;
  
  run1=false;
  run2=false;
  run3=false;
  run4=false;
  run5=false;
  run6=false;
  run7=false;
  
  battle1=false;
  pMoves1=false;
  pMoves2=false;
  
  activeFight=false;

//Starting Screen Setup===============================
  title = new titleScreen();
  startBG1 = loadImage("startBG1.PNG");
  startBG2 = loadImage("startBG2.PNG");
  startBG3 = loadImage("startBG3.PNG");
  startBG4 = loadImage("startBG4.PNG");
  startBG5 = loadImage("startBG5.PNG");
  startBG6 = loadImage("startBG6.PNG");
  startBG7 = loadImage("startBG7.PNG");
  startBG8 = loadImage("startBG8.PNG");
  startBG9 = loadImage("startBG9.PNG");
  startBG9_2 = loadImage("startBG9_2.PNG");
  startBG10 = loadImage("startBG10.PNG");
  startBG10_2 = loadImage("startBG10_2.PNG");
  startBG11 = loadImage("startBG11.PNG");
  startBG12 = loadImage("startBG12.PNG");
  endBG = loadImage("end.JPG");
  mouseHover1 = false;
  mouseHover2 = false;
  gameActive = false;
  exitScreen = false;
//Game Setup=========================================== 
  theGame = new game();
  cursor1 = loadImage("Cursor1.png");
  cursor2 = loadImage("Cursor2.png");
  cursor3 = loadImage("mouseEmpty.png");
  mouseActive=false;
  cursor3 = loadImage("mouseEmpty.png");
  act1_0 = loadImage("Act1_0.png");
  act1_1 = loadImage("Act1_1.png");
  act1_2 = loadImage("Act1_2.png");
  hub_1 = loadImage("hub_1.PNG");
  hub_2 = loadImage("hub_2.PNG");
  hub_3 = loadImage("hub_3.PNG");
  hub_4 = loadImage("hub_4.PNG");
  hub_5 = loadImage("hub_5.PNG");
  hub_6 = loadImage("hub_6.PNG");
  hub_7 = loadImage("hub_7.PNG");
  bg = loadImage("bg.JPG");
  bg2 = loadImage("bg2.PNG");
//Map Setup============================================
  map1 = loadImage("map1.PNG");
  battleMap1_1 = loadImage("battleMap1_1.PNG");
  battleMap1_2 = loadImage("battleMap1_2.PNG");
  map1Walls = loadImage("map1_walls.PNG");
  walls.add(new wall (318,397,98,339));
  //===hall walls
  walls.add(new wall (114,195,338,356));
  walls.add(new wall (247,470,338,356));
  walls.add(new wall (518,605,338,356));
  //====room walls=========
  walls.add(new wall (109,125,94,448));
  walls.add(new wall (590,605,94,448));
  walls.add(new wall (109,341,426,442));
  walls.add(new wall (341,374,440,442));
  walls.add(new wall (374,604,426,442));
  walls.add(new wall (110,605,104,153));
  //====furniture==========
  walls.add(new wall (174,205,146,170));
  walls.add(new wall (237,270,146,170));
  walls.add(new wall (124,172,189,212));
  walls.add(new wall (270,320,189,212));
  walls.add(new wall (470,516,196,265));
  walls.add(new wall (397,477,147,169));
  walls.add(new wall (510,541,147,169));
  //====misc===============
  dialogueBubble = loadImage("dialogueBubble.png");
  
  //wall(int leftX, int rightX, int topY, int botY)
  //Character Setup====================================== 
  heroSprite = loadImage("HeroSpriteSheet.png");
  heroGuy = new hero();
  //Story==================================
  
}

//====================================================================================
//|                                    Draw Loop                                     |
//====================================================================================
void draw ()
{
  background(0);
  
  if (!gameActive){title.run();}
 
  if (gameActive){theGame.runBG();}
  if (theGame.checkHub()) {theGame.runMap();}
  
  heroGuy.run();
  
  if (theGame.checkHub()) {theGame.runMapWalls();
    if (!run1)
    {
      run1=true; 
      dialogueBox2.turnOn();
      activeDialogueBox = dialogueBox2;
    }  
  }

  if (run1) {
    //todo get iter to disable run
    dialogueBox2.run(); if(dialogueBox2.getIterator()==3) {
      dialogueBox2.changePortrait1(heroPortrait4);
    }
  }
  if (run2) {
    //todo get iter to disable run
    dialogueBox3.run(); 
    if(dialogueBox3.getIterator()==1) {
      dialogueBox3.setDark1(true);
    }
    if(dialogueBox3.getIterator()==2) {
      dialogueBox3.changePortrait1(heroPortrait3);
      dialogueBox3.setDark1(false);
      dialogueBox3.setDark2(true);
    }
    else if(dialogueBox3.getIterator()==3) {
      dialogueBox3.setDark1(true);
      dialogueBox3.setDark2(false);
    }
    else if(dialogueBox3.getIterator()==4) {
      dialogueBox3.changePortrait1(heroPortrait2);
      dialogueBox3.setDark1(false);
      dialogueBox3.setDark2(true);
    }
    else if(dialogueBox3.getIterator()==5) {
      dialogueBox3.setDark1(true);
      dialogueBox3.setDark2(false);
    }
    else if(dialogueBox3.getIterator()==8) {
      dialogueBox3.changePortrait1(heroPortrait3);
      dialogueBox3.setDark1(false);
      dialogueBox3.setDark2(true);
    }
    else if(dialogueBox3.getIterator()==10) {
      dialogueBox3.changePortrait1(heroPortrait2);
      dialogueBox3.setDark1(true);
      dialogueBox3.setDark2(false);
    }
    else if(dialogueBox3.getIterator()==11) {
      dialogueBox3.changePortrait1(heroPortrait3);
      dialogueBox3.setDark1(false);
      dialogueBox3.setDark2(true);
    }
    else if(dialogueBox3.getIterator()==12) {
      dialogueBox3.setDark1(true);
      dialogueBox3.setDark2(false);
    }
    if (dialogueBox3.isOff()) {battle1=true; theGame.turnOffMap(); heroGuy.turnOff();}
  }
  

 
  
 if (battle1) {
   theGame.runBattleMap(heroGuyBattle, mentorBattle);
   runDamage();
   if (particles.size()!=0){
     for (int i = 0; i<particles.size();i++)
     {
         if((Object)particles.get(i) instanceof particle)
           {((particle)particles.get(i)).run();
           if (!((particle)particles.get(i)).isActive()) {particles.remove(i);}
           }
         else {((particle2)particles.get(i)).run();
         if (!((particle2)particles.get(i)).isActive()) {particles.remove(i);}
         }                
     }  
   }
 }
  
 if(runPossibleMovesBoolean) {theGame.runPossibleMoves();}
 
 if (run3) {
    dialogueBox4.run();
    if(dialogueBox4.getIterator()==1) {
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==3){
      dialogueBox4.changePortrait1(heroPortrait3);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    //67891011
    else if (dialogueBox4.getIterator()==5){
      dialogueBox4.changePortrait1(heroPortrait2);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==7){
      dialogueBox4.changePortrait1(heroPortrait3);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==8){
      dialogueBox4.changePortrait1(heroPortrait);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==9){
      dialogueBox4.changePortrait1(heroPortrait3);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==10){
      dialogueBox4.changePortrait1(heroPortrait2);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==11){
      dialogueBox4.changePortrait1(heroPortrait3);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==13){
      dialogueBox4.changePortrait1(heroPortrait);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==15){
      dialogueBox4.changePortrait1(heroPortrait3);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==16){
      dialogueBox4.changePortrait1(heroPortrait);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==17){
      dialogueBox4.changePortrait1(heroPortrait2);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==18){
      dialogueBox4.changePortrait1(heroPortrait);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==19){
      dialogueBox4.changePortrait1(heroPortrait4);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==20){
      dialogueBox4.changePortrait1(heroPortrait2);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==21){
      dialogueBox4.changePortrait1(heroPortrait4);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==22){
      dialogueBox4.changePortrait1(heroPortrait2);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==23){
      dialogueBox4.changePortrait1(heroPortrait3);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==24){
      dialogueBox4.changePortrait1(heroPortrait2);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    else if (dialogueBox4.getIterator()==25){
      dialogueBox4.changePortrait1(heroPortrait3);
      dialogueBox4.setDark1(false);
      dialogueBox4.setDark2(true);
    }
    else if (dialogueBox4.getIterator()==27){
      dialogueBox4.changePortrait1(heroPortrait2);
      dialogueBox4.setDark1(true);
      dialogueBox4.setDark2(false);
    }
    if (dialogueBox4.isOff()) {runPossibleMovesBoolean=true;}
  }
  
  if (run4) {
    dialogueBox5.run();
    if(dialogueBox5.getIterator()==1) {
      dialogueBox5.setDark1(true);
      dialogueBox5.setDark2(false);
    }
    else if(dialogueBox5.getIterator()==2) {
      dialogueBox5.changePortrait1(heroPortrait3);
      dialogueBox5.setDark1(false);
      dialogueBox5.setDark2(true);
    }
   }
   
   if (run5) {
    dialogueBox6.run();
    if(dialogueBox6.getIterator()==1) {
      dialogueBox6.changePortrait1(heroPortrait2);
      dialogueBox6.setDark1(true);
      dialogueBox6.setDark2(false);
    }
    else if(dialogueBox6.getIterator()==3) {
      dialogueBox6.changePortrait1(heroPortrait3);
      dialogueBox6.setDark1(false);
      dialogueBox6.setDark2(true);
    }
    else if(dialogueBox6.getIterator()==4) {
      dialogueBox6.changePortrait1(heroPortrait2);
      dialogueBox6.setDark1(true);
      dialogueBox6.setDark2(false);
    }
    else if(dialogueBox6.getIterator()==5) {
      dialogueBox6.changePortrait1(heroPortrait3);
      dialogueBox6.setDark1(false);
      dialogueBox6.setDark2(true);
    }
    else if(dialogueBox6.getIterator()==6) {
      dialogueBox6.changePortrait1(heroPortrait2);
      dialogueBox6.changePortrait2(mentorPortrait2);
      dialogueBox6.setDark1(true);
      dialogueBox6.setDark2(false);
    }
    else if(dialogueBox6.getIterator()==8) {
      dialogueBox6.changePortrait1(heroPortrait3);
      dialogueBox6.setDark1(false);
      dialogueBox6.setDark2(true);
    }
    else if(dialogueBox6.getIterator()==14) {
      dialogueBox6.changePortrait1(heroPortrait2);
      dialogueBox6.setDark1(true);
      dialogueBox6.setDark2(false);
    }
    else if(dialogueBox6.getIterator()==15) {
      dialogueBox6.changePortrait1(heroPortrait3);
      dialogueBox6.setDark1(false);
      dialogueBox6.setDark2(true);
    }
    else if(dialogueBox6.getIterator()==18) {
      dialogueBox6.changePortrait1(heroPortrait2);
      dialogueBox6.setDark1(true);
      dialogueBox6.setDark2(false);
    }
    else if(dialogueBox6.getIterator()==21) {
      dialogueBox6.changePortrait1(heroPortrait3);
      dialogueBox6.setDark1(false);
      dialogueBox6.setDark2(true);
    }
    else if(dialogueBox6.getIterator()==23) {
      dialogueBox6.changePortrait1(heroPortrait2);
      dialogueBox6.setDark1(true);
      dialogueBox6.setDark2(false);
    }
   }
   
   if (run6) {dialogueBox7.run();
    if(dialogueBox7.getIterator()==1) {
      dialogueBox7.changePortrait1(heroPortrait2);
      dialogueBox7.setDark1(true);
      dialogueBox7.setDark2(false);
    }
    else if(dialogueBox7.getIterator()==2) {
      dialogueBox7.changePortrait1(heroPortrait3);
      dialogueBox7.setDark1(false);
      dialogueBox7.setDark2(true);
    }
    else if(dialogueBox7.getIterator()==4) {
      dialogueBox7.changePortrait1(heroPortrait3);
      dialogueBox7.setDark1(true);
      dialogueBox7.setDark2(false);
    }
    else if(dialogueBox7.getIterator()==6) {
      dialogueBox7.setDark1(false);
      dialogueBox7.setDark2(true);
    }
    else if(dialogueBox7.getIterator()==7) { 
      dialogueBox7.setDark1(true);
      dialogueBox7.setDark2(false);
    }
    else if(dialogueBox7.getIterator()==8) {
      dialogueBox7.setDark1(false);
      dialogueBox7.setDark2(true);
    }
    else if(dialogueBox7.getIterator()==9) { 
      dialogueBox7.setDark1(true);
      dialogueBox7.setDark2(false);
    }
    else if(dialogueBox7.getIterator()==10) {
      dialogueBox7.setDark1(false);
      dialogueBox7.setDark2(true);
    }
    else if(dialogueBox7.getIterator()==14) { 
      dialogueBox7.setDark1(true);
      dialogueBox7.setDark2(false);
    }
    else if(dialogueBox7.getIterator()==15) {
      dialogueBox7.setDark1(false);
      dialogueBox7.setDark2(true);
    }
    else if(dialogueBox7.getIterator()==19) {
      endOn();
    }
   }
   
   if (run7) {dialogueBox8.run();}
  
  if (gameActive){dialogueBox.run(); theGame.run();}
  cursor(cursor3, 0, 0);
  
  
  if (mouseActive) {image(cursor2, mouseX, mouseY);}
    else {image(cursor1, mouseX, mouseY);}
  
  for(int i = 0; i<walls.size(); i++)
  {
    ((wall)walls.get(i)).run();
  }
  
  if (end)
  {
    runEnd();
  }
}

//====================================================================================
//|                                   Title Screen                                   |
//====================================================================================
class titleScreen
{
  int pass;
  ArrayList clouds; 
  int cloudAmount;
  int passHolder;
  boolean hold;
  
  titleScreen()
  {
    clouds = new ArrayList();
    cloudAmount = 5;
    pass = 0;
    hold = true;
    for (int i = 0; i<cloudAmount; i++)
    {
      clouds.add(new cloud());
    }
  }
  
  void run()
  {
    pass++;
    if (exitScreen && hold) {passHolder = pass; hold=false;}
    tint (255,pass*5.1);
    image(startBG1,0,0);
    noTint();
    tint (255,pass*5.1-350);
    image(startBG2,0,0);
    noTint();
    //chest
    if (pass<190) {image(startBG11,0,2280-pass*12);}
    else {image(startBG11,0,0);}
    //sword
    if (pass<220) {image(startBG12,0,pass*30-6460);}
    else {image(startBG12,0,140);}
    tint (255,pass*5.1-600);
    image(startBG3,0,0);
    noTint();
    //======clouds===========
    if (pass>200)
    {
      for (int i = 0; i<clouds.size(); i++)
      {
        cloud temp = (cloud) clouds.get(i);
        temp.run();
        if (!temp.checkActive())
        {
          clouds.remove(i);
          clouds.add(new cloud());
        }
      }
    } 
    //========================
    if (pass<120) {image(startBG4,0,pass*12-1440);}
    else {image(startBG4,0,0);}
    if (pass<150) {image(startBG5,pass*25-3750,0);}
    else {image(startBG5,0,0);}
    if (pass<160) {image(startBG6,4000-pass*25,0);}
    else {image(startBG6,0,0);}
    if (pass<170) {image(startBG7,0,(170*25)-pass*25);}
    else {image(startBG7,0,0);}
    if (pass<180) {image(startBG8,0,pass*20-3600);}
    else {image(startBG8,0,0);}
    tint (255,pass*15-2700);
    if (mouseHover1) {image(startBG9_2,0,0);}
    else {image(startBG9,0,0);}
    noTint();
    tint (255,pass*15-2900);
    if (mouseHover2) {image(startBG10_2,0,0);}
    else {image(startBG10,0,0);}
    noTint();
    if (exitScreen) {
      fill (0,(pass-passHolder)*5);
      rect(0,0,width,height);
      noFill();
      if ((pass-passHolder)*5>255) gameActive=true;
    }
  }
}
//====================================================================================
//|                                    Game Functs                                   |
//====================================================================================
class game {

  int pass;

  int actCounter;
  float actVelocity;
  int actPass;
  boolean actActive;
  int hubPass;
  boolean hubActive;
  int bgPass;
  int mapPass;
  int battleMapPass;
  boolean mapOff;
  int possibleMovesPass;
  
  game ()
  {
    bgPass = 0;
    actVelocity =35;
    actCounter=0;
    battleMapPass=0;
    mapOff = false;
    
    pass = 0;
    actPass = 0;
    actActive = false;
    hubPass= 9;
    hubActive=false;
    mapPass = 0;
    possibleMovesPass = 0;
  }
  
  void run()
  {
    pass++;
    if (pass==100) {heroGuy.goMove(); heroGuy.changeDirection("south"); heroGuy.setX(width/2); heroGuy.setY(-15);}
    else if (pass==135) {heroGuy.goStop();}
    else if (pass==20) {dialogueBox.turnOn(); activeDialogueBox=dialogueBox;}
    
    if (pass>=120 && !actActive  && !hubActive ) {
      tint(255,2.55*2*(pass-120));
      image(heroGuyPic,0,0);
      noTint();
    }

    //=====Act Activation===========
    if (actActive) {theGame.actActivator(); actPass++;}
    //====Hub Activation===========
    if (hubActive && hubPass<181) {theGame.hubActivator(); hubPass++;}
      else if (hubActive) {image(hub_7,0,0);image(hub_3,0,0); image(hub_4,0,0);image(hub_2,0,0);image(hub_6,0,0);image(hub_5,0,0);image(hub_1,0,0);}
  }

  void actToggle()
  {
    actActive = true;
  }
  
  void actActivator ()
  {
    if (actPass<110)
    {
     tint(255,actPass*5);
     image(act1_0,0,0);
     noTint();
    }
    else {
     tint(255,255-(actPass-110)*5);
     image(act1_0,0,0);
     noTint();
    }
     if (actPass>30 && actPass<90 ) {
      actVelocity-=.8;
      if (actVelocity<=2) {actVelocity=2;}
      actCounter+=actVelocity;
      }
      else if (actPass>90){
        actVelocity+=1.2;
        actCounter+=actVelocity;
      }
    if (actPass<200){image(act1_1,-20+actCounter-width,0); image(act1_2,20-(actCounter-width),0);}
      else {actActive= false; 
    }
    if (actPass==100) {heroGuy.setX(230); heroGuy.setY(211);}
    if (actPass==160) {hubActive=true; }
  }
  
  void runBG()
  {
    if (pass<100) {tint(255,pass*2.55);}
    bgPass+=1;
    if (bgPass==height) {bgPass=0;}
    image (bg,0,-bgPass);
    image (bg,0,height-bgPass);
    image (bg2,0,0);
    noTint();
  }
  

  void hubActivator()
  {
    
    if (hubPass>65 && hubPass<74)
    {
      image(hub_7,0,18-((hubPass-65)*2));
    }
    else if (hubPass>=74)
    {
      image(hub_7,0,0);
    }
    
    if (hubPass>30 && hubPass<70)
    {
      image(hub_3.get(0, 0, (hubPass-30)*6, height),0,0);
    }
    else if (hubPass>=70)
    {
      image(hub_3,0,0);
    }
    
    if (hubPass>30 && hubPass<70)
    {
      image(hub_4.get(0, 0, (hubPass-30)*6, height),0,0);
    }
    else if (hubPass>=70)
    {
      image(hub_4,0,0);
    }
    
    if (hubPass>40 && hubPass<110)
    {
      image(hub_5.get(0, 0, (hubPass-40)*4, height),0,0);
    }
    else if (hubPass>=110)
    {
      image(hub_5,0,0);
    }
    
    if (hubPass>60 && hubPass<130)
    {
      image(hub_6.get(0, 0, (hubPass-60)*4, height),0,0);
    }
    else if (hubPass>=130)
    {
      image(hub_6,0,0);
    }

    
    if (hubPass>40 && hubPass<50)
    {
      tint(255,(hubPass-40)*25.5);
      image(hub_2,0,-50+((hubPass-40)*5));
      noTint();
    }
    else if (hubPass>=50)
    {
      image(hub_2,0,0);
    }
     
    if (hubPass<50) {
      tint(255,hubPass*2*2.55);
      image(hub_1.get(0, 0, width, hubPass*4),0,0);
      noTint();
    }
    else {image(hub_1,0,0);}  
  }
  
  boolean checkHub()
  {
    return hubActive;
  }
  
  void runMap()
  {
    if (!mapOff){  
      if (mapPass<50) {tint(255,mapPass*(255/50)); mapPass++;}
      image(map1,0,0);
      dgBubble();
      noTint();
    }
    else {
      if (mapPass<50) {tint(255,255-(mapPass*(255/50))); mapPass++;}
        else{tint(255,0);}
      image(map1,0,0);
      dgBubble();
      noTint();
    }
  }
  
  void turnOffMap()
  {
    mapOff=true;
    mapPass=0;
  }
  
  void runPossibleMoves()
  {
    if (possibleMovesPass<240){
      tint(255,possibleMovesPass*(255/240));
      possibleMovesPass+=5;
      noTint();
    }
    if (pMoves1){image(possibleMoves_1,0,height/2-possibleMovesPass);}
    else if (pMoves2){image(possibleMoves_2,0,height/2-possibleMovesPass);}
    else {image(possibleMoves,0,height/2-possibleMovesPass);}
    
    
    
  }
  
  void runBattleMap(battleUnit temp1, battleUnit temp2)
  { 
      battleMapPass++;
      if (battleMapPass<=36){
        tint(255,battleMapPass*(255/36));

        pushMatrix();
          translate(((width/2)-(10*battleMapPass)),0);
          image(battleMap1_2,0,0);
          temp2.run();
        popMatrix();
        pushMatrix();
          translate(((-width/2)+(10*battleMapPass)),0);
          image(battleMap1_1,0,0);
          temp1.run();
        popMatrix();
        noTint();
     }
     else{
       if (!run3){
         run3=true; 
         dialogueBox4.turnOn();
         activeDialogueBox = dialogueBox4;
       }
       image(battleMap1_1,0,0);
       image(battleMap1_2,0,0);
       
       if (activeFight) {temp1.runCharge(); temp2.runCharge(); activeFight=false;}
       temp2.run();
       temp1.run();
     } 
  }
  
  void runMapWalls()
  {
    if (!mapOff){      
      if (mapPass<50) {tint(255,mapPass*(255/50));}
      image(map1Walls,0,0);
      noTint();
    }
   else {
      if (mapPass<50) {tint(255,255-(mapPass*(255/50)));}
        else{tint(255,0);}
      image(map1Walls,0,0);
      noTint();
    }
  }
}
//====================================================================================
//|                                     Objects                                      |
//====================================================================================

class battleUnit
{
  PImage active;
  boolean standing;
  boolean dashing;
  boolean attacking;
  PImage battleSprite;
  int pass;
  int miniPass;
  int speed;
  int passModifier = 1;
  int loc;
  int pass2;
  int pass2x;
  int lifeTime;
  int lifeTimeSet;
  float alphaVal;
  int alphaControl=60;
  int totalPass;
  
  battleUnit(PImage temp, int temp2)
  {
    standing = true;
    dashing = false;
    attacking = false;
    battleSprite = temp;
    speed=4;
    loc=temp2;
    pass=0;
    pass2=0;
    lifeTime=100;
    lifeTimeSet=lifeTime;
    alphaVal=255*3;
    totalPass=0;
  }
  
  void run()
  {
    imageMode(CENTER);
    miniPass++;
    if (miniPass>=speed) {miniPass=0; pass+=passModifier;}
    
    if (standing)
    {
      if (pass>5) {passModifier=-1; pass=4;}
      if (pass<=0) {passModifier=1;}
      
      active = battleSprite.get(pass*100, 0, 100, 100);
      if (loc==1) {
        if (alphaVal<=3) { active = battleSprite.get(pass*100, 400, 100, 100);}
        image(active, 108,263);
      }
      else if (loc==2){
        tint(255,(alphaVal/3)+alphaControl);
        image(active, 619,263);
        noTint();
      }
    }
    else
    {
      if (loc==1){
          pass2++;
          if (lifeTime>0 && pass2x<465){
            pass2x+=15;
            if (pass2>2) {pass2=0;}
            active = battleSprite.get(pass2*100, 200, 100, 100);
            
            if (pass2x<465 && !standing) {particles.add(new particle(108+pass2x)); particles.add(new particle(108+pass2x)); particles.add(new particle(108+pass2x)); particles.add(new particle(108+pass2x));}
          }
          else if ( lifeTime>0) {
            pass2x=475;
            if (pass2>13) {pass2=0;}
            active = battleSprite.get(pass2*100, 300, 100, 100);
          }
          
          if (lifeTime<=0)
          {
            if (pass2>2) {pass2=0;}
            active = battleSprite.get(pass2*100, 200, 100, 100);
            if (pass2x==0){
              standing=true; pass=0; totalPass++;
              if (alphaVal==465) {
                run4=true; 
                dialogueBox5.turnOn();
                activeDialogueBox = dialogueBox5;
              }
              else if (alphaVal==165) {      
                run5=true; 
                dialogueBox6.turnOn();
                activeDialogueBox = dialogueBox6;
              }
              else if (alphaVal==-135) {     
                run6=true; 
                dialogueBox7.turnOn();
                activeDialogueBox = dialogueBox7;
              }
            }
            else{pass2x+=15;}
            if (pass2x>width+15) {pass2x=-90;}
            
          }
          else if (lifeTime>0 && (pass2x>=465))
          {
            lifeTime--;
            alphaVal-=3;
          }
          if (lifeTime==90) {damageOn();}

        image(active, 108+pass2x,268);
    }
    if (loc==2){
      pass2++;
      
      if (pass2x<465){pass2x+=15;
        
        if (pass2>2) {pass2=0;}
      }
      else {
          pass2x=475;
          if (pass2>13) {pass2=0;}
      }
      
      if (pass>5) {passModifier=-1; pass=4;}
      if (pass<=0) {passModifier=1;}
      
      active = battleSprite.get(pass*100, 0, 100, 100);
      
      if ((pass2x>=465))
      {
        if (pass2>4) {pass2=0;}
        
        active = battleSprite.get(100*pass2, 100, 100, 100);
      }
      else {
        tint(255,(alphaVal/3)+alphaControl);
        image(active, 619,263);
        noTint();
      }
      if (lifeTime>0 && (pass2x>=465)) {
          alphaVal-=3;
          lifeTime--; tint(255,(alphaVal/3)+alphaControl);
          image(active, 619,263);
          noTint();
        
      }
      if (lifeTime<=0)
        {
          pass=0;
          standing=true;
        }
  
    }
  
    }
    imageMode(CORNER);
  }
  
  void runCharge()
  {
    if(standing==true){standing=false;     
      pass=0;
      pass2=0;
      pass2x=0;
      lifeTime=100;
      lifeTimeSet=lifeTime;
    }
  }
}
  
//================Dialogue Box Obj=====================
class dgBox {
  String dgBoxText;
  int textSpeed;
  int pass;
  int displayedText;
  boolean on;
  boolean turnOn;
  boolean turnOff;
  boolean done;
  String activeDialogue;
  int iterator;
  ArrayList story;
  PImage portrait_1, portrait_2;
  boolean onePortrait = false;
  boolean twoPortrait = false;
  boolean dark1, dark2;
  int tintVal = 120;
  //constructor
  dgBox(String tempString, int tempInt, ArrayList temp) 
  {  
    story=new ArrayList();
    iterator = 1;
    story = temp;
    dgBoxText = tempString;
    tempInt = textSpeed;
    pass = 0;  
    displayedText = 0;   
    on = false;
    turnOn=false;
    done = false;
    
    dark1 = false;
    dark2 = false;
    //==Dialogue=============================

     activeDialogue = (String) story.get(0);
    
    //========================================

  }
  
  dgBox(String tempString, int tempInt, ArrayList temp, PImage portrait, PImage portrait2) 
  {  
    story=new ArrayList();
    iterator = 1;
    story = temp;
    dgBoxText = tempString;
    tempInt = textSpeed;
    pass = 0;  
    displayedText = 0;   
    on = false;
    turnOn=false;
    done = false;
    //==Dialogue=============================
     activeDialogue = (String) story.get(0);
    //=======================================   
    portrait_1 = portrait;  
    portrait_2 = portrait2;  
    twoPortrait = true;    
    
    dark1 = false;
    dark2 = false;
  }
  
  dgBox(String tempString, int tempInt, ArrayList temp, PImage portrait) 
  {  
    story=new ArrayList();
    iterator = 1;
    story = temp;
    dgBoxText = tempString;
    tempInt = textSpeed;
    pass = 0;  
    displayedText = 0;   
    on = false;
    turnOn=false;
    done = false;
    //==Dialogue=============================
     activeDialogue = (String) story.get(0);
    //=======================================
    
    portrait_1 = portrait;    
    onePortrait=true;
    dark1 = false;
    dark2 = false;
  }
  
  void run() 
  {
     if (activeDialogue != getDialogue()) {
        updateString(activeDialogue);
    }
    if (on) {
      //================Base Funct=================
      int lineval = 39;
      if (onePortrait) {
        if (dark1) {tint(tintVal);}
        image(portrait_1,0,0);
        noTint();
      }
      else if (twoPortrait) {
        if (dark1) {tint(tintVal);}
        image(portrait_1,0,0);
        noTint();
        if (dark2) {tint(tintVal);}
        image(portrait_2,0,0);
        noTint();
      }
      image(diagBox,0,0);
      
      pass++;
      if (pass>=textSpeed)
      {
        pass = 0;
        if (displayedText<=dgBoxText.length()) {displayedText++;}
      }
      textFont(dgFont); 
      fill(30);
      for (int i = 0; i<displayedText; i++) 
      {
        if (dgBoxText.length()>lineval)
        {
          if (i<=lineval) {
            String temp = dgBoxText.substring(0,i); text(temp, 85,395);
          }
          else {
            if (i<=2*lineval){
             String temp = dgBoxText.substring(lineval,i);
             text(temp, 85,425);
            }
            else {String temp = dgBoxText.substring(lineval,74);
             text(temp, 85,425);
             }
          }
        }
        else {
          String temp = dgBoxText.substring(0,i);
          text(temp, 85,390);
        }
      }

      noFill();
      if (displayedText>=dgBoxText.length()) {done=true;}
        else {done=false;}
    }
    //===========Turn On/Off Funct=================
    else if (turnOn) {
      pass++; 
      if (pass>=25) {
        turnOn=false; on=true; pass=0; 
      if (onePortrait) {
        if (dark1) {tint(tintVal);}
        image(portrait_1,0,0);
        noTint();
      }
      else if (twoPortrait) {
        if (dark1) {tint(tintVal);}
        image(portrait_1,0,0);
        noTint();
        if (dark2) {tint(tintVal);}
        image(portrait_2,0,0);
        noTint();
      }      
      image(diagBox,0,0); 
      }
        if (onePortrait) {
          tint(255,pass*4*2.55);
          if (dark1) {tint(tintVal,pass*4*2.55);}
          image(portrait_1,0,0);
          noTint();
        }
        else if (twoPortrait) {
          tint(255,pass*4*2.55);
          if (dark1) {tint(tintVal,pass*4*2.55);}
          image(portrait_1,0,0);
          noTint();
          tint(255,pass*4*2.55);
          if (dark2) {tint(tintVal,pass*4*2.55);}
          image(portrait_2,0,0);
          noTint();
        }
       tint(255,pass*4*2.55);
       image(diagBox,0,0); 
       noTint();
    }
    else if (turnOff) {
      pass++; 
      if (pass>=25) {
        turnOff=false; pass=0; 
      }
      else{  
        if (onePortrait) {
          tint(255,255-pass*4*2.55);
          if (dark1) {tint(tintVal,255-pass*4*2.55);}
          image(portrait_1,0,0);
          noTint();
        }
        else if (twoPortrait) {
          tint(255,255-pass*4*2.55);
          if (dark1) {tint(tintVal,255-pass*4*2.55);}
          image(portrait_1,0,0);
          noTint();
          tint(255,255-pass*4*2.55);
          if (dark2) {tint(tintVal,255-pass*4*2.55);}
          image(portrait_2,0,0);
          noTint();
       }
       tint(255,255-pass*4*2.55);
       image(diagBox,0,0);
       noTint();
     }
    }
    //===End of Turn On/Off Funct================
  }
  
    
  void advanceDialogue()
  {
    if (isDone()) {
      if (!story.isEmpty()){
        if (iterator<story.size() ){iterator++;}
        else if (iterator>=(story.size()-2)) {
          if(iterator>=8) {theGame.actToggle();}
          turnOff();
        }
        activeDialogue=(String)story.get(iterator-1);
      }
    }
    else {setDone();}
  }
  
  
  void turnOn()
  {
    if (!on) {
      turnOn = true;
      pass = 0;
    }
  }
  
 void turnOff()
  {
    if (on){
      pass = 0;
      turnOff = true;
      on =false;
    }
  }
    
  String getDialogue()
  {
    return dgBoxText;
  }

  void updateString(String tempString) {
    dgBoxText = tempString;
    pass = 0;  
    displayedText = 0;   
  }
  
  void updateSpeed(int tempInt) {
    textSpeed = tempInt;
  }
  
  void setDone()
  {
    displayedText=dgBoxText.length();
  }
  
  boolean isDone()
  {
    return done;
  }

  boolean isOn()
  {
    return on;
  }
  
  void changePortrait1(PImage temp)
  {
    portrait_1 = temp;
  }
  
  void changePortrait2(PImage temp)
  {
    portrait_2 = temp;
  }
  
  int getIterator()
  {
    return iterator;
  }
  
  void setDark1 (boolean temp)
  {
    dark1 = temp;
  }
  
  void setDark2 (boolean temp)
  {
    dark2 = temp;
  }
  
  boolean isOff()
  {
    return turnOff;
  }
} 

//======================Clouds=======================


class cloud{
  float velocity;
  PImage cloudType;
  float startX;
  float startY;
  boolean active;
  float locX;
  float locY;
  float scaleVal;
  
   cloud()
   {
     imageMode(CORNER);
     cloudType = loadImage("cloud" + (int)random(1,10)+".PNG");
     scaleVal = random(.5,1);
     velocity = random (.5,2);
     startY = random(-40,210);
     //startX
     if (random(-1,1)>0) {startX= random(-120-cloudType.width,-(cloudType.width)); }
     else {startX= random(width+(cloudType.width),width+150+(cloudType.width)); velocity=velocity*-1;}


     active = true; 
     locX = startX;
     locY = startY;
     
   }
   
   void run()
   {
     //println ("X:"+locX);
     //println ("Y:"+locY);
     if (active) {
       pushMatrix();
         tint (255,200);
         //scale(scaleVal);
         image(cloudType,locX, locY);
         noTint();
       popMatrix();
       locX+=velocity;
       if (startX>=width+(cloudType.width)) 
       {
          if (locX<-(cloudType.width))
            {active=false;}
       }
       else if (locX>width) 
         {active=false;}
     }
   }
   boolean checkActive(){return active;}
}

//====================================================================================
//|                                     Objects                                      |
//====================================================================================

class hero 
{
  int heroX;
  int heroY;
  PImage active;
  boolean north, south, west, east;
  boolean walking;
  int pass;
  int passCounter;
  int heroSpeed;
  boolean heroActive;
  
  hero ()
  {
    heroSpeed =5;
    pass=0;
    passCounter=0;
    heroX=width/2;
    heroY=-20;
    south = true;
    north = false;
    west = false;
    east = false;
    walking = false;
    heroActive=true;
  }
  
  void run()
  {
    if (heroActive)
    {
      passCounter++;
      if (passCounter>5){pass++; passCounter=0;}
  
      if (walking)
      {
        if (south) {heroGuy.walkSouth(); heroY+=heroSpeed;}
        if (north) {heroGuy.walkNorth(); heroY-=heroSpeed;}
        if (west) {heroGuy.walkWest(); heroX-=heroSpeed;}
        if (east) {heroGuy.walkEast(); heroX+=heroSpeed;}
  
      }
      else{
        if (south) {heroGuy.standSouth();}
        if (north) {heroGuy.standNorth();}
        if (west) {heroGuy.standWest();}
        if (east) {heroGuy.standEast();}
      }
      image(active, heroX-12, heroY-35);
    }
  }
  
  void changeDirection (String temp)
  {
    if (temp=="south") {south=true; north=false; west=false; east=false;}
    else if (temp=="north") {south=false; north=true; west=false; east=false;}
    else if (temp=="west") {south=false; north=false; west=true; east=false;}
    else if (temp=="east") {south=false; north=false; west=false; east=true;}
  }
  
  void turnOff()
  {
    heroActive=false;
  }
  void standSouth()
  {
    if (pass>2) {pass=0;}
    active = heroSprite.get(pass*24, 0, 24, 40);
  }
  
  void standNorth()
  {
    if (pass>2) {pass=0;}
    active = heroSprite.get(pass*24, 40, 24, 40);
    
  }
  
  void standWest()
  {
    if (pass>2) {pass=0;}
    active = heroSprite.get(pass*24, 80, 24, 40);
  }
  
  void standEast()
  {
    if (pass>2) {pass=0;}
    active = heroSprite.get(pass*24, 120, 24, 40);
  }
  
  void walkSouth()
  {
    if (pass>3) {pass=0;}
    active = heroSprite.get(pass*24, 160, 24, 40);
  }
  
  void walkNorth()
  {
    if (pass>3) {pass=0;}
    active = heroSprite.get(pass*24, 200, 24, 40);
  }
  
  void walkWest()
  {
    if (pass>3) {pass=0;}
    active = heroSprite.get(pass*24, 240, 24, 40);
  }
  
  void walkEast()
  {
    if (pass>3) {pass=0;}
    active = heroSprite.get(pass*24, 280, 24, 40);
  }
  
  void goMove()
  {
    walking=true;
  }
  
  void goStop()
  {
    walking=false;
  }
  
  boolean getWalk ()
  {
    return walking;
  }
  
 int getX()
 {
   return heroX;
 }
 
 int getY()
 {
   return heroY;
 }
 
 void setX(int temp)
 {
   heroX=temp;
 }
 
  void setY(int temp)
 {
   heroY=temp;
 }
}

class wall
{
  int leftSide;
  int rightSide;
  int topSide;
  int botSide;
  int wallWidth;
  int wallHeight;
  int centerX;
  int centerY;
  
  
  wall(int leftX, int rightX, int topY, int botY)
  {
    leftX+=3;
    rightX+=3;
    topY+=3;
    botY+=3;
    leftSide =leftX;
    rightSide =rightX;
    topSide = topY;
    botSide = botY;
    centerY = topY + ((botY-topY)/2);
    centerX = leftX+ ((rightX-leftX)/2);
    wallWidth = rightX-leftX;
    wallHeight =  botY-topY;
  }
  
  void run ()
  {
    /*
    fill(0,100);
    rectMode(CENTER);
    rect(centerX, centerY, wallWidth, wallHeight);
    rectMode(CORNER);
    fill(0);*/
    checkCollision();
  }
  
  void checkCollision()
  {
    int tempX = heroGuy.getX();
    int tempY = heroGuy.getY();
    if (tempX>leftSide-12 && tempX<centerX && tempY>topSide && tempY<botSide+8) {heroGuy.setX(tempX-5);}
    else if (tempX<rightSide+12 && tempX>centerX && tempY>topSide && tempY<botSide+8) {heroGuy.setX(tempX+5);}
    else if (tempY>topSide-10 && tempY<centerY && tempX>leftSide && tempX<rightSide) {heroGuy.setY(tempY-5);}
    else if (tempY<botSide+13 && tempY>centerY && tempX>leftSide && tempX<rightSide) {heroGuy.setY(tempY+5);}
  }
  
}
  
//====================================================================================
//====================================================================================
//|                                      Misc                                        |
//====================================================================================
void dgBubble()
{
  if (heroGuy.getX()>403&&heroGuy.getX()<440&&heroGuy.getY()>152&&heroGuy.getY()<190)
 {
   image(dialogueBubble,0,0);
 }
 if (heroGuy.getX()>341&&heroGuy.getX()<374&&heroGuy.getY()>426&&heroGuy.getY()<442)
 {
   run7=true; 
   dialogueBox8.turnOn();
   activeDialogueBox = dialogueBox8;
 }
   
}

//=========
boolean ifDamage=false;
int damagePass = 0;
int interval=25;

//=========
void runDamage()
{
  if (ifDamage)
  {
    damagePass+=2;
    if (damagePass>250){damagePass=0; ifDamage=false;}
    if (ifDamage){
      tint(255,255-(damagePass*2.55));
      image(damage,580,225-damagePass);
      noTint();
      for(int i = 0; i*25<175;i++)
      {
        if (damagePass==2 || (damagePass%15==0 && damagePass<=200)) {
          for (int o=0; o<10;o++)
          {
            particles.add(new particle2((int)random(600,625)));
          }
        }
        if (damagePass>=interval*(i+1))
        {
          tint(255,255-((damagePass-interval*(i+1))*2.55));
          image(damage,580,225-(damagePass-interval*(i+1)));
          noTint();
        }
      }    
    }
  }
}

void damageOn()
{
  ifDamage=true;
}

boolean end = false;
void endOn()
{
  end=true;
}

int endPass=0;

void runEnd()
{
  
   endPass+=20; 
   tint(255,endPass);
   image(endBG,0,0);
   noTint();
}
//====================================================================================
//|                                    Particles                                     |
//====================================================================================
class particle
{
  color pColor;
  float initialVelocityX;
  float initialVelocityY;
  int posY;
  int posX;
  int alphaVal;
  int duration;
  int r;
  
  particle(int tempX)
  {
    pColor = color(random(90,150),random(180,255),255);
    posX=tempX;
    initialVelocityY=random(-2,0);
    initialVelocityX=random(-8,-3);
    posY=(int)random(275,295);
    duration=45;
  }
  
  void run()
  { 
    updateParticles();
    renderP();
  }
  
  void updateParticles()
  {
    posX+=initialVelocityX;
    posY+=initialVelocityY;
    initialVelocityX+=.4;
    initialVelocityY-=.15;
    duration -= 1; 
    r = (int)random(5,6);
  }
  
  void renderP() {
    pushMatrix();
      noStroke();
      ellipseMode(CENTER);
      for (int i = 0; i < 9; i++)
      {
        fill(pColor, (duration*(255/45)/(9-i)));
        ellipse(posX, posY, 9-i, 9-i);
        noFill();
      }
      popMatrix();
  }
  
  boolean isActive() {
    if (duration <= 0.0) {
      return false;
    } else {
      return true;
    }
  }
}

class particle2
{
  color pColor;
  float initialVelocityX;
  float initialVelocityY;
  int posY;
  int posX;
  int alphaVal;
  int duration;
  int r;
  
  particle2(int tempX)
  {
    pColor = color(random(200,225),random(80,255),random(15,45));
    posX=tempX;
    initialVelocityY=random(-2,2);
    initialVelocityX=random(2,4);
    posY=(int)random(275,295);
    duration=45;
  }
  
  void run()
  { 
    updateParticles();
    renderP();
  }
  
  void updateParticles()
  {
    posX+=initialVelocityX;
    posY+=initialVelocityY;
    initialVelocityX+=.2;
    initialVelocityY-=.1;
    duration -= 1; 
    r = (int)random(5,6);
  }
  
  void renderP() {
    pushMatrix();
      noStroke();
      ellipseMode(CENTER);
      for (int i = 0; i < 9; i++)
      {
        int temp = (duration*(255/45)/(9-i))-20;
        if (temp<0) {temp=0;}
        fill(pColor, temp);
        ellipse(posX, posY, 9-i, 9-i);
        noFill();
      }
      popMatrix();
  }
  
  boolean isActive() {
    if (duration <= 0.0) {
      return false;
    } else {
      return true;
    }
  }
}


//====================================================================================
//|                                    Controls                                      |
//====================================================================================


void mouseClicked()
{
  println ("X: " + mouseX);
  println ("Y: " + mouseY);
  if (gameActive) {activeDialogueBox.advanceDialogue();}
  if (!gameActive && !exitScreen){
    if (mouseX>275&&mouseX<(275+190)&&mouseY>330&&mouseY<360)
    {
      exitScreen=true;
    }
    if (mouseX>330&&mouseX<410&&mouseY>370&&mouseY<400)
    {exit();}
  }
  
  boolean temp = true;
  if (dialogueBox.isOn()) {temp=false;}
  else if (dialogueBox2.isOn()) {temp=false;}
  else if (dialogueBox3.isOn()) {temp=false;}
  else if (dialogueBox4.isOn()) {temp=false;}
  else if (dialogueBox5.isOn()) {temp=false;}
  else if (dialogueBox6.isOn()) {temp=false;}
  else if (dialogueBox7.isOn()) {temp=false;}
  else if (dialogueBox8.isOn()) {temp=false;}
  
  if (gameActive && runPossibleMovesBoolean && !activeFight && temp)
  {
    if (mouseX>262&&mouseX<459&&mouseY>371&&mouseY<392){activeFight=true;}
    if (mouseX>262&&mouseX<459&&mouseY>403&&mouseY<423){activeFight=true;}
    //rect(262,371,459-262,392-368);
    //rect(262,403,459-262,423-401);
  }
}



void mouseMoved() {
  if (!gameActive) {
    if (mouseX>275&&mouseX<(275+190)&&mouseY>330&&mouseY<360)
    {mouseHover1 = true; mouseActive=true;}
    else {mouseHover1 = false;}
    if (mouseX>330&&mouseX<410&&mouseY>370&&mouseY<400)
    {mouseHover2 = true; mouseActive=true;}
    else {mouseHover2 = false;} 
    if (!(mouseX>275&&mouseX<(275+190)&&mouseY>330&&mouseY<360) && !(mouseX>330&&mouseX<410&&mouseY>370&&mouseY<400))
      { mouseActive=false; }
  } 
  if (gameActive && !runPossibleMovesBoolean)
  {mouseActive=false;}
  
  if (gameActive && runPossibleMovesBoolean)
  {
    if (mouseX>262&&mouseX<459&&mouseY>371&&mouseY<392){pMoves1 = true; mouseActive=true;}
      else {pMoves1 = false;}
    if (mouseX>262&&mouseX<459&&mouseY>403&&mouseY<423){pMoves2 = true; mouseActive=true;}
      else {pMoves2 = false;}
    //rect(262,371,459-262,392-368);
    //rect(262,403,459-262,423-401);
    if (!(mouseX>262&&mouseX<459&&mouseY>371&&mouseY<392) && !(mouseX>262&&mouseX<459&&mouseY>403&&mouseY<423)) {mouseActive=false;}
  }
}

boolean[] keys = new boolean[4];

void keyPressed() {
  
  boolean temp = true;
  if (dialogueBox.isOn()) {temp=false;}
  else if (dialogueBox2.isOn()) {temp=false;}
  else if (dialogueBox3.isOn()) {temp=false;}
  else if (dialogueBox4.isOn()) {temp=false;}
  else if (dialogueBox5.isOn()) {temp=false;}
  else if (dialogueBox6.isOn()) {temp=false;}
  else if (dialogueBox7.isOn()) {temp=false;}
  else if (dialogueBox8.isOn()) {temp=false;}
    if (key == CODED && gameActive && temp) {
    if (keyCode == UP) {heroGuy.changeDirection("north"); heroGuy.goMove(); keys[0] = true;}
    if (keyCode == DOWN) {heroGuy.changeDirection("south"); heroGuy.goMove(); keys[1] = true;}
    if (keyCode == LEFT) {heroGuy.changeDirection("west"); heroGuy.goMove(); keys[2] = true;}
    if (keyCode == RIGHT) {heroGuy.changeDirection("east"); heroGuy.goMove(); keys[3] = true;}
  }
  else if (gameActive && key == 'z') {activeDialogueBox.advanceDialogue();}
  
  if (!gameActive && key=='z' && !exitScreen)
  {
    exitScreen=true;
  } 
  
  if(gameActive && key=='z' && heroGuy.getX()>403&&heroGuy.getX()<440&&heroGuy.getY()>152&&heroGuy.getY()<190)
  {
     if (!run2)
    {
      run2=true; 
      dialogueBox3.turnOn();
      activeDialogueBox = dialogueBox3;
    }
  }
}

void keyReleased() { 
  
  if (key == CODED ) {
       if (keyCode == UP) {keys[0] = false;}
       else if (keyCode == DOWN) {keys[1] = false;}
       else if (keyCode == LEFT) {keys[2] = false;}
       else if (keyCode == RIGHT) {keys[3] = false;}
     }
     
  if (!keys[0] && !keys[1] && !keys[2] && !keys[3] && key != 'z' && theGame.checkHub())
  {
    heroGuy.goStop();
  }
}
