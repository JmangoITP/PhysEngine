class Liquid {
  float x, y, w, h, c;
  float massB;
  PVector loc, vel, accel, noff;
  float rad;

  Liquid(float x, float y, float m, float _c) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    noff = new PVector(random(1000),random(1000));
    c = _c;
    massB = m;
    rad = massB*10;
  }

  boolean contains(Mover m) {
    PVector l = m.location;
    float d = dist(l.x,l.y,loc.x,loc.y);
    if (d < rad + m.rad){
      return true;
    }else{
      return false;
    }
    // return l.x > loc.x && l.x < loc.x + massB*20 && l.y > loc.y && l.y < loc.y + massB*20;
  }

  PVector drag(Mover m) {
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, massB);
    accel.add(f);
  }

  void update() {
    vel.add(accel);
    loc.add(vel);
    accel.mult(0);
    
    loc.x = map(noise(noff.x),0,1,0,width);
    loc.y = map(noise(noff.y),0,1,0,height);
    
    noff.add(0.001,0.001,0);
  }
  void display() {

    fill(39, 50, 118, 10);
    noStroke();
    ellipse(loc.x, loc.y, rad*2, rad*2);
  }

  void checkEdges() {
    if ( loc.x >= width) {
      loc.x = 0;
    }else if(loc.x <= 0){
      loc.x = width;
    }
    if ( loc.y >= height) {
      loc.y = 0;
    }else if(loc.y <= 0){
      loc.y = height;
    }
  }
}
