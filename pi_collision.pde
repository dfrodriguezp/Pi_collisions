Block block1;
Block block2;
int counter = 0;
int digits = 5;

void setup() {
  size(800, 800);
  block1 = new Block(pow(100, digits-1), 401, 400, -1 / sqrt(pow(100, digits-1)), 200);
  block2 = new Block(1, 100, 550, 0, 50);
}


void draw() {
  background(0);
  println(block1.x);
  block1.show();
  block2.show(); 
  for (int i = 0; i < sqrt(block1.m); i++) {
    block1.update();
    block2.update();
    collision(block1, block2);
    block2.touchWall();
  }
  println(counter);
  stroke(255);
  strokeWeight(20);
  line(30, 0, 30, height);
}


void collision(Block a, Block b) {
  float A = (a.m - b.m) / (a.m + b.m);
  float B = (2 * b.m) / (a.m + b.m);
  float C = (2 * a.m) / (a.m + b.m);
  float temp_v1 = a.v;
  if (touch(b, a)) {
    a.v = A * temp_v1 + B * b.v;
    b.v = C * temp_v1 - A * b.v;
    counter++;
  }
}


boolean touch(Block a, Block b) {
  return (a.x + a.size >= b.x && a.x + a.size < b.x + b.size);
}
