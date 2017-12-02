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
  float vy = random(-1, 2);
  float speed;
  float gravity;
  float w;
  float life = 255;
  float diameter;
  PImage img;


  HeartSprite(PApplet app, PImage image, float tempX, float tempY, float tempW) {
    super(app, "heart0.png", 1, 1, 0);
    x= tempX;
    y= tempY;
    diameter = tempW;
    img = image;
    this.setXY((int)x, (int)y);
    this.setFrameSequence(1, 4);
  }


  void ascend()
    // Heart go to top of screen and move randomly left and right 
  {
      y =(y < 0 && y >= height) ? y + random(-2, 0) : y + random(0, 2);
      x = x < 0 && x >= width? x + random(-2, 0) : x + random(0, 2);
  }

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

  boolean finished() {
    // HeartSprites fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    // Display the circle
    fill(0, life);
    this.setXY((int)x, (int)y);
    //stroke(0,life);
    imageMode(CENTER);
    image(img, x, y, w, w);
  }

  //ArrayListnds
  boolean objectCollision(Sprite sprite) {
    println( "Did I collide: " + (this.bb_collision(sprite)));
    return this.cc_collision(sprite);
  }
}