void setup() {
  background(0);
  stroke(255, 255, 255, 100);
  strokeWeight(2);
  size(800, 800, P3D);
  noSmooth();
  drawPoints3x3Points();
}




void drawPoints3x3Points() {
  for (int i = 0; i<width; i+=10) {
    for (int j = 0; j<height; j+=10) {
      point(i-1, j, 0);
      point(i+1, j, 0);
      point(i, j, 0);
      point(i, j-1, 0);
      point(i, j+1, 0);
    }
  }
}

void draw() {
  lights();
   camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  
}