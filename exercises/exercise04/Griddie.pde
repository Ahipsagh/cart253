//------------------------------------------------------------------------------------//
// C L A S S   Griddie
//------------------------------------------------------------------------------------//
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  //------------------------------------------------------------------------------------//
  // D E C L A R E   V A R I A B L E S
  //------------------------------------------------------------------------------------//
  // 
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255, 255, 255);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }
  //------------------------------------------------------------------------------------//
  // M A I N 
  //------------------------------------------------------------------------------------//
  // 
  // update()
  //
  // Move the Griddie and update its energy levels
  //------------------------------------------------------------------------------------//
  void update() {
    //------------------------------------------------------------------------------------//    
    // QUESTION: What is this if-statement for?
    // if energy of the Griddie is 0 then it has died and control returns to main program exercise 04 
    if (energy == 0) {
      return;
    }

    // QUESTION: How does the Griddie movement updating work?
    // floor means to round down to the nearest integer.  In this case the x and y coordinates are each
    // modified by a small value rounded down and then moved from its original (x,y) location in order 
    // to give the Griddie a jittery effect.
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += size * xMoveType;
    y += size * yMoveType;

    // QUESTION: What are these if statements doing?
    // here the if statement is checking to see if the Griddie is off the screen.
    // this code simulates a wrap around effect.  For example if the Griddle goes off the right side
    // of the screen it will reappear on the left side and continue.  If off the top it reappears on 
    // the bottom of the screen.

    if (x < 0) {
      x += width;
      fill = color(0, 0, 255);
      println(" is off the right" );
    } else if (x >= width) {
      x -= width;
      fill = color(255, 0, 0);
      println("-----------left" );
    }
    if (y < 0) {
      y += height;
      fill = color(0, 0, 0);
      println("---bottom" );
    } else if (y >= height) {
      y -= height;
      fill = color(0, 255, 0);
      println("-top" );
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;

    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy, 0, maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  //------------------------------------------------------------------------------------//
  void collide(Griddie other) {
    //------------------------------------------------------------------------------------//
    // QUESTION: What is this if-statement for?
    // if either one of the Griddies that collided have an energy level of 0 (death) go back to the main
    // program exercise04
    if (energy == 0 || other.energy == 0 || isFish==true) {
      return;
    }

    // QUESTION: What does this if-statement check?
    // if both Griddies are located at the same (x,y) coordinates then they have collided and 
    // get an energy increase
    // 
    if (x == other.x && y == other.y && isFish==false) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy, 0, maxEnergy);
    }
  }

// collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  //------------------------------------------------------------------------------------//
  void dead() {
    //------------------------------------------------------------------------------------//
    energy=0;
      return;
    }

// display()
//
// Draw the Griddie on the screen as a rectangle
//------------------------------------------------------------------------------------//
void display() {
  //------------------------------------------------------------------------------------//
  // QUESTION: What does this fill line do?
  // energy reduces the opacity of the fill color (alpha) making it more transparent
  fill(fill, energy); 
  noStroke();
  rect(x, y, size, size);
}
}