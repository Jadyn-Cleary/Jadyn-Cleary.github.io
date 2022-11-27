Eye e1, e2, e3, e4, e5, e6, e7, e8;

float r = random(255);
float g = random(255);
float b = random(255);

void setup() {
 size(700, 700);
 noStroke();
 e1 = new Eye(80,  80, 150);
 e2 = new Eye(290, 185, 170);  
 e3 = new Eye(550, 100, 130);
 e4 = new Eye(150, 360, 125);
 e5 = new Eye(480, 370, 180);
 e6 = new Eye(120, 590, 200);
 e7 = new Eye(570, 590, 160);
 e8 = new Eye(350, 500, 120);
}


void draw() {
  background(0);
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);
  e4.update(mouseX, mouseY);
  e5.update(mouseX, mouseY);
  e6.update(mouseX, mouseY);
  e7.update(mouseX, mouseY);
  e8.update(mouseX, mouseY);

  e1.display();
  e2.display();
  e3.display();
  e4.display();
  e5.display();
  e6.display();
  e7.display();
  e8.display();
}

class Eye {
  int x;
  int y;
  int s;
  float angle = 0.0;
  
  Eye(int xpos, int ypos, int size) {
    x = xpos;
    y = ypos;
    s = size;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255);
    ellipseMode(CENTER);
    ellipse(0, 0, s, s);
    rotate(angle);
    for (int i = 0; i < 3; i++) {
      fill(r, g, b);
    }
    ellipse(s/4, 0, s/2, s/2);
    popMatrix();
  }
}
