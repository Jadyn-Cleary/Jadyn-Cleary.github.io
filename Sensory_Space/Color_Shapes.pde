Square [][] s;
//sets up the individual objects that will be the shapes
void setup() {
  size(700, 700); //determines the sixe of the background
  background(0); //makes the color of the background black
  s = new Square[3][3];
  float x = -187.5;
  float y = -187.5;
  for(int i = 0; i < s.length; i++) {
    x +=225;
    for(int j = 0; j < s.length; j++) {
      y+=225;
      s[i][j] = new Square(color(random(0,255),random(0,255),random(0,255)),x,y,175,175);
    }
    y-=675;
  }
} // sets up the color and placement of each object
void draw() {
  for(int i = 0; i < s.length; i++) {
    for(int j = 0; j < s.length; j++) {
      s[i][j].display();
    }
  }
}

void mouseReleased(){
  for(int i = 0; i < s.length; i++) {
    for(int j = 0; j < s.length; j++) {
      if ((mouseX >= s[i][j].xpos) && (mouseX <= s[i][j].xpos +s[i][j].w) && 
      (mouseY >= s[i][j].ypos) && (mouseY <= s[i][j].ypos + s[i][j].h)) {
          fill(random(0,255),random(0,255),random(0,255));
          s[i][j].xpos = -176;
      } else {
        s[i][j].selected = false;
      }
    }
  }
   
}


class Square { 
  boolean selected;
  color c;
  float xpos;
  float ypos;
  float w;
  float h;

  Square(color tempC, float tempXpos, float tempYpos, float wd, float ht) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    w = wd;
    h = ht;
  } //sets up how to write the characteristics of the object "Square"

  void display() {
    //rectMode(CENTER);
    rect(xpos,ypos,175,175);
  } //creates the position and size of the object "Square"
}
