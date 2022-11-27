Car[] c;

float xOffset = 0.0;
float yOffset = 0.0;
float r = random(255);
float g = random(255);
float b = random(255);

Car car;

class Car { 
  boolean selected;
  color c;
  float xpos;
  float ypos;
  float w;
  float h;

  Car(color tempC, float tempXpos, float tempYpos, float wd, float ht) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    w = wd;
    h = ht;
  } //sets up how to write the characteristics of the object "Car"

  void display() {
    fill(c);
    rect(xpos,ypos,w,h);
  } //creates the position and size of the object "Car"

}

void setup() {
  size(700,700);
  background(0);
  c = new Car[7]; // initialize array
  int y = -100;
  for (int i = 0; i < c.length; i++) {
    y +=100;
    r = random(255);
    g = random(255);
    b = random(255);
    c[i] = new Car(color(r,g,b),0,y, 250, 100);
    c[i].selected = false;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < c.length; i++) {
    c[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < c.length; i++) {
    if ((mouseX >= c[i].xpos) && (mouseX <= c[i].xpos +c[i].w) && (mouseY >= c[i].ypos) && (mouseY <= c[i].ypos + c[i].h)) {
      c[i].selected = true;
      xOffset = mouseX-c[i].xpos;
      //yOffset = mouseY-c[i].ypos;
    } else {
      c[i].selected = false;
    }
  }
}

void mouseDragged() {
  for (int i = 0; i < c.length; i++) {
    if (c[i].selected == true) {
      cursor(HAND);
      c[i].xpos = mouseX - xOffset;
     // c[i].ypos = mouseY - yOffset;
    }
  }
}

void mouseReleased() {
  cursor(ARROW);
}
