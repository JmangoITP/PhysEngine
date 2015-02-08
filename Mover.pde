// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass, rad;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rad = mass*8;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    println(velocity);
  }

  void display(float r, float g, float b, float a) {
    stroke(0);
    fill(r, g, b, a);
    ellipse(location.x, location.y, rad*2, rad*2);
  }

  void run() {
    update();
    checkEdges();
    
  }
  void checkEdges() {

    if (location.x >= width) {
      location.x = 0;
    } else if ( location.x <= 0) {
      location.x = width;
    }

    if (location.y >= height) {
      location.y = 0;
    } else if (location.y <= 0) {
      location.y = height;
    }
  }
}
