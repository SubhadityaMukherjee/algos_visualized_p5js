// Linear Interpolation

float x;
float y;

float linterp(float x, float pos, float fraction){
  return (1- fraction)*pos + fraction * x;
}

void setup() {
  size(640, 360); 
  noStroke();  
}

void draw() { 
  background(51);
  
  x = linterp(x, mouseX, 0.95);
  y = linterp(y, mouseY, 0.95);
  
  fill(255);
  stroke(255);
  ellipse(x, y, 66, 66);
}
