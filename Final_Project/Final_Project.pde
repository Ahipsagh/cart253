
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
//
// 
// Declare variables
//------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------//
// Environment
//------------------------------------------------------------------------------------//
//

// Global variables 
// Show counter on screen
Score score;
PImage bgimg;
PImage img;
int counter = 0;
boolean gameIsOver=false;   // control when game is over
boolean winner=false;       // winner is detected by color
//Red Alert ! -------------------- Sprite library stuff follows
// Import the Sprites library (you need to install
// it if you don't have it)

import sprites.*;
import sprites.maths.*;
import sprites.utils.*;





// Create a Sprite for our avatar
Sprite avatar;

// Create a Sprite for our enemy
Sprite enemy;

//Sprite heartSprite;
ArrayList<HeartSprite> heartSprites;
int heartSpriteWidth =350;

// Create a StopWatch to keep track of time passing
// (So we know how fast the animation should run.)
StopWatch timer = new StopWatch();

// How fast the avatar mores (pixels per second)
float avatarSpeed = 50; 
float enemySpeed = 25; 
//Red Alert ends here.-----------------------------------Ok


void setup()
{
  size(500, 500);
  score = new Score(counter);
  bgimg = loadImage("background.png");
  img = loadImage("heart0.png");
  image(img, 200, 200, 10, 10);
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
  avatar.setXY(width/2, height-100); // on the floor of bedroom
  // Set the default (idle) frame sequence from the
  // sheet to animate
  avatar.setFrameSequence(1, 4);
  // create enemy sprite follows
  enemy = new Sprite(this, "fish0.png", 1, 1, 0);
  // Set the enemy's position on screen
  enemy.setXY(width, height-100); // on the floor of bedroom
  // Set the default (idle) frame sequence from the
  // sheet to animate
  enemy.setFrameSequence(1, 1);
  //Red Alert ends here.-----------------------------------Ok


  //Add to the ArrayList by Clicking on mouse
  //void mousePressed() {
  // A new HeartSprite object is added to the ArrayList (by default to the end)
  for (int i=0; i<42; i++) 
    heartSprites.add(new HeartSprite(this, img, random(width), random(height), heartSpriteWidth));
}

void draw() {

  // background(127);
  image(bgimg, width/2, height/2);

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
    //println("Item: " +  " Sprite" + heartSprite);
    //println("Item: " +  " Sprite" + heartSprite.getPos  ());
    heartSprite.ascend();
    //heartSprite.display();
    //heartSprite.move();
    heartSprite.display();
    //    println("Item: " +  " Sprite has collided :" + heartSprite.bb_collision(avatar));
    if (heartSprite.bb_collision(avatar)) {
      counter++;
      println(counter);
      score.display();
      heartSprites.remove(heartSprite);
      //    println("Item: " +  " Sprite");
      heartSprite.setDead(true);
      // heartSprite.display();
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
      println("left");
      // If they press left, set up the walking animation
      // (Tragically we only have animation for walking to
      // the right, so this avatar will have to moon walk.)
      avatar.setFrameSequence(4, 7, 0.1);
      // Set a negative velocity (so the avatar moves left)
      avatar.setVelXY(-avatarSpeed, 0);
    } else if (keyCode == RIGHT) {
      println("right");
      // If they press right, set the walking animation frames
      avatar.setFrameSequence(12, 15, 0.1);
      // And set a positive velocity
      avatar.setVelXY(avatarSpeed, 0);
    } else if (keyCode == UP) {
      println("up");
      // If they press up, set the walking animation frames
      avatar.setFrameSequence(8, 11, 0.1);
      // And set a positive velocity
      avatar.setVelXY(0, -avatarSpeed);
    } else if (keyCode == DOWN) {
      println("down");
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
      enemy.setFrameSequence(1, 1, 0.1);
      // And set a positive velocity
      enemy.setVelXY(enemySpeed, 0);
    //Red Alert ends here.-----------------------------------Ok
  }
  /*
//------------------------------------------------------------------------------------//
   
   Create a prototype of a key part of your final project. - REDO
   
   Brief
   
   Because it's time to be focused entirely on the final project, this week's exercise is 
   to make sure you build a prototype of some part of that project. The best idea would be 
   to create a prototype that has the absolutely most basic features of your project (such 
   as moving an avatar and collecting items, say). Placeholder art (including just shapes) 
   is completely fine. The key is to get the basic code for your project working and 
   experienceable.
   
   If you have already created such a prototype (which would have been a good idea anyway), 
   feel free to tidy it up, comment it well, make sure your variable names are sensible, and 
   then submit it. Make a note in your code if you have fewer than the minimum commits 
   because you had already written it earlier.
   
   Exercise Steps
   
   Because there isn't a set of steps to follow you should just make sure to follow the 
   basic process of using Git to track your work:
   
   0. Version 2.0 Begins - Done
   Come up with an idea for part of your prototype
   
   1.
   Write some code that achieves that and comment it clearly
   
   2.
   Commit this code with a message that describes what you added
   
   3.
   Push your changes at regular intervals
   
   4.
   Repeat
   // Requirements as per Pippin Barr----------------------------------------------------//
   
   */