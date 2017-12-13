//------------------------------------------------------------------------------------
// HeartSprite Class
//
// Using the Sprite Processing library to create an arraylist of Sprite objects
// called HeartSprite
//------------------------------------------------------------------------------------

import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

import processing.event.MouseEvent;
import sprites.maths.PointD2D;
import sprites.maths.Vector2D;
// Simple bouncing HeartSprite class

//------------------------------------------------------------------------------------
// added lots of randomness to create interesting heart collectibles.
//
class HeartSprite extends Sprite 
//------------------------------------------------------------------------------------
{
  float x;
  float y;
  float vx;
  float vy = random(-1, 2);
  float speed;
  float gravity=-0.8;
  float w;
  float diameter = random(20, 40);
  float life = 255;
  PImage img;
  int range=1000;
  float xoff = random(-10, 20);

  //------------------------------------------------------------------------------------
  HeartSprite(PApplet app, PImage image, float tempX, float tempY, float tempW) 
  //------------------------------------------------------------------------------------  
  {
    super(app, "heart0.png", 1, 1, 0);
    x= tempX;
    y= tempY;
    diameter = tempW;
    w=tempW;
    img = image;
    this.setXY(-200, -20);
    this.setFrameSequence(1, 1);
  }

  //------------------------------------------------------------------------------------
  void ascend()
    // Hearts go to top of screen 
    //------------------------------------------------------------------------------------    

  {
    if (y > range || y < 100) {
      vy = -vy; // if less than top of canvas or more than bottom of canvas it reverses the direction randomly
    }
  }

  //------------------------------------------------------------------------------------
  // each heart has a random noise factor subtracted from its random diameter
  // and then it is displayed.  
  //
  void display() 
    //------------------------------------------------------------------------------------  
  {
    y += vy; // increases the velocity

    xoff = xoff + .1;
    //image(img, x, y, w-n, w-n);
    this.setXY((int)x, (int)y);
    this.setScale(noise(xoff) * 1.2);
  }

//ArrayList collision avatar and heart using method from Sprite Library
//
  boolean objectCollision(Sprite sprite) {
    return this.cc_collision(sprite);
  }
}