class Postit {
  /* post it for gui purpose */
  String content= "  ";
  int x, y;

  Postit(String _content) {
    content = _content;
    x = width/10;
    y = height/10;
  }

  void display() {

    textSize(24);
    fill(#ffffff);
    text(content, x, height/2-ellipse_width*10);

    textSize(18);
    text(year, x, height/2-ellipse_width*10-30);
    
    if (qualeAttivo > 0 && qualeAttivo < qualeDiritto.length) {
      text(qualeDiritto[qualeAttivo], x, height/2+ellipse_width*10);
    }

    noStroke();

    /* let's draw the circle big and in front! */
    if (visto != -1) {
      int zum = 10;
      Paesi.get(visto).disegna(int(x+(ellipse_width*zum)/2), height/2, zum);
    }
  }
}