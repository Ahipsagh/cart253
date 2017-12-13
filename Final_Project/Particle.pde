// A simple Particle class
// by Daniel Shiffman

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.001);
    velocity = new PVector(random(-3, 3), random(-5, 5));
    position = l.copy();
    lifespan = random(255.0, 555.0);
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }
  //-----------------------------------------------------------------------------------------
  // Method to display
  // The display of the particle system simulates fish bubbles throughout gameplay
  //
  // If the avatar succeeds then the particle system transforms into multi colored confetti
  // The multi colored confetti is tamed by the for loop which reduces the color changes with
  // the help of a modulo of 20. 
  //
  // If the monster succeeds the particle system stops.
  //
  void display() {
    //-----------------------------------------------------------------------------------------
    if (winner=="monster")
    {
      noFill();
    } else if (winner=="you") {
      for (int i=0; i<frameCount%20; i++) {
        stroke(255, lifespan);
        fill( random(255), random(255), random(255), lifespan);
        ellipse(position.x, position.y, 50, 50);
        lifespan--;
      }
    } else
    {
      stroke(255, lifespan);
      noFill();
      ellipse(position.x, position.y, 20, 20);
    }
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}