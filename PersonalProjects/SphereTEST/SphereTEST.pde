import peasy.*;
PeasyCam cam;
PVector[][] arrVertex;
final int totalPoints =100;
final float radius = 200; //Float because calculations below is also in float
final int sphereRadius = 200;
float a = 1;
float b = 1;
float offset=0;
float m = 0;
float mChange = 0;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);
  arrVertex = new PVector[totalPoints+1][totalPoints+1];
  //initializeVertexArray();
}

void draw() {
  m = map(sin(mChange), -1, 1, 0, 7); //sin is for smoothing here
  mChange += 0.02;
  background(0);
  noStroke();
  lights();
  initializeVertexArray();
  drawSphere();
}

float superShape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1, n2);

  float t2 = abs((1/b)*sin(m * theta / 4));
  t2 = pow(t2, n3);

  float t3 = t1+t2;

  float radius = pow(t3, -1 / n1); 
  return radius;
}

private void drawSphere() {
  //fill(255);
  //noFill();
  offset+=5;
  for (int i  =0; i <totalPoints; i++) {
    float hu = map(i, 0, totalPoints, 0, 255*6);
    fill((hu+offset)%255, 255, 255);
    beginShape(TRIANGLE_STRIP); 
    for (int j = 0; j < totalPoints+1; j++) {
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
    float latitude = map(i, 0, totalPoints, -HALF_PI, HALF_PI);
    float r2 = superShape(latitude, m, 0.2, 1.7, 1.7);
    //float r2 = superShape(latitude, 2, 10, 10, 10);
    for (int j = 0; j< totalPoints+1; j++) {
      float longitude = map(j, 0, totalPoints, -PI, PI);
      float r1 = superShape(longitude, m, 0.2, 1.7, 1.7);
      //float r1 = superShape(longitude, 8, 60, 100, 30);
      float x = radius * r1 * cos(longitude) * r2 * cos(latitude);
      float y = radius * r1 * sin(longitude) * r2 * cos(latitude);
      float z = radius * r2 * sin(latitude); 
      arrVertex[i][j] = new PVector(x, y, z);
      /*
      PVector v = PVector.random3D();
       v.mult(10);
       arrVertex[i][j].add(v);
       */
    }
  }
}