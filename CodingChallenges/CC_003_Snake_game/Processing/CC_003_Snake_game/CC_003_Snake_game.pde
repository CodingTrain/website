// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/AaGK-fj-BAM

Snake s;
int scl = 20;

PVector food;

void setup() {
  size(600, 600);
  s = new Snake();
  frameRate(10);
  pickLocation();
}

void pickLocation() {
  int cols = width/scl;
  int rows = height/scl;
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}

void mousePressed() {
  s.total++;
}

void draw() {
  background(51);

  if (s.eat(food)) {
    pickLocation();
  }
  s.death();
  s.update();
  s.show();


  fill(255, 0, 100);
  rect(food.x, food.y, scl, scl);
}





void keyPressed() {
  if (keyCode == UP) {
    if(s.yspeed == 1){
       s.dir(0, 1);
    }else{
       s.dir(0, -1);
    }
  } else if (keyCode == DOWN) {
    if(s.yspeed == -1){
       s.dir(0, -1);
    }else{
       s.dir(0, 1);
    }
  } else if (keyCode == RIGHT) {
    if(s.xspeed == -1){
       s.dir(-1, 0);  
    }else{
       s.dir(1, 0);
    }
  } else if (keyCode == LEFT) {
    if(s.xspeed == 1){
       s.dir(1, 0);  
    }else{
       s.dir(-1, 0);
    }
  }
}
