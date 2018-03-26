// W3_ Esercitazione: mimesi
//
// C_ROMBO by @fupete

// 2018 © Daniele @Fupete and the course DSII2018 @UniRSM  
// github.com/fupete — github.com/dsii-2018-unirsm
// Educational purposes, MIT License, 2018, San Marino

int d; 

void setup() {
  fullScreen();
  pixelDensity(displayDensity());

  d = height/2;

  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
}

void draw() {

  background(0);

  translate(width/2, height/2);

  stroke(#ff0000);
  int quanti = int(map(mouseX, 0, width, 1, 64));
  strokeWeight(64-quanti);
  for (int i = 0; i < quanti; i++) {
    rotate(PI/quanti);
    rect(0, 0, d, d);
  }

  stroke(255);
  strokeWeight(4);
  rotate(PI/4);
  rect(0, 0, d, d);
}