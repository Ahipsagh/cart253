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
//  Karaoke Time !
//
//  This is the song that never ends (in a loop) that you can control by volume adjustment.
//  The red circle can be moved left and right to go from 0 to maximum volume.
//  The blue box increases or decreases in size depending on the volume.
//
//  The lower green box is the Karaoke part.  The louder your voice resonates the larger 
//  the green box becomes.  The mic rectangle is increased by a factor of ten.
//
//  You can toggle between stopping and playing the song that does not end by clicking 
//  the mouse.
//------------------------------------------------------------------------------------//

// importing the libraries.
import ddf.minim.*;
import processing.sound.*;

Minim minim;
SoundFile song;
AudioInput mic; // The class that lets us get at the microphone

float volume = map(mouseX, 0, width, 0, 1);
boolean songPlays=true; // used to toggle play and stop

void setup() {
  size(500, 500);
  minim = new Minim(this);
  // We use minim.getLineIn() to get access to the microphone data
  mic = minim.getLineIn();
  song = new SoundFile(this, "sounds/song.wav");
  // the song loops until the mouse is clicked.
  song.loop();
}

void draw() {
  background(0);
  rectMode(CENTER);
  // Get the current level (volume) going into the microphone
  float level = mic.mix.level();
  // Draw a rectangle with dimensions defined by song volume level (BLUE)
  float volume = map(mouseX, 0, width, 0, 1);
  song.amp(volume);
  // the mic volume is illustrated by the box in the lower right corner (GREEN)
  stroke(0);
  fill(0, 255, 0);
  rect(width, height, width * level*10, height * level*10);
  stroke(0);
  fill(0, 0, 255);
  rect(width/8, height/8, width * volume, height * volume);

  // Draw a circles that increases and decreases the volume of the song by te mouseX coordinate. (RED)
  stroke(0);
  fill(255, 0, 0);
  ellipse(mouseX, 100, 48, 48);
}

void mouseClicked() {
  if (songPlays) 
  {
    song.stop(); // Make it stop! Make it stop!
    songPlays=false;
  } else
  {
    song.loop();
    songPlays=true;
  }
}

/*------------------------------------------------------------------------------------//
 
 Brief
 
 Option one: create a small program that generates music based on input through the
 mouse/keyboard/webcam/image/something. For example, you might use the Bouncer class
 and have a Bouncer make a sound when it bounces off the window. If you let the user
 add Bouncers to the scene, they could use them to compose music! Or you might create
 a program that takes an image as input and turns it into music by translating the 
 colours of pixels into tones played by an oscillator.
 
 0. Done - Karaoke with volume control
 Come up with an idea for part of your program
 
 1. Done
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