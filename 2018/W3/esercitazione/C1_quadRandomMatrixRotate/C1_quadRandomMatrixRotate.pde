// W3_ Esercitazione: mimesi
//
// C1_QUADRANDOMMATRIXROTATE by @fupete
// 'disegnare' infiniti quadrati/rettangoli
// ognuno in una posizione casuale 
// sullo schermo ruotati ognuno di un angolo a caso, 
// con lato lungo a caso, colorati a caso...

// 2018 © Daniele @Fupete and the course DSII2018 @UniRSM  
// github.com/fupete — github.com/dsii-2018-unirsm
// Educational purposes, MIT License, 2018, San Marino

int d = 200; 

void setup() {
  fullScreen();
  stroke(255);
}

void draw() {
  
  //background(0);
  
  fill(random(255));
  translate(random(width), random(height));
  rotate(random(radians(360)));
  rect(-d/2, -d/2, 10+random(d), 10+random(d));
}