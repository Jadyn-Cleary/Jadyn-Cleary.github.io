
void setup() {
  size(700, 700); //determines size of the background
  background(0); //makes the background color white
}

void draw() {
}

void mouseReleased(){
  fill(random(255), random(255), random(255));
  noStroke();
  float rand = random(30,100);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, rand, rand);
}
