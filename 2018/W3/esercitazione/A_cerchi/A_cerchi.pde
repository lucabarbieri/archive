// W3_ Esercitazione: mimesi
//
// A_CERCHI by @fupete: 
// 'disegnare' due cerchi a centro schermo, 
// uno passa nel centro dell’altro, il fondo è rosso

// 2018 © Daniele @Fupete and the course DSII2018 @UniRSM  
// github.com/fupete — github.com/dsii-2018-unirsm
// Educational purposes, MIT License, 2018, San Marino

// parametrizzare il diametro del cerchio
// rende facile...
int d = 200;

void setup() {

  // dimensione artboard
  //size(640,480); // < commentare con "//" per provare righe/pezzi alternative/i, [cmd-]|[ctrl-]
  fullScreen();

  //pixelDensity(displayDensity()); // :-)

  // < diametro cerchio proporzionale all'artboard
  d = height/3; 

  // stile linee/riempimenti
  stroke(#ffffff);
  strokeWeight(2);
  noFill();
}

void draw() { // < 60fps di default

  // cancella inizio frame, fondo rosso
  background(#ff0000);
  //background(255,0,0);

  // due cerchi, uno passa per il centro dell'altro 
  // sono a centro schermo...
  ellipse(width/2, height/2 - d/4, d, d);
  ellipse(width/2, height/2 + d/4, d, d);
}