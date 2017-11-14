//------------------------------------------------------------------------------------//
// CART253
// Exercise 07    : Sound
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//
//------------------------------------------------------------------------------------//
import ddf.minim.*;
Minim minim;
AudioInput mic; // The class that lets us get at the microphone
void setup() {
  size(500,500);
  minim = new Minim(this);
  // We use minim.getLineIn() to get access to the microphone data
  mic = minim.getLineIn();
}
void draw() {
  background(0);
  rectMode(CENTER);
  // Get the current level (volume) going into the microphone
  float level = mic.mix.level();
  // Draw a rectangle with dimensions defined by microphone level
  rect(width/2, height/2, width * level*10, height * level*10);
}
/*------------------------------------------------------------------------------------//

Brief

Option one: create a small program that generates music based on input through the
mouse/keyboard/webcam/image/something. For example, you might use the Bouncer class
and have a Bouncer make a sound when it bounces off the window. If you let the user
add Bouncers to the scene, they could use them to compose music! Or you might create
a program that takes an image as input and turns it into music by translating the 
colours of pixels into tones played by an oscillator.

0.
Come up with an idea for part of your program

1.
Write some code that achieves that and comment it clearly

2.
Commit this code with a message that describes what you added

3.
Push your changes at regular intervals

4.
Repeat

Then at the end (or throughout), don't forget to push your repository one last time to github.com

Don't write your entire exercise and then submit. You can't have too many commits. You can have too few.

-- Requirements as per Pippin Barr----------------------------------------------------
*/