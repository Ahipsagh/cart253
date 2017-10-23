//------------------------------------------------------------------------------------//
// CART253
// Exercise 04    : Arrays
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//------------------------------------------------------------------------------------//
// Griddies
// by Pippin Barr
// MODIFIED BY: Ariana Hipsagh
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[10];

 // Image
  PImage[] aFish = new PImage[6];
  Fish[] rFish=new Fish[6];
  int ranLength = int(random(1, aFish.length));  // random number of fish
//------------------------------------------------------------------------------------//
// M A I N
// this is the main program that invokes the Griddie Class by passing attributes
//------------------------------------------------------------------------------------//
//
// setup()
//
// Set up the window and the griddies
//------------------------------------------------------------------------------------//
void setup() {
//------------------------------------------------------------------------------------//
// Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);
  
    // Load fish images into array
   
   for (int i= 0; i< aFish.length; i++)
{
  aFish[i] = loadImage("fish"+i+".png");  // loading the array with fish pics
}
// add new creature fish
     for (int i= 0; i< ranLength; i++)
{
  // Create the Griddie at the centre of the screen
  int index = int(random(0, aFish.length));   // random fish pictures
  
  //Griddie = new Griddie(aFish[index], width/2, height/2);
  rFish[i] = new Fish(aFish[index], width/2, height/2);
}

  // QUESTION: What does this for loop do?
  // Load the array of griddies into the array of 100 griddies at grid size 20 and random x, y coordinates.
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
  

}

// draw()
//
// Update all the griddies, check for collisions between them, display them.
//------------------------------------------------------------------------------------//
void draw() {
//------------------------------------------------------------------------------------//
background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {
    println(griddies.length + " i=" + i );

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // This is to create another array of griddies for the purpose of determining if 
      // if any of the griddies had collided (ie. same (x,y) coordinates) with one another.
      // Each griddie in array "i" is compared to the entire array copied into array "j" to
      // the exclusion of itself.
      if (j != i) {
         // QUESTION: What does this line check?
         // As long as the griddie you compare to is not equal to itself ( which means that they 
         // have the same (x,y) coordinates ), go ahead and check for collision.  
        griddies[i].collide(griddies[j]);
      }
    }
    // Display the creature aFish
      for (int f= 0; f< ranLength; f++)
{
  rFish[f].display();
}   
    // Display the griddies
    griddies[i].display();
  }
}
//------------------------------------------------------------------------------------//
// P R O G R A M   E N D
//------------------------------------------------------------------------------------//
//--Exercise requirements by Pippin Barr ---------------------------------------------//
//
/*
Exercise Steps

0. DONE
Take the exercise code below and put it into a new Processing sketch called exercise04 
and place it in your exercises folder in your local repository. (Note that there are 
two files this time, so you'll need to add a tab called Griddie and put the appropriate 
code in it too.)

1. DONE
Commit this change with a message like "Started exercise 04"

2. DONE
Go through the code and make sure you understand how it works (run it too of course!), 
then answer the QUESTIONS in the comments by writing your own comments below them to 
prove that you understand what is happening.

3. DONE
Commit this change with a message like "Answered exercise questions".

4.
_Add a new class that defines a new creature that will exist in the system and add some 
number of these creature in an array in the main program in the same way as the Griddies 
(make sure you update and display your new creatures)

5.
Commit this change with a message like "Added new creature" and a description of the 
creature.

6.
If you haven't already, make the new creatures interact with the Griddies in some way that 
you find interesting

7.
Commit this change with a message like "Added interaction between creatures" and a 
description of the interaction

8.
Don't forget to push your repository to github.com either at the end or throughout

9.
You're done!

Challenge: Can you learn enough about arrays (or ArrayLists) to be able to add new 
creatures dynamically while the program is running? Can you then make your creature 
have 'babies' with the Griddies when they overlap? Can you set conditions based on 
energy to determine what kind of babies they have?
--END of requirements by Pippin Barr -------------------------------------------------//
*/