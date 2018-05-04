// W3_ Esercitazione: mimesi
//
// C2_QUADRANDOMMATRIXROTATE by @fupete

// 2018 © Daniele @Fupete and the course DSII2018 @UniRSM  
// github.com/fupete — github.com/dsii-2018-unirsm
// Educational purposes, MIT License, 2018, San Marino

int d = 200; 
int crescitaMax = 100;

void setup() {
  fullScreen();
  stroke(0);
}

void draw() {
  //background(0);
 
  quadCaso();
  fill(#ff0000);
  float crescita = frameCount%crescitaMax;
  ellipse(width/2, height/2, d+crescita, d+crescita);
}

void quadCaso() {
  fill(random(255));
  int dT = int(10+random(d));
  int centroX = int(random(width));
  int centroY = int(random(height));
  float angRot = random(360);
  quad(centroX, centroY, angRot, dT);
}

void quad(int cx, int cy, float rot, int diamT) {
  pushMatrix();
  translate(cx, cy);
  rotate(radians(rot));
  rect(-diamT/2, -diamT/2, diamT, diamT);
  popMatrix();
}