// A simple Particle class
// by Daniel Shiffman

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.001);
    velocity = new PVector(random(-5, 5), random(-2, 1));
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
// If the avatar succeeds then the particle system transforms into multi colored confetti
// If the monster succeeds the particle system stops.

  void display() {
//-----------------------------------------------------------------------------------------
    if (winner=="monster")
    {
      noFill();
    } else if (winner=="you") {
      stroke(255, lifespan);
      fill( random(255), random(255), random(255), lifespan);
      ellipse(position.x, position.y, 50, 50);
    } else
    {
      stroke(255, lifespan);
      noFill();
      ellipse(position.x, position.y, 10, 10);
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