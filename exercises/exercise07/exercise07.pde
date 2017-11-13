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
import processing.sound.*;
import ddf.minim.analysis.*; // We need this one for FFT
Minim minim; // Minim has a special class to handle sound tasks
AudioPlayer stereoSound; // And a separate class for something like an audio file
//SoundFile song;
AudioInput mic; // Microphone input
FFT fft; // Fast Fourier Transforms
void setup() {
  size(500, 500);
  minim = new Minim(this); // Create Minim
  mic = minim.getLineIn(); // Get the microphone
  fft = new FFT(mic.bufferSize(), mic.sampleRate()); // Create our FFT
// song = new SoundFile(this, "sounds/song.wav");
//  song.loop();
  stereoSound = minim.loadFile("sounds/stereo_sound_file.wav"); // Load our sound file
}
void draw() {
  background(0);
  fft.forward(mic.mix); // Apply the FFT to the current input
  // Now go through the spectrum generated
  for (int i = 0; i < fft.specSize(); i++) {
    // Get the value of this band
    float b = fft.getBand(i);
    // Map the location in the spectrum to x
    float x = map(i, 0, fft.specSize(), 0, width);
    // Map the amplitude of the band to height
    float h = map(b, 0, 10, 0, height);
    // Draw a line representing this band
    line(x,height - h,x,height);
//    float newRate = map(mouseX,0,width,0.01,5);
//    song.rate(newRate);
  }
}
   void mouseClicked() {
  stereoSound.loop(); // Now this works fine

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