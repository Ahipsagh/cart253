class Fish {
  float x;
  float y;
  float vx;
  float vy = random(-1,2);
  float diameter;
  PImage img;
  float xoff = random(-1, 10);

  Fish(PImage tempImg, float tempX, float tempY, float tempD)
  {
    x= tempX;
    y= tempY;
    diameter =tempD;
    img = tempImg;
  }

  void ascend()
    // fish go to top of screen and move randomly left and right 
  {
    if (y > height || y < 0){
      vy = -vy; // if less than top of canvas or more than bottom of canvas it reverses the direction randomly
      x = x + random(-2, 2);
    }
   }

  void display()
  {
    // each fish has a random noise factor subtracted from its random diameter
    // and then it is displayed.  Notice the fishing line.
    y += vy; // increases the velocity by 2
    xoff = xoff + .01;
    float n = noise(xoff) * width;
    line(n, 2, n, height);
    imageMode(CENTER);
    image(img, x, y, diameter-n, diameter-n);
  }

}