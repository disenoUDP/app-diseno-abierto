// google play store
// october 30th 2023
// Your app icon must be a PNG or JPEG, up to 1 MB, 512 px by 512 px, and meet our design specifications and metadata policy

PFont inter;

void setup() {
  size(512, 512);
  
  background(255);
  
  inter = loadFont("Inter-Regular-48.vlw");
  textSize(48);
  
  rectMode(CENTER);
  noStroke();
  
  fill(255, 0, 0);
  rect(width/2, height/2, 2*width/3, 2*height/3);
  
  fill(255);
  textAlign(RIGHT, CENTER);
  text("diseño", width/2, 40*height/100);
  
  fill(255);
  textAlign(LEFT, CENTER);
  text("abierto", width/2, 60*height/100);
  
}

void draw() {
}

void mousePressed() {
  saveFrame("appIcon.jpg");
}
