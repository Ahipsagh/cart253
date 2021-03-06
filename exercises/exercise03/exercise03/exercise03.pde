//------------------------------------------------------------------------------------//
// CART253
// Exercise 03    : Objects
// Professor      : Pippin Barr
// Student        : Ariana Hipsagh
// Student Number : 22689812
// Repository     : https://github.com/ahipsagh/cart253
// email          : ani.ariane.hipsagh@gmail.com
//
//------------------------------------------------------------------------------------//
// Environment
// background color and create 2 bouncers
//------------------------------------------------------------------------------------//
//
color backgroundColor = color(200, 150, 150);
Bouncer bouncer;
Bouncer bouncer2;
Bouncer bouncer3;

//------------------------------------------------------------------------------------//
// M A I N
// this is the main program that invokes the Bouncer Class by passing attributes
//------------------------------------------------------------------------------------//
//
void setup() {
  size(640, 480);
  background(backgroundColor);
  //------------------------------------------------------------------------------------//
  // invoke bouncer with attributes :
  //
  // x    = tempX      = x coordinate - horizonal location on screen
  // y    = tempY      = y coordinate - vertical location on screen
  // vx   = tempVX     = vx coordinate - horizonal velocity
  // vy   = tempVY     = vy coordinate - vertical velocity
  // size = tempSize   = 
  // color= tempDefaultColor=
  // hoverColor= tempHoverColor=
  //------------------------------------------------------------------------------------//  
  //
   bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
   bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
   bouncer3 = new Bouncer(width/2,height/2,-2,2,50,color(50,0,150,50),color(0,200,255,50));
 
  //ah int tempX     = width/2;
  //ah int tempY     = height/2;
  //ah  int tempVX    = 2;
  //ah int tempVY    = 2;
  //ah int tempSize  = 10;
  //ah  color tempDefaultColor = color(0,0,0,50);
  //ah  color tempHoverColor = color(255,0,0,50);
  //ah test section
  //ahbouncer = new Bouncer(tempX, tempY, tempVX, tempVY, tempSize, tempDefaultColor, tempHoverColor);
  //ahbouncer2 = new Bouncer(width/2, height/2, -2, 2, 50, color(0, 0, 150, 50), color(0, 255, 0, 50));
}

void draw() {
  bouncer.update();
  bouncer2.update();
    bouncer3.update();
  bouncer.draw();
  bouncer2.draw();
 bouncer3.draw();
}
//------------------------------------------------------------------------------------//
// P R O G R A M   E N D
//------------------------------------------------------------------------------------//
//--Exercise requirements by Pippin Barr -------------------------------------------------------------------------------//
//
// 0.DONE
// Take the exercise code below and put it into a new Processing sketch called exercise03 and place it in your exercises 
// folder in your local repository. (Note that there are two files this time, so you'll need to add a tab called Bouncer 
// and put the appropriate code in it too.)
//
// 1.DONE
// Commit this change with a message like "Started exercise 03"
//
// 2.DONE
// Go through the code and make sure you understand how it works (run it too of course!), then comment the code to prove
// that you understand what is happening. Make sure you comment at the top of every file to explain what it does, at the
// top of each function to explain what it does, and then above any lines that need explaining (explain if statements and
// loops, for example, or maths or anything slightly complex)
//
// 3.DONE
// Commit this change with a message like "Commented exercise code".
//
// 4.DONE
// Change how the bouncer behaves when it hits a wall (maybe it could wrap around to the other side of the screen, maybe
// it could teleport to a random location, maybe it could move away at a different angle, ...)
//
// 5.DONE
// Add comments to your change and also include a comment that says CHANGED so we can see where you've made changes
//
// 6.DONE
// Commit this change in GitHub Desktop with a commit summary explaining how you changed the ball behaviour
//
// 7.DONE
// Add a new method to the Bouncer class that checks if the mouse is clicked in it and then changes it somehow (maybe it
// could move faster or slower when clicked, maybe it could teleport somewhere else, maybe it could change size). Add any
// properties needed to make your new behaviour work. Make sure you add a mouseClicked() function to the main program and
//call the Bouncer's new method from there.
//
// 8.DONE
// Add comments to explain your changes and include a comment that says CHANGED wherever you made your changes
//
// 9.DONE
// Commit this change in GitHub Desktop with a commit summary explaining the new behaviour
//
// 10.DONE
// Don't forget to push your repository to github.com either at the end or throughout
//
// 11.DONE
// You're done!
//
// 12.
// Challenge: Can you make another class called something like RandomMover that has a shape that moves randomly around on
// the screen (not teleporting but choosing a random direction to move in)? Maybe you could have it move like the Bouncer
// but choose a new direction to move every few seconds?
// Added bouncer # 3 for fun
//--END of requirements by Pippin Barr -------------------------------------------------------------------------------//