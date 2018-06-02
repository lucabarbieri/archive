// Luca Barbieri @lb © 2017-18 MIT License
// Making visible | San Marino, RSM | 3.2018
// Educational purpose, made for DSII2018 lab @UniRSM

// To run this example locally, you will need an image file, and a running local server.
// For a little guide to create a local server visit: https://github.com/lmccart/itp-creative-js/wiki/SimpleHTTPServer

/*
loadImage array produce an object similar to:
Object {
  width: 800,
  height: 320,
  canvas: canvas,
  drawingContext: CanvasRenderingContext2D,
  _pixelDensity: 1,
  _modified: false,
  pixels: [],
  name: "p5.Image",
  modified: true
}
*/

var img = [];
var display_timing = [100,180,600,800,1000,1200,1400,1600,1800,2000];
var img_count = 0;

function preload(){
 for(var i =0; i<10;i++){
   img[i] = loadImage("assets/" + i + ".jpg"); // Load the image
       console.log(img[i]);
 }
}


function setup()
{
  frameRate(30);
  createCanvas(windowWidth, windowHeight);
  background(51);
  img = loadImage("assets/name.jpg");
  preload();

  // display instructions
  textAlign(CENTER);
  fill(100);
  noStroke();
  text("Emotional machine", width/2, height/2);

}

function draw()
{
  imageMode(CENTER);
  //console.log(frameCount);
  if (frameCount === display_timing[img_count]){
    background(51);
    // [url, position_width, position_height, dimension_x, dimension_y]
    image(img[img_count], width/2, height/2, img[img_count].width/2, img[img_count].height/2); // display the img
    img_count ++;
  }
}


// implementazioni future
// Tool di creazione di immagini campioni, fake (un Lorem ipsum delle immagini)

/*
// NOTE:
Most useful dimension for digital image:
1600 x 1200
2048 x 1536
2272 x 1704
2560 x 1920
3264 x 2448
3872 x 2592
4288 x 2848
4536 x 3024
5196 x 3464
Facebook 1200 x 628
Twitter 1024 x 576
Instagram 1080 x 1080
Linkedln 552 x 368
Pinterest 600 x 900
Google+ 800 x 320

Horizontal (landscape) 1024 x 512
Vertical (portrait) 800 x 1200

*/
