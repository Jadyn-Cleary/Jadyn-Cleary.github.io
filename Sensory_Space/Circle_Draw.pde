
void setup() {
  size(700, 700); //determines size of the background
  background(0); //makes the background color white
}

void draw() {
  textSize(20);
  fill(255);
  text("press spacebar to clear screen", 10, 15);
  if(keyPressed) {
   if (key == ' ' || key == ' ') {
   clear();
   }
 } 
}

void mouseReleased(){
  fill(random(255), random(255), random(255));
  noStroke();
  float rand = random(30,100);
  ellipse(mouseX, mouseY, rand, rand);
}
