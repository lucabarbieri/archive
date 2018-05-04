// W3_ Esercitazione: mimesi
//
// B_DIAGONALE by @fupete:
// 'disegnare' tre cerchi e due quadrati 
// intervallati, passano dalla diagonale
// il fondo è bianco

// 2018 © Daniele @Fupete and the course DSII2018 @UniRSM  
// github.com/fupete — github.com/dsii-2018-unirsm
// Educational purposes, MIT License, 2018, San Marino

// parametrizzare con variabili iniziali rende facile...
int dH, dV;   // < variabili di spostamento/griglie orizzontali e verticali
int d = 5;    // < diametro base
int loop = 4; // < numero di elementi desiderati sulla diagonale

void setup() {
 // dimensione artboard
  //size(640,480); // < commentare // per provare righe/pezzi alternative/i 
  fullScreen();

  //pixelDensity(displayDensity()); // :-)
  
  // configuriamo i delta/griglie rispetto alle dimensioni
  dH = width/loop;
  dV = height/loop;
  
  // stile
  noFill();         // < senza riempimenti
  rectMode(CENTER); // < si costruiscono rettangoli sviluppandoli dal loro centro
}

void draw() { // < 60fps di default

  // cancella inizio frame, fondo bianco
  // ci sono molti modi di indicare un colore bianco
  // si può anche cambiare il modo con colorMode(...) ...
  background(255);
  //background(255,255,255);
  //background(255,255,255,100);
  //background(#ffffff);
  
  // For loop, conta da 0 a loop-1 (notare il minore, 
  // non il minore uguale in questo caso), conta ogni 
  // passaggio, infatti numero++ è uguale a numero+=1 
  // che è uguale a numero = numero + 1
  for (int i=0; i < loop; i++) {
    // quello che accade i volte:
    ellipse(dH*i, dV*i, d*i, d*i); // < cerchio con diametro e posizione relativa a numero ripetizione i
    if ( i != loop-1 )             // < se non è l'ultimo loop allora 
      rect(dH/2 + dH*i, dV/2 + dV*i, d*i, d*i); // < fai anche un rettangolo proporzionale...
  }
}