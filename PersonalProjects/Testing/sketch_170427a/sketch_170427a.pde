private int arrayICounter=0;
private boolean runThroughOnce = false;

void setup() {
  background(0);
  stroke(255, 255, 255, 40);
  strokeWeight(2);
  size(800, 800, P3D);
  noSmooth();
  drawPoints3x3Points();
}




void drawPoints3x3Points() {
  beginShape(POINTS);
  for (int i = 0; i<=width; i+=50) {
    for (int j = 0; j<=height; j+=50) {
      for (int k = 0; k<=width; k+=50) {
        vertex(i, j, k);

        vertex(i, j, k-1);
        vertex(i, j, k+1);
        
        vertex(i, j-1, k);
        vertex(i, j+1, k);

        vertex(i-1, j, k);
        vertex(i+1, j, k);

        vertex(i, j-1, k-1);
        vertex(i, j+1, k-1);
        vertex(i, j-1, k+1);
        vertex(i, j+1, k+1);

        vertex(i-1, j, k-1);
        vertex(i+1, j, k-1);
        vertex(i-1, j, k+1);
        vertex(i+1, j, k+1);

        vertex(i-1, j-1, k);
        vertex(i+1, j-1, k);
        vertex(i-1, j+1, k);
        vertex(i+1, j+1, k);


        vertex(i-1, j-1, k-1);
        vertex(i+1, j-1, k-1);
        vertex(i-1, j+1, k-1);
        vertex(i+1, j+1, k-1);

        vertex(i-1, j-1, k+1);
        vertex(i+1, j-1, k+1);
        vertex(i-1, j+1, k+1);
        vertex(i+1, j+1, k+1);
        
        
        
      }
    }
  }
  endShape();
}

private void drawDotsAnimated() {
  if (!runThroughOnce) {
    if (arrayICounter>width) {
      runThroughOnce=true;
    }
    for (int arrayJCounter = 0; arrayJCounter<=height; arrayJCounter+=10) {
      point(arrayICounter-1, arrayJCounter, 0);
      point(arrayICounter+1, arrayJCounter, 0);
      point(arrayICounter, arrayJCounter, 0);
      point(arrayICounter, arrayJCounter-1, 0);
      point(arrayICounter, arrayJCounter+1, 0);
    }
    arrayICounter+=10;
  }
}


void draw() {
  //lights();
  //drawDotsAnimated();
  //camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
  //0.0, 0.0, 0.0, // centerX, centerY, centerZ
  //0.0, 1.0, 0.0); // upX, upY, upZ
}