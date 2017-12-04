import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

import processing.event.MouseEvent;
import sprites.maths.PointD2D;
import sprites.maths.Vector2D;
// Simple bouncing HeartSprite class

class HeartSprite extends Sprite {
  float x;
  float y;
  float vx;
  float vy = random(-1,2);
  float speed;
  float gravity;
  float w;
  float diameter = random(20,60);
  float life = 255;
  PImage img;
  int range=500;
  float xoff = random(-10, 20);

  HeartSprite(PApplet app, PImage image, float tempX, float tempY, float tempW) {
    super(app, "heart0.png", 1, 1, 0);
    x= tempX;
    y= tempY;
    diameter = tempW;
    img = image;
    this.setXY(400, 350);
    this.setFrameSequence(1, 1);
    
  }


  void ascend()
    // Heart go to top of screen and move randomly left and right 
  //{
     {
    if (y > range || y < 0){
      vy = -vy; // if less than top of canvas or more than bottom of canvas it reverses the direction randomly
     x = x + random(-2, 2);
    }
     }
  // }
  //    y =(y < 0 && y >= height) ? y + random(-2, 0) : y + random(0, 2);
  //    x = x < 0 && x >= width? x + random(-2, 0) : x + random(0, 2);
  //}

  void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
      // Dampening
      speed = speed * -0.8;
      y = (float)height;
    }
  }

  void display() {
     y += vy; // increases the velocity by 2
    // Display the circle
    fill(0, life);
  this.setXY((int)x, (int)y);

    //stroke(0,life);
//    imageMode(CENTER);

  //  image(img, x, y, w,w);
     // each fish has a random noise factor subtracted from its random diameter
    // and then it is displayed.  Notice the fishing line.
    y += vy; // increases the velocity by 2
    xoff = xoff + .03;
    float n = noise(xoff) * 150 ;
    //line(n, 2, n, 20);
   // imageMode(CENTER);
    image(img, x, y, w-n, w-n);
    
  }

  //ArrayListnds
  boolean objectCollision(Sprite sprite) {
    println( "Did I collide: " + (this.bb_collision(sprite)));
    return this.cc_collision(sprite);
  }
}