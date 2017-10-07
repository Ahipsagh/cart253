//------------------------------------------------------------------------------------//
// C L A S S   Bouncer
//------------------------------------------------------------------------------------//
//

class Bouncer {
  //------------------------------------------------------------------------------------//
  // D E C L A R E   V A R I A B L E S
  //------------------------------------------------------------------------------------//
  // 
  int x;
  int y;
  int vx;
  int vy;
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;
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

  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }
  //------------------------------------------------------------------------------------//
  // M A I N 
  //------------------------------------------------------------------------------------//
  // 

  void update() {
    x += vx;
    y += vy;

    handleBounce();
    handleMouse();
  }
  //------------------------------------------------------------------------------------//
  // handleBounce
  // routine when the bounce collides with edge of environment.
  //
  //CHANGED
  //Steps 4, 5, ^
  // Split out the if statement to control when the bounce hits right/left/top/botom edges
  // Each time the bounce hits one of the edges it will re-emerge on a random location
  // on that edge.
  //------------------------------------------------------------------------------------//
  // 

  void handleBounce() {
    //ah   if (x - size/2 < 0 || x + size/2 > width) {        // off the screen 
    //ah    vx = -vx; 
    //ah   }
    if (x - size/2 < 0) {        // off LEFT of screen 
      //ah   random(width)
      println("before------LEFT w= " + width + "h= " + height + "x= " + x + "y= " + y);
      float randomY = random(0, height);
      y= int(randomY);
      println("LEFT w= " + width + "h= " + height + "x= " + x + "y= " + y);
      vx = -vx;
    }

    if (x + size/2 > width) {    // off RIGHT of screen 
      //ah println("RIGHT");
      println("before---------------RIGHT w= " + width + "h= " + height + "x= " + x + "y= " + y);
      float randomY = random(0, height);
      y= int(randomY);
      println("---------*****Right w= " + width + "h= " + height + "x= " + x + "y= " + y);
      vx = -vx;
    }
    //ah   if (y - size/2 < 0 || y + size/2 > height) {       // off the screen
    //ah     vy = -vy;
    //ah   }
    if (y - size/2 < 0) {           // off the TOP of screen
      println("TOP");
      println("before-----TOP w= " + width + "h= " + height + "x= " + x + "y= " + y);
      float randomX = random(0, width);
      x= int(randomX);
      println("*****TOP w= " + width + "h= " + height + "x= " + x + "y= " + y);
      vy = -vy;
    }

    if (y + size/2 > height) {           // off the BOTTOM of screen
      println("BOTTOM");
      println("before--Bottom w= " + width + "h= " + height + "x= " + x + "y= " + y);
      float randomX = random(0, width);
      x= int(randomX);
      println("*****bottom w= " + width + "h= " + height + "x= " + x + "y= " + y);
      vy = -vy;
    }
    x = constrain(x, size/2, width-size/2);              // keep on screen
    y = constrain(y, size/2, height-size/2);             // keep on screen
  }
  //------------------------------------------------------------------------------------//
  // HandleMouse
  //------------------------------------------------------------------------------------//
  // 

  void handleMouse() {
    //ah   println("mouseX,mouseY,x,y " + mouseX + " " + mouseY + " " + x + " " + y);
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }
  //------------------------------------------------------------------------------------//
  // Draw
  //------------------------------------------------------------------------------------//
  // 

  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}