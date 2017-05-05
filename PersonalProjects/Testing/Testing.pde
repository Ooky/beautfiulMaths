int pointDistance = 100;
ArrayList<Integer> vertexList = new ArrayList<Integer>();
int[] vertexArray = new int[width/pointDistance];
void setup() {
  size(800, 800, P3D);
  fill(204);
  noSmooth();
  stroke(255, 255, 255, 40);
  strokeWeight(2);
  drawPoints3x3Points();
}

void draw() {
  //background(0);
  //rotateX(mouseX);
  //rotateY(mouseY);
  //translate(mouseX, mouseY);
   // Change height of the camera with mouseY
  camera(mouseX, mouseY, 0, // eyeX, eyeY, eyeZ
         5.0, 1.0, 1.0, // centerX, centerY, centerZ
         1.0, 1.0, 1.0); // upX, upY, upZ
  
  //drawPoints3x3Points();
}
void drawPoints3x3Points() {

  for (int i = 0; i<=width; i+=pointDistance) {
    for (int j = 0; j<=height; j+=pointDistance) {
      for (int k = 0; k<=width; k+=pointDistance) {
        beginShape(POINTS);
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
        endShape();
      }
    }
  }
}