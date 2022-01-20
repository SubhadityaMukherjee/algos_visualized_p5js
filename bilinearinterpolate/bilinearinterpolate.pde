// Bilinear Interpolation

float a, b, c,d;

float bilinterp(float a, float b, float c, float d, float alpha, float beta){
  return ((1-beta) * (1-alpha) * a) + (alpha* beta * c) + ( alpha * (1-beta)*b) + (beta * (1- alpha) * d);
}

void setup() {
  size(640, 360); 
  noStroke();  
}

void draw() { 
  background(51);
  c = 600;
  d = 200;
  
  a = bilinterp(mouseX, mouseY, c, c, 0.2, 0.2);
  b = bilinterp(mouseX, mouseY, d, d, 0.2, 0.2);
  
  fill(255);
  stroke(255);
  ellipse(a, b, 33, 33);
}
