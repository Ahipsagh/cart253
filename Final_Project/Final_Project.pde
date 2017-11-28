
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
//
//
// 
// Declare variables
//------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------//
// Environment
//------------------------------------------------------------------------------------//
//

// Global variables 
PImage img;
PImage[] aHeart = new PImage[7];
// Import the Sprites library (you need to install
// it if you don't have it)
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

// Create a Sprite for our avatar
Sprite avatar;

// Create a StopWatch to keep track of time passing
// (So we know how fast the animation should run.)
StopWatch timer = new StopWatch();

// How fast the avatar mores (pixels per second)
float avatarSpeed = 50; 

Heart[] Heart= new Heart[4];

void setup()
{
  size(1920,1080);
//  img = loadImage("background.png");

for (int i= 0; i< aHeart.length; i++)
{
  aHeart[i] = loadImage("heart"+0+".png");

}
for (int i= 0; i< Heart.length; i++)
{
 // loading random Heart images into an image array
  int index = int(random(0, aHeart.length));
  Heart[i] = new Heart(aHeart[index], 100+i*100, 300, random (32, 72));
}
//Red Alert ! -------------------- Sprite library stuff follows
  // Create our Sprite by providing "this", the file
  // with the spritesheet, the number of columns in the
  // sheet, the number of rows in the sheet, and the
  // z-depth of this sprite
  avatar = new Sprite(this, "avatar.png", 24, 1, 0);
  // Set the avatar's position on screen
  avatar.setXY(width/2, height/2);
  // Set the default (idle) frame sequence from the
  // sheet to animate
  avatar.setFrameSequence(22, 22);
   //Red Alert ends here.-----------------------------------Ok
  
}

void draw() {
  
 // background(127);
 //   image(img,width/2,height/2);
  
for (int i= 0; i< Heart.length; i++)
{
Heart[i].ascend();
Heart[i].display();
}
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

  // Handle input is a key is pressed
  if (keyPressed) {
    if (keyCode == LEFT) {
      // If they press left, set up the walking animation
      // (Tragically we only have animation for walking to
      // the right, so this avatar will have to moon walk.)
      avatar.setFrameSequence(7, 0, 0.1);
      // Set a negative velocity (so the avatar moves left)
      avatar.setVelXY(-avatarSpeed, 0);
    } else if (keyCode == RIGHT) {
      // If they press right, set the walking animation frames
      avatar.setFrameSequence(7, 0, 0.1);
      // And set a positive velocity
      avatar.setVelXY(avatarSpeed, 0);
    }
  } else {
    // If no key is pressed then return to the idel frame
    avatar.setFrameSequence(22, 22);
    // And turn off velocity
    avatar.setVelXY(0,0);
  }
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