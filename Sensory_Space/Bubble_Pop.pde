Bubble bubble1;
Bubble bubble2;
Bubble bubble3;

void setup() {
  size(700, 700);
  bubble1 = new Bubble(150);
  bubble2 = new Bubble(150);
  bubble3 = new Bubble(150);
}

void draw() {
  background(0);

  // bubble management 
  bubble1.all();
  bubble2.all();
  bubble3.all();
}

void mousePressed() {
  // bubble explodes 
  if (bubble1.over()) {
    bubble1.fall();
  }
  if (bubble2.over()) {
    bubble2.fall();
  }
  if (bubble3.over()) {
    bubble3.fall();
  }
}

// ========================================================================================================

class Bubble {

  // constants: these are values that state can have (must be unique (0,1,2...))
  final int RISE    = 0;   // the word final makes them constants 
  final int FALL    = 1; 
  final int RESTART = 2; 
  // variable: current value of the state
  int state=RISE;  // not a state of the program, but the state of the bubble

  float tempSize;
  float w;
  float h;
  boolean move = true;
  float maxW;
  float maxH;
  float minW;
  float minH;
  float wspeed;
  float hspeed;
  float riseY = random(0.8, 3);
  float riseStart;
  float start = random(0, 700);
  float gravity = 0.3;
  float rad;

  Fallout[] fallouts; //might want to use a list (ArrayList)


  Bubble(float tempSize) { // <----------------- Bubble takes value from tab 1 and makes tempSize

    w = tempSize;
    h = tempSize;
    riseStart = tempSize + height;

    rad=tempSize/2;
    maxW = w*1.1+random(0, maxW/2);
    maxH = h*1.1+random(0, maxH/1);
    minW = w/1.1;
    minH = h/1.1;
    wspeed = w/100;
    hspeed = h/75;
  }

  void all() {

    stroke(255, 255);

    switch(state) {

    case RISE: 
      // rise
      show(); 
      move();
      top(); 
      break; 

    case FALL:
      //fall 
      riseY = riseY - gravity;
      riseStart = riseStart - riseY;
      // new small ball
      ellipse(start, riseStart, 
        3, 3); 
      //shrapnels 
      showExplosion();
      // lower screen border?
      if (riseStart>height+133) {  
        state = RESTART;
      }
      break; 

    case RESTART: 
      // restart 
      state = RISE; 
      riseY = random(0.8, 3); 
      riseStart = tempSize + height+100;
      start = random(w, width-w);
      break;

    default: 
      // What does this state do? When does it run?
      // It just picks up an error, when we forgot a state. 
      // Error 
      println("Error. Unknown state ");
      exit();    
      break; 
      //
    }//switch 
    //
  } // method 

  void show() {
    noFill();
    stroke(255, 255); 
    strokeWeight(1);
    ellipse (start, riseStart, 
      w, h);

    if (move) {
      w = w + wspeed;

      if ((w > maxW) || (w < minW)) { // Makes bubble wobble.
        wspeed = wspeed * -1;
      }

      if (move) {
        h = h + hspeed;
      }
      if ((h > maxH) || (h < minH)) { // Makes bubble wobble.
        hspeed = hspeed * -1;
      }
    }
  }

  void move() {
    riseStart = riseStart - riseY;
  }

  void top() {
    if (riseStart < tempSize - tempSize -100) { 
      state=RESTART;
    }
  }

  void fall() {
    state=FALL;
    explode();
  }

  boolean over() {
    // returns true or false; true when mouse is on balloon.
    return 
      (mouseX < start + w/2) && 
      (mouseX > start - w/2) &&
      (mouseY < riseStart + h/2) && 
      (mouseY > riseStart - h/2);
  }

  void showExplosion() {
    for (int i = 0; i < fallouts.length; i++) {
      fallouts[i].display();
      fallouts[i].move();
    }
  }

  void explode() {


    // full reset 
    fallouts = new Fallout[0];

    // How many shrapnels? Random : 
    final int upperBound = int(random(8, 44)); 

    // angle step accordingly 
    final float ANGLE_INCREMENT = TWO_PI/upperBound;

    // angle 
    float angle=0; 

    for (int i=0; i<=upperBound; i++) {

      // make a new bullet at CURRENT POSITION : start, riseStart
      Fallout newFallout = new Fallout(
        start, riseStart, // start pos 
        cos(angle)*random(.9, 3.8), sin(angle)*random(.9, 3.8) // speed of movement 
        );

      // append it to array
      fallouts = (Fallout[]) append(fallouts, newFallout);
      angle=i*ANGLE_INCREMENT;
    }
  }
}

// ========================================================================================================

class Fallout { 


  float posX, posY;
  float dirX, dirY;

  int fade = 255; 

  float sizeFallout=random(0.3, 2.8);

  color colorFallout = color(random(255), random(255), random(255)) ;  

  Fallout ( float x_, float y_, 
    float dx_, float dy_) {

    posX = x_;
    posY = y_;
    dirX = dx_;
    dirY = dy_;
  }

  void display() {
    fill(colorFallout, fade); 
    noStroke();
    ellipse(posX, posY, 
      sizeFallout, sizeFallout);
  }

  void move() {
    posX+=dirX;
    posY+=dirY;
    fade-=1; 
  }

}
