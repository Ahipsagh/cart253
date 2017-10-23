//------------------------------------------------------------------------------------//
// Fish
//------------------------------------------------------------------------------------//
//
// A class that defines a fish that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a rFish and bounce off that.
//------------------------------------------------------------------------------------//
class Fish {
  //------------------------------------------------------------------------------------//
  /////////////// Properties ///////////////

  // Default values for speed and size
  int speedX = (int) random(1, 3);
  int speedY = (int) random(1, 5);
  int size = (int) random (2, 40);

  // The location of the fish
  int x = (int) random (0, width-100);
  int y = (int) random (0, height-100);
  int offScreen=0; //0=on screen, 1=left 2=off right

  // The velocity of the fish
  int vx;
  int vy;

  // The colour of the fish
  color fishColor = color(255);

  // Image
  PImage img;


  /////////////// Constructor ///////////////

  // Fish(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at speed for both x and y 
  // (so the fish starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Fish(PImage _img, int _x, int _y) {
    x = _x;
    y = _y;
    vx = speedX;
    vy = speedY;
    img=_img;
  }


  /////////////// Methods ///////////////
  //------------------------------------------------------------------------------------//
  // update()
  //------------------------------------------------------------------------------------//
  //
  // This is called by the main program once per frame. It makes the fish move
  // and also checks whether it should bounce off the top or bottom of the screen
  // and whether the fish has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the fish moves)
    x += vx  + (int) random(-7, 6);
    y += vy  + (int) random(-5, 9);
    if (x < 0) {
      x += width;
    } else 
    if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else 
    if (y >= height) {
      y -= height;
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
  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  //------------------------------------------------------------------------------------//
  void collide(Fish other) {
  //------------------------------------------------------------------------------------//
    // QUESTION: What is this if-statement for?
    // if either one of the Griddies that collided have an energy level of 0 (death) go back to the main
    // program exercise04
    // QUESTION: What does this if-statement check?
    // if both Griddies are located at the same (x,y) coordinates then they have collided and 
    // get an energy increase
    // 
    println("im in");
 //   if (x == other.x && y == other.y )
   // {
      
      println(" Hit a FISH Griddie-Fish x =" + x + other.x + " Griddie-Fish y = " + y + other.y);
      // set Griddie energy to 0 (death) and increase aFish size
      //ah     size += collideEnergy;
      size+=100;
      isFish=false;
     // Constrain the energy level to be within bounds
      //size = constrain(size,0,100);
  //    energy = 0;
   // }
  }
  
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

      // Draw the fish

      // Load a image on the screen
      x = x + (int) random(-2, 2);  // make the fish gittery
      y = y + (int) random(-2, 2);
      imageMode(CENTER);
      image(img, x, y, size, size);
      //   rect(x, y, size, size);
    }
}