// https://thecodingtrain.com/challenges/coding-in-the-cabana/005-marching-squares.html

float[][] field;
int rez = 40;
int cols, rows;
int ler = 1;

void setup() {
  size(1280, 720);
  cols = 1 + width / rez;
  rows = 1 + height / rez;
  field = new float[cols][rows];
  randomSeed(0); //reproducability
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      field[i][j] = floor(random(2));
    }
  }
}

void line(PVector v1, PVector v2) {
  line(v1.x, v1.y, v2.x, v2.y);
}

void draw() {
  background(0); 
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      stroke(field[i][j]*255);
      strokeWeight(rez*.4);
      point(i*rez, j*rez);
    }
  }

  for (int i = 0; i < cols-1; i++) {
    for (int j = 0; j < rows-1; j++) {
      float x = i * rez;
      float y = j * rez;
      
        PVector p = new PVector(x, y            );
        PVector q = new PVector(x + rez, y);
        PVector r = new PVector(x + rez, y + rez      );
        PVector s = new PVector(x, y + rez);
        PVector a = new PVector();
        PVector b = new PVector();
        PVector c = new PVector();
        PVector d = new PVector();
        
      if(ler == 1){
        a = PVector.lerp(p,q,0.5);
        b = PVector.lerp(q,r,0.5);
        c = PVector.lerp(r,s,0.5);
        d = PVector.lerp(s,p,0.5);
      }else{
        a = new PVector(x + rez * 0.5, y            );
        b = new PVector(x + rez, y + rez * 0.5);
        c = new PVector(x + rez * 0.5, y + rez      );
        d = new PVector(x, y + rez * 0.5);
      }

      int state = getState(ceil(field[i][j]), ceil(field[i+1][j]), 
        ceil(field[i+1][j+1]), ceil(field[i][j+1]));
        
      stroke(255);
      strokeWeight(1);
      switch (state) {
      case 1:  
        line(c, d);
        break;
      case 2:  
        line(b, c);
        break;
      case 3:  
        line(b, d);
        break;
      case 4:  
        line(a, b);
        break;
      case 5:  //AMB
        line(a, d);
        line(b, c);
        break;
      case 6:  
        line(a, c);
        break;
      case 7:  
        line(a, d);
        break;
      case 8:  
        line(a, d);
        break;
      case 9:  
        line(a, c);
        break;
      case 10: //AMB
        line(a, b);
        line(c, d);
        break;
      case 11: 
        line(a, b);
        break;
      case 12: 
        line(b, d);
        break;
      case 13: 
        line(b, c);
        break;
      case 14: 
        line(c, d);
        break;
      }
    }
  }
}

int getState(int a, int b, int c, int d) {
  return a * 8 + b * 4  + c * 2 + d * 1;
}
