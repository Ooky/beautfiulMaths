float theta;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  stroke(255);
  theta = map(mouseX, 0, width, 0, radians(45));
  translate(width/2, height);
  branch(200);
}


void branch(float len) {
  //stroke(len*10);
  line(0, 0, 0, -len);
  translate(0, -len);

  len *= 0.66;

  if (len > 2) {
    //Saves originPoint
    pushMatrix();
    rotate(theta);
    branch(len);
    //GoBackToOriginPoint
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}