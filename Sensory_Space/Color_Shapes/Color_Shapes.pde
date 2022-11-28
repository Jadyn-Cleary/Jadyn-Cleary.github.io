Square [][] s;
Circle [][] c;
//sets up the individual objects that will be the shapes
void setup() {
  size(700, 700); //determines the sixe of the background
  background(0); //makes the color of the background black
  s = new Square[3][3];
  c = new Circle[3][3];
  float x = -100;
  float y = -100;
  for(int i = 0; i < s.length; i++) {
    x +=225;
    for(int j = 0; j < s.length; j++) {
      y+=225;
      s[i][j] = new Square(x,y,175,175);
      c[i][j] = new Circle(x,y,175,175);
    }
    y-=675;
  }
} // sets up the color and placement of each object
void draw() {
  for(int i = 0; i < s.length; i++) {
    for(int j = 0; j < s.length; j++) {
      s[i][j].display();
      c[i][j].display();
    }
  }
}


void mouseClicked(){

  for(int i = 0; i < s.length; i++) {
    for(int j = 0; j < s.length; j++) {
      if ((mouseX >= c[i][j].xpos) && (mouseX <= c[i][j].xpos +c[i][j].w) && (mouseY >= c[i][j].ypos) && (mouseY <= c[i][j].ypos + c[i][j].h)) {
        c[i][j].selected = true; 
        fill(random(0,255),random(0,255),random(0,255));
        c[i][j] = new Circle(c[i][j].xpos,c[i][j].ypos,175,175);
      } else {
        c[i][j].selected = false;
        //print("false");
      }
    }
  }
  
  //if(c[x][y].selected){
  //      fill(random(0,255),random(0,255),random(0,255));
  //      c[x][y] = new Circle(c[x][y].xpos,c[x][y].ypos,175,175);
  //      print("filled");
  //    }
   
}


void mouseReleased(){
  for(int i = 0; i < s.length; i++) {
    for(int j = 0; j < s.length; j++) {
      print(c[i][j].selected);
      if(c[i][j].selected == true) {
        fill(random(0,255),random(0,255),random(0,255));
        c[i][j] = new Circle(c[i][j].xpos,c[i][j].ypos,175,175);
        print("hit");
      }
    }
  }
}

class Square { 
  boolean selected;
  float xpos;
  float ypos;
  float w;
  float h;

  Square(float tempXpos, float tempYpos, float wd, float ht) { 
    xpos = tempXpos;
    ypos = tempYpos;
    w = wd;
    h = ht;
  } //sets up how to write the characteristics of the object "Square"

  void display() {
    rectMode(CENTER);
    rect(xpos,ypos,175,175);
  } //creates the position and size of the object "Square"
}


class Circle { 
  boolean selected;
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
    ellipse(xpos,ypos,150,150);
  } //creates the position and size of the object "Circle"
}
