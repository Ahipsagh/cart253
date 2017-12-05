
//------------------------------------------------------------------------------------//
// CART253
// Final Project  : Be Love
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//
//------------------------------------------------------------------------------------//
// Be Love
// GitHub testing to make sure that it works from the desktop.
// Let's add some sound.
// Able to crash the sketch from Concordia !
// Declare variables
//------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------//
// Environment
//------------------------------------------------------------------------------------//
//
// importing the libraries.
import ddf.minim.*;
import processing.sound.*;

import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Minim minim;

SoundFile song;
SoundFile heartCollected;
SoundFile win;
SoundFile lose;

//AudioInput mic; // The class that lets us get at the microphone
//float volume = map(mouseX, 0, width, 0, 1);
boolean songPlays=true; // used to toggle play and stop

// Global variables 
// Show counter on screen
Score score;



PImage bgimg;
PImage img;
int counter = 0;
boolean gameIsOver=false;   // control when game is over
String winner=null;       // winner is detected by color

//Red Alert ! -------------------- Sprite library stuff follows
// Import the Sprites library (you need to install
// it if you don't have it)







// Create a Sprite for our avatar
Sprite avatar;

// Create a Sprite for our enemy
Sprite enemy;

//Sprite heartSprite;
ArrayList<HeartSprite> heartSprites;
int heartSpriteWidth =(int)random(100,175);

// Create a StopWatch to keep track of time passing
// (So we know how fast the animation should run.)
StopWatch timer = new StopWatch();

// How fast the avatar mores (pixels per second)
float avatarSpeed = 200; 
float enemySpeed = 60; 
//Red Alert ends here.-----------------------------------Ok


void setup()
{
  size(1920, 1080);
//size(960, 540);
  minim = new Minim(this);
  // We use minim.getLineIn() to get access to the microphone data
  // mic = minim.getLineIn();
  //  stereoSound = minim.loadFile("sounds/song.wav");
  song = new SoundFile(this, "sounds/background.mp3");
  heartCollected = new SoundFile(this, "sounds/heart_collected.mp3");
  win = new SoundFile(this, "sounds/win.mp3");
  lose = new SoundFile(this, "sounds/lose.mp3");
  // the song loops until the mouse is clicked.
  song.loop();


  score = new Score(counter);
  bgimg = loadImage("background.png");
  img = loadImage("heart0.png");
  
  //Arraylist 
  // Create an empty ArrayList (will store HeartSprite objects)
  heartSprites = new ArrayList<HeartSprite>();

  // Start by adding one element

  heartSprites.add(new HeartSprite(this, img, mouseX, mouseY, heartSpriteWidth));
  //Arraylist ends
  //Red Alert ! -------------------- Sprite library stuff follows
  // Create our Sprite by providing "this", the file
  // with the spritesheet, the number of columns in the
  // sheet, the number of rows in the sheet, and the
  // z-depth of this sprite
  avatar = new Sprite(this, "avatar.png", 4, 4, 0);
  // Set the avatar's position on screen
  avatar.setXY(width/2, height-300); // on the floor of bedroom
  // Set the default (idle) frame sequence from the
  // sheet to animate
  avatar.setFrameSequence(1, 4);
  
  
  // create enemy sprite follows
  enemy = new Sprite(this, "fish6.png", 1, 1, 0);
  // Set the enemy's position on screen
  enemy.setXY(width, height-300); // on the floor of bedroom
  // Set the default (idle) frame sequence from the
  // sheet to animate
  enemy.setFrameSequence(1, 1);
  //Red Alert ends here.-----------------------------------Ok


  //Add to the ArrayList by Clicking on mouse
  //void mousePressed() {
  // A new HeartSprite object is added to the ArrayList (by default to the end)
  for (int i=0; i<42; i++) 
    heartSprites.add(new HeartSprite(this, img, random(width-100), random(height-100), heartSpriteWidth));
}

void draw() {


//while (gameIsOver==false)
//{  

  // background(127);
  image(bgimg, width/2, height/2);
  
// set up the Array list of Hearts (Sprite)  
  //ArrayList
  // With an array, we say HeartSprites.length, with an ArrayList, we say HeartSprites.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list 
  score.display();

  for (int i = heartSprites.size()-1; i >0; i--) 
  { 
    HeartSprite heartSprite = heartSprites.get(i);
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    //heartSprite.move();
    heartSprite.ascend();
    heartSprite.display();


//  Here the heart (Sprite) are collected and removed from the arraylsit with the method
// heartSprite.bb_collision(avatar)
    if (heartSprite.bb_collision(avatar)) {
      counter++;
      heartCollected.amp(0.5);
      heartCollected.play();
      score.update();
      score.display();
      heartSprites.remove(heartSprite);
      heartSprite.setDead(true); // is it really dead ?
      heartSprite.display();
    }
  }  

  //ArrayList ends
  //Red Alert ! -------------------- Sprite library stuff follows
  // Sprites library stuff!
  // We get the time elapsed since the last frame (the deltaTime)
  double deltaTime = timer.getElapsedTime();
  // We update the sprites in the program based on that delta
  S4P.updateSprites(deltaTime);
  // Then we draw them on the screen
  S4P.drawSprites();

  // If the avatar goes off the left or right
  // wrap it around
  if (avatar.getX() > width) {
    avatar.setX(avatar.getX() - width);
  } else if (avatar.getX() < 0) {
    avatar.setX(avatar.getX() + width);
  }
  // If the avatar goes off the top or bottom
  // wrap it around
  if (avatar.getY() > height) {
    avatar.setY(avatar.getY() - height);
  } else if (avatar.getY() < 0) {
    avatar.setY(avatar.getY() + height);
  }
  // If the enemy goes off the left or right
  // wrap it around
  if (enemy.getX() > width) {
    enemy.setX(enemy.getX() - width);
  } else if (enemy.getX() < 0) {
    enemy.setX(enemy.getX() + width);
  }
  // Handle input is a key is pressed
  if (keyPressed) {

    if (keyCode == LEFT) {

      // If they press left, set up the walking animation
      // (Tragically we only have animation for walking to
      // the right, so this avatar will have to moon walk.)
      avatar.setFrameSequence(4, 7, 0.1);
      // Set a negative velocity (so the avatar moves left)
      avatar.setVelXY(-avatarSpeed, 0);
    } else if (keyCode == RIGHT) {

      // If they press right, set the walking animation frames
      avatar.setFrameSequence(12, 15, 0.1);
      // And set a positive velocity
      avatar.setVelXY(avatarSpeed, 0);
    } else if (keyCode == UP) {

      // If they press up, set the walking animation frames
      avatar.setFrameSequence(8, 11, 0.1);
      // And set a positive velocity
      avatar.setVelXY(0, -avatarSpeed);
    } else if (keyCode == DOWN) {

      // If they press down, set the walking animation frames
      avatar.setFrameSequence(0, 3, 0.1);
      // And set a positive velocity
      avatar.setVelXY(0, avatarSpeed);
    }
  } else {
    // If no key is pressed then return to the idel frame
    avatar.setFrameSequence(2, 3, 0.5);
    // And turn off velocity
    avatar.setVelXY(0, 0);
  }
  // enemy stays on the floor and goes automatically from left to right

  enemy.setFrameSequence(1, 1, 0.2);
  // And set a positive velocity
  enemy.setVelXY(enemySpeed, 0);
  //Red Alert ends here.-----------------------------------Ok



//The monster works on a timer.  When the time is up and the avatar has not collected all the hearts
// monster wins.
if ( (gameIsOver ==false) &&
     (timer.getRunTime() >= 42.0) )
  {
    winner="monster";
    gameIsOver=true;
  }
// show the gameOver screen
  if (gameIsOver==true)
  {
    score.gameOver();
  }
}

void mouseClicked() {
  if (songPlays) 
  {
    song.stop(); // You can click background music to stop 
    songPlays=false;
  } else
  {
    song.amp(0.5);// You can click background music to start again at half the volume 
    song.loop();
    songPlays=true;
  }
}

/*
//------------------------------------------------------------------------------------//
 
The submitted project is worth 40% of your final grade. You will be graded on the following 
criteria for your work:

Implementation (50%)
--------------------

0. Free of errors in the console
-ERROR: /node/free: Node 83 not found ; this is due to sound.  Of course it did not work at 
all on Windows Desktop.

1. Your work should run and be without glitches and bugs

2. Ambitious use of coding techniques taught during the class

3. Bonus points available for using material not taught during the class
- arrayList, extend object, had to add some fancy stuff and therefore called for some tech support.

4. Level of complexity of implementation will be taken into account (but it's more important that 
it works than that it is complicated!)


Creativity (20%)
----------------

5. Original, personal, and creative work

6. Focus especially on how your are using programming specifically as part of your creative process

7. The artist's statement will help in understanding why your work is interesting and creative


Style and structure (30%)
-------------------------

8. Correct submission of work

9. Correct indenting and use of white space to make code readable

10.Sufficient use of commenting to explain the code

11.Comments clearly signpost and give credit for any code you have taken from elsewhere

12.Comments clearly explain the added code

13.Follows naming conventions established in class (e.g. camelCase)

14.Sensible and clear naming of variables and functions

15.Sensible and clear use of object-oriented programming

16.Sensible and clear commit messages on GitHub

17.Sensible use of commits to update the project incrementally with added functionality each time

// Requirements as per Pippin Barr----------------------------------------------------//
 
 */