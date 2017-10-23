//------------------------------------------------------------------------------------//
// Fish
//------------------------------------------------------------------------------------//
//
// A class that defines a fish that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a griddies and bounce off that.
//------------------------------------------------------------------------------------//
class Fish {
  //------------------------------------------------------------------------------------//
  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = (int) random(1,7);
  int size = (int) random (16,50);

  // The location of the fish
  int x;
  int y;
  int offScreen=0; //0=on screen, 1=left 2=off right

  // The velocity of the fish
  int vx;
  int vy;

  // The colour of the fish
  color fishColor = color(255);

  // Scoring
  int playerScore=0;
  int enmeScore=0;
  
  // Image
  PImage img;


  /////////////// Constructor ///////////////

  // Fish(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the fish starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Fish(PImage _img, int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
    img=_img;
  }


  /////////////// Methods ///////////////
  //------------------------------------------------------------------------------------//
  // update()
  //------------------------------------------------------------------------------------//
  //
  // This is called by the main program once per frame. It makes the fish move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the fish has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the fish moves)
    x += vx;
    y += vy;

    // Check if the fish is going off the top of bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }
  //------------------------------------------------------------------------------------//
  // reset()
  //------------------------------------------------------------------------------------//
  //
  // Resets the fish to the centre of the screen.
  // Note that it KEEPS its velocity

  void reset() {
    x = width/2;
    y = height/2;
  }
  //------------------------------------------------------------------------------------//
  // isOffScreen()
  //------------------------------------------------------------------------------------//
  //
  // Returns true if the fish is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")

  boolean isOffScreen() 
  {
    screenLeftRight();
    return (x + size/2 < 0 || x - size/2 > width);
  }

  void screenLeftRight() 
  {
    // fish went off either left(=1) or right(=2)  

    if (x + size/2 < 0)
    {
      offScreen=1;
 //     player_Score.update();
  //    println("player wins" + enmeScore + " " + playerScore);
      if (playerScore == 10) 
     {
  //      gameIsOver = true;
 //       winner = true;
    }

 //     println("-------Player Scores here----------Left off screen" + playerScore + " " + offScreen );
    } else if (x - size/2 > width) {
      offScreen=2;
 //     enme_Score.update();
 //     println("enemy *****" + enmeScore + " " + enme_Score);
      if (enmeScore == 10) 
      {
 //       gameIsOver = true;
 //       winner = true;
      }
//      println("right off screen" + enmeScore + " " + playerScore);
    }
  }

  //------------------------------------------------------------------------------------//
  // collide(griddies griddies)
  //------------------------------------------------------------------------------------//
  //
  // Checks whether this fish is colliding with the griddies passed as an argument
  // If it is, it makes the fish bounce away from the griddies by reversing its
  // x velocity

 /* void collide(Fish griddies) {
    // Calculate possible overlaps with the griddies side by side
    boolean insideLeft = (x + size/2 > griddies.x - griddies.width/2);
    boolean insideRight = (x - size/2 < griddies.x + griddies.width/2);
    boolean insideTop = (y + size/2 > griddies.y - griddies.height/2);
    boolean insideBottom = (y - size/2 < griddies.y + griddies.height/2);

    // Check if the fish overlaps with the griddies
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the griddies
        x = griddies.x + griddies.width/2 + size/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the griddies
        x = griddies.x - griddies.width/2 - size/2;
      }
      // And make it bounce
      vx = -vx;
    }
  }
  */
  //------------------------------------------------------------------------------------//
  // display()
  //------------------------------------------------------------------------------------//
  //
  // Draw the fish at its position

  void display() {
    // Set up the appearance of the fish (no stroke, a fill, and rectMode as CENTER)
//    noStroke();
//    fill(fishColor);
//    rectMode(CENTER);

//    // Draw the fish
//    rect(x, y, size, size);
// Load a image on the screen
x = x + (int) random(-2,2);  // make the fish gittery
y = y + (int) random(-2,2);
imageMode(CENTER);
image(img,x,y, size, size);

  }
}