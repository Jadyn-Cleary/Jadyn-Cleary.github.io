/*
Name: Jadyn C
Date: 09/30/18
Assignment name: Java-Drawings
Project name: Gradient Circle
Description: 
This code displays seven gradient layers across the screen along with a circle. Which ever layer the circle is on, it will turn that color.
*/

void setup() {
  size(700, 700); //creates size of the background
  background(0); //creates color of the background
}
void draw() {
  fill(255,0,0); //determines the color of the layer
  rect(0,0,700,100); //determines the size and placement of the layer
  fill(255,150,0);
  rect(0,100,700,100);
  fill(255,200,0);
  rect(0,200,700,100);
  fill(200,200,0);
  rect(0,300,700,100);
  fill(0,185,150);
  rect(0,400,700,100);
  fill(60,110,210);
  rect(0,500,700,100);
  fill(130,100,250);
  rect(0,600,700,100);
  rect(0,700,700,100);
  fill(0); //creates a color for the circle
  ellipse(mouseX, mouseY, 100, 100); //places the center of the circle wherever the mouse is and determines the size of the circle
  if(mouseY>0) {
    fill(255,0,0);
    ellipse(mouseX, mouseY, 100, 100);
  } //makes it so that when the mouse's verticle position is greater that 0 the color of the circle will be red
  if(mouseY>100) {
    fill(255,150,0);
    ellipse(mouseX, mouseY, 100, 100);
  } //makes it so that when the mouse's verticle position is greater that 100 the color of the circle will be orange
  if(mouseY>200) {
    fill(255,200,0);
    ellipse(mouseX, mouseY, 100, 100);
  } //makes it so that when the mouse's verticle position is greater that 200 the color of the circle will be yellow
  if(mouseY>300) {
    fill(200,200,0);
    ellipse(mouseX, mouseY, 100, 100);
  } //makes it so that when the mouse's verticle position is greater that 300 the color of the circle will be green
  if(mouseY>400) {
    fill(0,185,150);
    ellipse(mouseX, mouseY, 100, 100);
  } //makes it so that when the mouse's verticle position is greater that 400 the color of the circle will be bule-green
  if(mouseY>500) {
    fill(60,110,210);
    ellipse(mouseX, mouseY, 100, 100);
  } //makes it so that when the mouse's verticle position is greater that 500 the color of the circle will be blue
  if(mouseY>600) {
    fill(130,100,250);
    ellipse(mouseX, mouseY, 100, 100);
  } //makes it so that when the mouse's verticle position is greater that 600 the color of the circle will be purple
}
