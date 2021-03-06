/*@pjs preload="
  /p5/mosaic3d/data/20/0.png,
  /p5/mosaic3d/data/20/1.png,
  /p5/mosaic3d/data/20/2.png,
  /p5/mosaic3d/data/20/3.png,
  /p5/mosaic3d/data/20/4.png,
  /p5/mosaic3d/data/20/5.png,
  /p5/mosaic3d/data/20/6.png,
  /p5/mosaic3d/data/20/7.png,
  /p5/mosaic3d/data/20/8.png,
  /p5/mosaic3d/data/20/9.png,
  /p5/mosaic3d/data/20/10.png,
  /p5/mosaic3d/data/20/11.png,
  /p5/mosaic3d/data/20/12.png,
  /p5/mosaic3d/data/20/13.png
"
*/
Ball ball1;
Mosaic m;
View v;
PImage img;
int count =0;
int len = 14;
String[] imgs = new String[len];
int mButton;

void setup() {
  size(800, 600, P3D);
  background(0);
  frameRate(30);
  smooth();
  m = new Mosaic(5, 12);
  v = new View();
  for (int i=0;i<len;i++) {
    imgs[i] = "/p5/mosaic3d/data/20/"+i+".png";
  }
}

void draw() {
  background(255);
  lights();
  translate(width/2, height/2, -200);
  v.rotate();
  m.animateTo(imgs[count]);
//  float camZ = (height/2.0)/tan(PI*60/360);
//  camera(mouseX, mouseY, camZ, width/2.0, height/2.0, 0, 0, 1, 0);
}


void mousePressed() {
  mButton = mouseButton;
}

void mouseDragged() {
  v.dragging();
}

void mouseClicked() {
  if (mButton == LEFT) {
    count = ++count % imgs.length;
  }

  if (mButton == RIGHT) {
    count = (count-1+imgs.length) % imgs.length;
  }
}

