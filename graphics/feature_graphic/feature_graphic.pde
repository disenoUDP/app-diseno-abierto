// google play store
// october 30th 2023
// Your feature graphic must be a PNG or JPEG, up to 15 MB, and 1,024 px by 500 px

PGraphics render;

int printWidth = 1024;
int printHeight = 500;
int printDPI = 10;

int renderWidth;
int renderHeight;

PFont inter;

void setup() {
  size(100, 100);

  renderWidth = printWidth * printDPI;
  renderHeight = printHeight * printDPI;

  //render = createGraphics(renderWidth, renderHeight);
  render = createGraphics(renderWidth, renderHeight);

  inter = loadFont("Inter-Regular-48.vlw");
}

void draw() {

  render.beginDraw();

  render.background(255, 0, 0);

  render.textSize(48 * printDPI);

  render.rectMode(CENTER);
  render.noStroke();

  render.fill(255, 0, 0);
  render.rect(
    renderWidth/2,
    renderHeight/2,
    2*renderWidth/3,
    2*renderHeight/3
    );


  for (int i = 0; i < 50; i++) {
    render.fill(255, random(255));
    render.textAlign(CENTER, CENTER);

    render.fill(255, random(255));
    render.pushMatrix();
    render.translate(
      random(renderWidth),
      random(renderHeight));
    render.rotate(random(-TWO_PI, TWO_PI));
    render.text("diseño", 0, 0);
    render.popMatrix();

    render.fill(255, random(255));
    render.pushMatrix();
    render.translate(
      random(renderWidth),
      random(renderHeight));
    render.rotate(random(-TWO_PI, TWO_PI));
    render.text("abierto", 0, 0);
    render.popMatrix();
  }


  render.endDraw();
}

void mousePressed() {
  render.save("featureGraphic.jpg");
}
