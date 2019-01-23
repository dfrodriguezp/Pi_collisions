class Block {
  float v;
  float m;
  float x;
  float y;
  float size;
  
  Block(float mass, float posx, float posy, float vel, float size) {
    this.m = mass;
    this.v = vel;
    this.x = posx;
    this.y = posy;
    this.size = size;
  }
  
  void update() {
    this.x += this.v;
  }
  
  void setVel(float v) {
    this.v = v;
  }
  
  void touchWall() {
    if (this.x <= 40) {
      this.v *= -1;
      counter++;
    }
  }
  
  void show() {
    fill(255);
    noStroke();
    rect(this.x, this.y, this.size, this.size);
  }
}
