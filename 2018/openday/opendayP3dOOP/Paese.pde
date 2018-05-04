class Paese {
  int id;
  String nomeCountry;
  float lt1, ln1;
  int year;
  int KILL, POLLPRIS, TORT, ASSN, FORMOV, DOMMOV, 
    SPEECH, ELECSD, RELFRE, WORKER;
  int TOTAL;
  Vec3D pos;

  Paese(
    int _id, 
    String _nomeCountry, float _lt1, float _ln1, int _year, 
    int _KILL, int _POLLPRIS, int _TORT, int _ASSN, int _FORMOV, int _DOMMOV, 
    int _SPEECH, int _ELECSD, int _RELFRE, int _WORKER) {
    nomeCountry = _nomeCountry;
    id = _id;
    lt1 = _lt1;
    ln1 = _ln1;
    year = _year;
    KILL = _KILL;
    POLLPRIS = _POLLPRIS;
    TORT = _TORT;
    ASSN = _ASSN;
    FORMOV = _FORMOV;
    DOMMOV = _DOMMOV;
    SPEECH = _SPEECH;
    ELECSD = _ELECSD;
    RELFRE = _RELFRE;
    WORKER = _WORKER;
    TOTAL = KILL + POLPRIS + TORT + ASSN + FORMOV + DOMMOV + SPEECH + ELECSD + RELFRE + WORKER;
  }


  void display() {

    // this country coord in space
    float theta = radians(this.lt1) + PI/2;
    float phi = radians(-this.ln1) + PI;
    float x1 = r * sin(theta) * cos(phi);
    float z1 = r * sin(theta) * sin(phi);
    float y1 = r * cos(theta);
    pos = new Vec3D (x1, y1, z1); 
    
    // this country coord/axes normalized
    Vec3D tar = pos.getNormalized(); 
    Vec3D axes = alto.cross( tar ); 
    axes.normalize();  // < 
    float angle = acos(alto.dot(tar));

    // if selected connect it to the center of the world... 
    if (visto == id) {
      sphereDetail(7);
      sphere(10);
      stroke(255);
      strokeWeight(2);
      line(0, 0, 0, pos.x, pos.y, pos.z);
    } 

    // let's draw the right on the world surface
    pushMatrix();
    translate(pos.x, pos.y, pos.z); // move to country coord in space
    rotate(angle, axes.x, axes.y, axes.z); // rotate to be parallel to the radius of this point
    rotate(HALF_PI, 1, 0, 0); // rotate by HALF_PI to be always tangent to surface and draw the circle...
 
    // if selected let's focus around it a white circle
    if (visto == id) {
      strokeWeight(4);
      ellipse(0, 0, ellipse_width+20, ellipse_width+20);
    } 

    noStroke();
    fill(255, 255, 255, 100);
 
    /* and finally draw the "circle of rights", let's do the magic */
    disegna(0, 0, 1);

    popMatrix();
  }

  // draw the circle indipendent from space with coord and zoom
  // same function to draw the post it ui when selected, called twice
  void disegna(int x, int y, int zum) {
    float w = ellipse_width * zum;
    
    /* coloring not the best way till now but it's working :-) */
    ellipse_coloring(KILL);
    ellipse(x, y, w, w);
    ellipse_coloring(POLPRIS);
    ellipse(x, y, w, w);
    ellipse_coloring(TORT);
    ellipse(x, y, w, w);
    ellipse_coloring(ASSN);
    ellipse(x, y, w, w);
    ellipse_coloring(FORMOV);
    ellipse(x, y, w, w);
    ellipse_coloring(DOMMOV);
    ellipse(x, y, w, w);
    ellipse_coloring(SPEECH);
    ellipse(x, y, w, w);
    ellipse_coloring(ELECSD);
    ellipse(x, y, w, w);
    ellipse_coloring(RELFRE);
    ellipse(x, y, w, w);
    ellipse_coloring(WORKER);
    ellipse(x, y, w, w);

    /* and now the flower of rights */
    arc_width = w + 3*zum;
    arc_f_width = w + 1*zum;
    strokeWeight(arc_stroke*zum/3);
    if (insights) {
      arc_coloring(KILL);
      arc(x, y, arc_width, arc_width, arc_gap, arc_gap+arc);
      arc_coloring(POLPRIS); 
      arc(x, y, arc_width, arc_width, arc_gap*2+arc, arc_gap*2+arc*2);
      arc_coloring(TORT);
      arc(x, y, arc_width, arc_width, arc_gap*3+arc*2, arc_gap*3+arc*3);
      arc_coloring(ASSN);
      arc(x, y, arc_width, arc_width, arc_gap*4+arc*3, arc_gap*4+arc*4);
      arc_coloring(FORMOV);
      arc(x, y, arc_width, arc_width, arc_gap*5+arc*4, arc_gap*5+arc*5);
      arc_coloring(DOMMOV);
      arc(x, y, arc_width, arc_width, arc_gap*6+arc*5, arc_gap*6+arc*6);
      arc_coloring(SPEECH);
      arc(x, y, arc_width, arc_width, arc_gap*7+arc*6, arc_gap*7+arc*7);
      arc_coloring(ELECSD);
      arc(x, y, arc_width, arc_width, arc_gap*8+arc*7, arc_gap*8+arc*8);
      arc_coloring(RELFRE);
      arc(x, y, arc_width, arc_width, arc_gap*9+arc*8, arc_gap*9+arc*9);
      arc_coloring(WORKER);
      arc(x, y, arc_width, arc_width, arc_gap*10+arc*9, arc_gap*10+arc*10);

      /* and the focus on the selected right */
      noFill();
      stroke(c_ee);
      strokeWeight(arc_f_stroke * zum/3);
      if (quale[1]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap, arc_gap+arc);
      } else if (quale[2]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*2+arc, arc_gap*2+arc*2);
      } else if (quale[3]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*3+arc*2, arc_gap*3+arc*3);
      } else if (quale[4]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*4+arc*3, arc_gap*4+arc*4);
      } else if (quale[5]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*5+arc*4, arc_gap*5+arc*5);
      } else if (quale[6]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*6+arc*5, arc_gap*6+arc*6);
      } else if (quale[7]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*7+arc*6, arc_gap*7+arc*7);
      } else if (quale[8]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*8+arc*7, arc_gap*8+arc*8);
      } else if (quale[9]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*9+arc*8, arc_gap*9+arc*9);
      } else if (quale[10]) { 
        arc(x, y, arc_f_width, arc_f_width, arc_gap*10+arc*9, arc_gap*10+arc*10);
      }
    } // < insights
  }
} 