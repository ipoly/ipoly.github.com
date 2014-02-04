PGraphics pg;

void setup() {
  size(100, 100);
  pg = createGraphics(80, 80, P3D);
}

void draw() {
  pg.beginDraw();
  pg.background(102);
  pg.stroke(255);
  pg.line(40, 40, mouseX, mouseY);
  pg.endDraw();
  image(pg, 10, 10); 
}
