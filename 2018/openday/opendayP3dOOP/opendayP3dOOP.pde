// Are we human enough?
// OpenDay2018 @unirsmdesign demo by Daniele @Fupete Tabellini and Davide Onestini
// original concept by Davide Onestini

// 2017–2018 © @Fupete, @davideonestini and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017–2018, San Marino & Firenze, Italy

// Use at your own risk :-)

// A world of rights... 'just' click countries to browse human rights violations
// RED = frequent violations reported that year
// ORANGE = some violations reported that year
// GREEN = no violations reported that year
// Use bottom slider to back<>forward from 1981 to 2011

/* 
 // Dataset Name: The CIRI Human Rights Dataset
 // Principal Investigators:  David L. Cingranelli, David L. Richards, and K. Chad Clay
 // Current Version Copyright: 2014
 // Dataset Version: 2014.04.14
 // URL: http://www.humanrightsdata.com
 */

import toxi.geom.Vec3D;
import controlP5.*;

ArrayList<Paese> Paesi;

//p3d world
PGraphics3D p3d;
PMatrix3D proj = new PMatrix3D();
PMatrix3D cam = new PMatrix3D();
PMatrix3D modvw = new PMatrix3D();
PMatrix3D modvwInv = new PMatrix3D();
PMatrix3D screen2Model = new PMatrix3D();
Vec3D alto = new Vec3D(0, 1, 0); 
// world rotation
float rotX, rotY, roX, roY, roZ;
int gino=1, pino=0, lino = 0;
float coeff = 0.0003;
boolean scorri = false;
// world zoom
int zum = 0;

ControlP5 cp5;

controlP5.Knob b;

int total = 100;

Table table;
Table table2;
Table table3;

color c_0 = #ff0000; 
color c_1 = #ff7700; 
color c_2 = #00ff00; 
color c_un = #ffffff;
color c_bg = #151515;
color c_c = #404040;
color c_e = #57504a;
color c_ee = #ffffff;

float ellipse_width = 17;

float arc = TWO_PI/12.5;
float arc_gap = TWO_PI/50;
float arc_stroke = 3;
float arc_f_stroke = 1.5;
float arc_width;
float arc_f_width;

float r = 360;
float e_r = 350;
float lt1, ln1, e_lt1, e_ln1, ee_ln1, ee_lt1;
float l_latitude, l_longitude;
String nomeCountry;
int annoCorrente;
int year, KILL, POLPRIS, TORT, ASSN, FORMOV, DOMMOV, SPEECH, ELECSD, RELFRE, WORKER, TOTAL;
boolean kill, polpris, tort, assn, formov, dommov, speech, elecsd, relfre, worker;

boolean insights = true;
boolean movement = false;
boolean stop_time = false;
boolean show_earth = true;
boolean show_coordinates = false;

boolean[] quale = { /* UI workaround :-) to select one */
  true, // < view all?
  false, // [1] = Extrajudicial Killing
  false, // [2] = Political Imprisonment
  false, // [3] = Torture
  false, // [4] = Freedom of Assembly and Association
  false, // [5] = Freedom of Foreign Movement
  false, // [6] = Freedom of Domestic Movement 
  false, // [7] = Freedom of Speech
  false, // [8] = Electoral Self-Determination
  false, // [9] = Freedom of Religion
  false  // [10] = Worker's Rights
};
String[] qualeDiritto = { /* UI workaround :-) naming each one */
  "", 
  "Uccisioni extragiudiziali", 
  "Arresti politici", 
  "Torture", 
  "Libertà d'assemblea e associazione", 
  "Libertà di viaggiare all'estero", 
  "Libertà di viaggiare nel paese", 
  "Libertà di parola", 
  "Auto-determinazione elettorale", 
  "Libertà di religione", 
  "Diritti dei lavoratori"
};
int qualeAttivo = 0;

int slider = 1981;
int timer;

// index of current mouseover / clicked vertex
int vertexMouseOver = -1;
int[] vertices2D = new int[0];
int visto = -1;

// UI post it object
boolean infoPaese = false;
Postit postIt;

PFont f;



void setup() {
  fullScreen(P3D);
  //size(800, 400, P3D);

  pixelDensity(displayDensity());

  //noCursor();
  cursor(CROSS);

  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);

  p3d = (PGraphics3D)g;
  perspective();

  //hint(ENABLE_STROKE_PERSPECTIVE);

  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);

  //gui
  cp5 = new ControlP5(this);
  // year
  cp5.addSlider("slider")
    .setLabel("")
    .setPosition(0, height-36)
    .setSize(width, 36)
    .setRange(1981, 2011)
    .setNumberOfTickMarks(31)
    .setSliderMode(Slider.FLEXIBLE)
    .setColorActive(#0000ff)
    .setColorBackground(#37302a)
    .setColorForeground(#ff0000);
  // right
  b = cp5.addKnob("knobQuale") // < invisible knob on the UI postit center, thought for a touchscreen...
    .setLabel("")
    .setPosition(int(width/10+15), int(height/2-67))
    .setRadius(70)
    //.setSize(36, height-400-36)
    .setRange(0, 10)
    .setNumberOfTickMarks(11)
    .setDragDirection(Knob.HORIZONTAL)
    .snapToTickMarks(true)
    .setTickMarkLength(4)
    .setColorValueLabel(color(0, 1))
    .setColorForeground(color(0, 1))
    .setColorBackground(color(0, 1))
    .setColorActive(color(0, 1))
    .setColorCaptionLabel(color(0, 1))
    .setColorLabel(color(0, 1))
    .setColorValue(color(0, 1))
    //.setSliderMode(Slider.FLEXIBLE)
    ;
  b.hide();
  // stile


  postIt = new Postit("  ");

  arc_width = ellipse_width + 3;
  arc_f_width = ellipse_width + 1;

  table = loadTable("ciri-data.csv", "header");
  table2 = loadTable("earth.csv", "header");
  table3 = loadTable("earth-dots.csv", "header");

  Paesi = new ArrayList();

  creaMondo();
}

void slider(int _anno) {
  annoCorrente = _anno;
  updateYear();
}

void knobQuale(int _quale) {
  quale[qualeAttivo] = false;
  qualeAttivo = _quale;
  quale[qualeAttivo] = true;
}

void creaMondo() {
  // the creation, the big bang
  int id = 0;
  for (TableRow row : table.findRows(str(annoCorrente)/*str(slider)*/, "year")) {
    nomeCountry = row.getString("country");
    lt1 = row.getFloat("latitude");
    ln1 = row.getFloat("longitude");
    year = row.getInt("year");
    KILL = row.getInt("KILL");
    POLPRIS = row.getInt("POLPRIS");
    TORT = row.getInt("TORT");
    ASSN = row.getInt("ASSN");
    FORMOV = row.getInt("FORMOV");
    DOMMOV = row.getInt("DOMMOV");
    SPEECH = row.getInt("SPEECH");
    ELECSD = row.getInt("ELECSD");
    RELFRE = row.getInt("RELFRE");
    WORKER = row.getInt("WORKER");
    Paesi.add(new Paese(id, 
      nomeCountry, lt1, ln1, year, 
      KILL, POLPRIS, TORT, ASSN, FORMOV, DOMMOV, SPEECH, ELECSD, RELFRE, WORKER
      ));
    id++;
  }
  println("");
  println("Big bang, creating world... year " + year);
  println(Paesi.size() + " countries");
}

// back<>forward in time/year
void updateYear() {
  Paesi.clear();
  creaMondo();
}


void draw() {

  background(0, 100);

  // 3d object space begin
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();

  lights();

  //apply mouse rotation and translation to center of screen
  translations();

  //get 3d matrices
  proj = p3d.projection.get();
  cam = p3d.camera.get();
  modvw = p3d.modelview.get();
  modvwInv = p3d.modelviewInv.get();

  terra();

  for (int i=0; i<Paesi.size(); i++) {
    Paesi.get(i).display();
  }

  hitDetect();

  popMatrix();
  hint(DISABLE_DEPTH_TEST);

  // if clicked on a country...
  if (visto != -1) {
    postIt.content = Paesi.get(visto).nomeCountry;
    postIt.display();
  }

  // title/credits
  pushStyle();
  textSize(18);
  textAlign(CENTER);
  fill(#999999);
  text("Are we human enough?", width/2, 30);
  popStyle();
}

void hitDetect() {
  // mouse hit detection using screnX, screenY
  vertices2D = new int[0];
  vertexMouseOver = -1;

  for (int i=0; i<Paesi.size(); i++) {
    if (modelZ(Paesi.get(i).pos.x, Paesi.get(i).pos.y, Paesi.get(i).pos.z) > 0 + zum) { // < solo quelli davanti...
      int x = int(screenX(Paesi.get(i).pos.x, Paesi.get(i).pos.y, Paesi.get(i).pos.z));
      int y = int(screenY(Paesi.get(i).pos.x, Paesi.get(i).pos.y, Paesi.get(i).pos.z));

      vertices2D = append(vertices2D, x);
      vertices2D = append(vertices2D, y);

      if (x > mouseX-30 && x < mouseX+30 && y > mouseY-30 && y < mouseY+30) {
        vertexMouseOver = i;
      }
    }
  }
}

void mouseDragged() {
  // mouse controlled matrix/view rotation
  if (scorri && !cp5.isMouseOver()) {
    int dx1 = mouseX-pmouseX;
    int dy1 = mouseY-pmouseY;
    rotX += -dy1 * 0.01;
    rotY += dx1 * 0.01;
  }
}

void mouseWheel(MouseEvent event) {
  // mouse wheel controlled matrix/view zoom
  if (!cp5.isMouseOver()) {
    int zumT = zum;
    int e = event.getCount();
    zumT+=e;
    zum = constrain(zumT, -600, 500);
  }
}

void mousePressed() {
  scorri = true;
  if (!cp5.isMouseOver()) // < country click
    visto = vertexMouseOver;
  if (visto!=-1) b.show(); // < show post it panel
  else b.hide(); // < hide post it panel
}

void mouseReleased() {
  scorri = false;
}

void translations() {
  //matrix/view transformations each frame
  translate(width/2, height/2, -height/4 + zum);
  //mouse rotate and default rotation
  roX = rotX + frameCount * lino * coeff;
  roY = rotY + frameCount * gino * coeff;
  roZ = frameCount * pino * coeff;
  rotateX(roX);
  rotateY(roY); 
  rotateZ(roZ);
}

void arc_coloring(int HUMANRIGHT) {
  /* rights color */
  if (HUMANRIGHT == 0) {
    noFill();
    stroke(c_0, 100);
  } else if (HUMANRIGHT == 1) {
    noFill();
    stroke(c_1, 100);
  } else if (HUMANRIGHT == 2) {
    noFill();
    stroke(c_2, 100);
  } else {
    noFill();
    stroke(c_un, 20);
  }
}

void ellipse_coloring(int HUMANRIGHT) {
  /* rights color */
  if (HUMANRIGHT == 0) {
    fill(c_0, 15);
  } else if (HUMANRIGHT == 1) {
    fill(c_1, 15);
  } else if (HUMANRIGHT == 2) {
    fill(c_2, 15);
  } else {
    fill(0, 0, 0, 15);
  }
}

void keyPressed() {
  // use keys for debug purpose 
  // LEFT|RIGHT browse countries then UP|DONW browse rights
  if (keyCode == LEFT) {
    if (visto > 0) visto--;
    else if (visto == 0 || visto == -1) visto = Paesi.size()-1;
  } else if (keyCode == RIGHT) {
    if (visto >= 0 && visto < Paesi.size()-1) visto ++;
    else if (visto == Paesi.size()-1 || visto == -1) visto = 0;
  } else if (keyCode == UP) {
    if (qualeAttivo < quale.length-1) {
      quale[qualeAttivo] = false;
      qualeAttivo++;
      quale[qualeAttivo] = true;
    } else if (qualeAttivo == quale.length-1) {
      quale[qualeAttivo] = false;
      qualeAttivo = 0;
      quale[qualeAttivo] = true;
    }
  } else if (keyCode == DOWN) {
    if (qualeAttivo > 0) {
      quale[qualeAttivo] = false;
      qualeAttivo--;
      quale[qualeAttivo] = true;
    } else if (qualeAttivo == 0) {
      quale[qualeAttivo] = false;
      qualeAttivo = quale.length-1;
      quale[qualeAttivo] = true;
    }
  }
}