
ArrayList<Mover> movers;
Liquid[] liquid = new Liquid[7];

PVector gravity, wind;
float g;


void setup() {

  size(1100, 600);

  randomSeed(1);

  for (int i = 0; i < liquid.length; i++) {

    liquid[i] = new Liquid(random(0, width), random(0, height), random(5, 10), .1);
  }
  movers = new ArrayList<Mover>();


}

void draw() {
  fill(255, 50);
  noStroke();
  rect(0, 0, width, height);


  for (Mover m : movers) {
    for (Liquid l : liquid) {
      gravity = new PVector(0, g);
      l.applyForce(gravity);

      wind = new PVector(0, 0);
      l.applyForce(wind);
      l.update();
      l.display();
      l.checkEdges();

      //-------when movers are in liquid--------//
      if (l.contains(m)) {
        PVector dragForce = l.drag(m);
         m.display(255,0,0,100);
        // g += .001;
        m.applyForce(dragForce);
        m.display(200, 0, 0, 255);
      } else {
        // g = 0;
      }
    }
    gravity = new PVector(0, .1 * m.mass);
    m.applyForce(gravity);
    // println(gravity);
    wind = new PVector(0.03, 0);
    m.applyForce(wind);
    m.display(200,200,200,100);
    m.run();
    
  }
}


void mousePressed() {
  // reset();
  movers.add (new Mover(random(.5, 2), mouseX, mouseY));
}


// void reset() {

//   for (int i = 0; i < movers.length; i++) {
//     movers[i] = new Mover(random(0.5, 3), 40+i*70, 0);
//   }
// }
