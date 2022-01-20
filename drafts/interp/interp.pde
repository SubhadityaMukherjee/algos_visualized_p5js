// Bilinear Interpolation

float a, b, c,d;
float temp = 3.0;

float bilinterp(float a, float b, float c, float d, float alpha, float beta){
  return ((1-beta) * (1-alpha) * a) + (alpha* beta * c) + ( alpha * (1-beta)*b) + (beta * (1- alpha) * d);
}

void setup() {
  size(640, 360); 
  noStroke();  
}

void draw() { 
  background(51);
  
  a = bilinterp(mouseX, mouseY, mouseX+temp,600, 200, 0.2, 0.2);
  b = bilinterp(mouseX, mouseY, 600, 200, 0.2, 0.2);
  
  fill(255);
  stroke(255);
  ellipse(a, b, 33, 33);
}
