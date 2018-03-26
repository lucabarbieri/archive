// W3_ Esercitazione: mimesi
//
// D_RANDOMWALKERLIMITRAINBOW by @fupete

// 2018 © Daniele @Fupete and the course DSII2018 @UniRSM  
// github.com/fupete — github.com/dsii-2018-unirsm
// Educational purposes, MIT License, 2018, San Marino

int x, y;
int v = (int) random(10, 100);
int l = (int) random(40, 200);
int tone;

void setup() {
  //fullScreen();
  size(650, 480);
  pixelDensity(displayDensity());

  // posizione iniziale
  x = width / 2;
  y = height / 2;

  // style
  rectMode(CENTER);
  //noStroke();
  colorMode(HSB, 360, 100, 100, 100); // < cambio modalità colore
  //fill(180, 100, 100, 50); // < es. metà tono, metà alpha...
  background(300);
}

void draw () {
  //background(300);

  tone = frameCount%360;
  fill(tone, 100, 100, 30);

  rect (x, y, l, l);

  v = (int) random(20);

  // calcolo spostamento, direzione casuale, velocità v
  int deltaH = v * (int) random(-2, 2);   // < sx|dx
  int deltaV = v * (int) random(-2, 2 );  // < up|down

  // controlliamo i limiti e cambiamo direzione se è il caso
  if (x + deltaH >= width || x + deltaH < 0) deltaH *= -1;
  if (y + deltaV >= height || y + deltaV < 0) deltaV *= -1;

  // ci muoviamo
  x = x + deltaH;
  y = y + deltaV;
}

void keyPressed() {
  background(300); 
  v = (int) random(1, 50);
  l = (int) random(10, 50);
  stroke(random(360));
}