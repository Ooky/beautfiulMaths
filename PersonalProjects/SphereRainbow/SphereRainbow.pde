import peasy.*;
PeasyCam cam;
PVector[][] arrVertex;
final int totalPoints = 200;
final float radius = 200; //Float because calculations below is also in float
final int sphereRadius = 200;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);
  arrVertex = new PVector[totalPoints+1][totalPoints+1];
  initializeVertexArray();
}

void draw() {
  background(0);
  noStroke();
  lights();
  //initializeVertexArray();
  drawSphere();
}

private void drawSphere() {
  for (int i  =0; i <totalPoints; i++) {
    beginShape(TRIANGLE_STRIP); 
    for (int j = 0; j < totalPoints+1; j++) {
      float hu = map(j, 0, totalPoints, 0, 255*6);
      fill(hu%255, 255, 255);
      PVector v1 = arrVertex[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = arrVertex[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}

private void initializeVertexArray() {
  for (int i = 0; i < totalPoints+1; i++) {
    float latitude = map(i, 0, totalPoints, 0, PI);
    for (int j = 0; j< totalPoints+1; j++) {
      float longitude = map(j, 0, totalPoints, 0, TWO_PI);
      float x = radius * sin(latitude) * cos(longitude);
      float y = radius * sin(latitude) * sin(longitude);
      float z = radius * cos(latitude); 
      arrVertex[i][j] = new PVector(x, y, z);
      /*
      PVector v = PVector.random3D();
       v.mult(10);
       arrVertex[i][j].add(v);
       */
    }
  }
}