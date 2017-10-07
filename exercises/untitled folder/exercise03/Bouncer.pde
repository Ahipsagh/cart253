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
  color lastDefaultColor; //CHANGED s7,8,9 
  color hoverColor;
  color changeFillColor;  //CHANGED s7,8,9 
  boolean mouseReleased;  //CHANGED s7,8,9 
  char changeColor;       //CHANGED s7,8,9 
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
    lastDefaultColor = tempDefaultColor;
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

    //ah    if (mousePressed); //CHANGED change colour on mouseClicked  
    //ah    changeColor();
  }
  //------------------------------------------------------------------------------------//
  // handleBounce
  // routine when the bounce collides with edge of environment.
  //
  //CHANGED
  // Steps 4, 5, 6
  // Split out the if statement to control when the bounce hits right/left/top/botom edges
  // Each time the bounce hits one of the edges it will re-emerge on a random location
  // on that edge.
  //------------------------------------------------------------------------------------//
  // 

  void handleBounce() {
    if (x - size/2 < 0) {        // off LEFT of screen 
      //ah   random(width)
      float randomY = random(0, height);
      y= int(randomY);
      vx = -vx;
    }

    if (x + size/2 > width) {    // off RIGHT of screen 
      float randomY = random(0, height);
      y= int(randomY);
      vx = -vx;
    }
    if (y - size/2 < 0) {           // off the TOP of screen
      float randomX = random(0, width);
      x= int(randomX);
      vy = -vy;
    }

    if (y + size/2 > height) {           // off the BOTTOM of screen
      float randomX = random(0, width);
      x= int(randomX);
      vy = -vy;
    }
    x = constrain(x, size/2, width-size/2);              // keep on screen
    y = constrain(y, size/2, height-size/2);             // keep on screen
  }
  //------------------------------------------------------------------------------------//
  // HandleMouse
  // when your mouse hovers over the ball the defaultColor changes to the hoverColor
  //------------------------------------------------------------------------------------//
  // 

  void handleMouse() 
  {
    if (mousePressed) 
      changeColor='Y';
    {
      mouseClicked();
      if (mousePressed)
        defaultColor = lastDefaultColor;
      else 
      if (mouseReleased)
      {  
        lastDefaultColor = defaultColor;
        defaultColor = changeFillColor;
      } else
      if (! mousePressed)
        changeColor='N';
    }
    if (dist(mouseX, mouseY, x, y) < size/2)
    {
      fillColor = hoverColor;
    } else 
    {
      lastDefaultColor = defaultColor;
      fillColor = defaultColor;
    }
  }
  //------------------------------------------------------------------------------------//
  // mouseClicked
  // 
  //CHANGED
  // Steps 7, 8, 9
  // Change to random color on mouseClick
  // Created variables to check when the mouseClick completed and to hold lastDefaultColor
  //------------------------------------------------------------------------------------//
  // 
  void mouseClicked() 
  {  
    if (changeColor == 'Y') {
      changeFillColor = color ((int) random(0, 100), (int) random(0, 100), (int) random(0, 100));
      defaultColor = changeFillColor;
    }
  }
  //
  //------------------------------------------------------------------------------------//
  // Draw
  //------------------------------------------------------------------------------------//
  // 
  //------------------------------------------------------------------------------------//
  // mouseReleased
  // 
  //CHANGED
  // Steps 7, 8, 9
  // Created 2 control variables to determine that the random color should change only when the 
  // mouseClicked (pressed and released) has completed.
  //------------------------------------------------------------------------------------//
  // 
  void mouseReleased() 
  {
    boolean mouseReleased=true;
    changeColor='Y';
  }

  void draw()
  {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}