void setup() {
  background(0);
  size(800, 800, P3D);
  translate(0, 200);  
  drawSphere(400, 400, 100, 200);
  
}


void drawSphere(float x, float y, float z, int radius) {
  //x = x_ursprung+r*cos(omega)*sind(phi)
  //y = y_ursprung+r*sin(omega)*sind(phi)
  //z = z_ursprung+r*cos(phi)
  float posX=x;
  float posY=y;
  float posZ=z;
  for (int i  = 0; i<360; i++) {
    for (int j = 0; j<360; j++) {
      stroke(255-z);
      point(x, y, z);
      x=posX+radius*cos(i)*sin(j);
      y=posY+radius*sin(i)*sin(j);
      z=posZ+radius*cos(j);
    }
  }
}

void draw() {
  //This empty method is needed, otherwise its flickering
}