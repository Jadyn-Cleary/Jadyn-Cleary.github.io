Circle c;
//sets up the individual objects that will be the shapes
void setup() {
  size(700, 700); //determines the sixe of the background
  background(0); //makes the color of the background black
  c = new Circle(350, 350, 225, 225);
} // sets up the color and placement of each object


void draw() {
  clear();
  c.display();
}

void mouseReleased(){
      if ((mouseX >= c.xpos/2) && (mouseX <= c.xpos*2) && 
      (mouseY >= c.ypos/2) && (mouseY <= c.ypos*2)) {
          fill(random(0,255),random(0,255),random(0,255));
          c.xpos = random(200,500);
          c.ypos = random(200,500);
          c.w = random(100,400);
          c.h = c.w;
      }
   
}


class Circle { 
  float xpos;
  float ypos;
  float w;
  float h;

  Circle(float tempXpos, float tempYpos, float wd, float ht) { 
    xpos = tempXpos;
    ypos = tempYpos;
    w = wd;
    h = ht;
  } //sets up how to write the characteristics of the object "Circle"

  void display() {
    ellipseMode(CENTER);
    ellipse(xpos,ypos,w,h);
  } //creates the position and size of the object "Circle"
}
