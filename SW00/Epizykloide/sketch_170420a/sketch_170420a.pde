void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  //drawEpizykloide(400, 400, 50, 360);
  drawEpizykloideRandomColor(400, 400, 70, 120);
}

void drawEpizykloideRandomColor(float x, float y, int outerRadius, int innerRadius) {
  float startX=x;
  float startY=y;
  point(startX, startY);
  float a= outerRadius;
  float b= innerRadius;

  int counter = 0;

  for (float f = 0; f <100000; f+=1) {
    if (counter%1000==0) {
      float red = random(0, 255);
      float green = random(0, 255);
      float blue = random(0, 255);
      stroke(red, green, blue);
    }
    counter++;
    x = startX+(a+b)*cos(f) - a*cos((1+(b/a))*f);
    y = startY+(a+b)*sin(f) - a*sin((1+(b/a))*f);
    point(x, y);
  }
}



void drawEpizykloide(float x, float y, int outerRadius, int innerRadius) {
  float startX=x;
  float startY=y;
  point(startX, startY);
  float a= outerRadius;
  float b= innerRadius;


  for (float f = 0; f <100000; f+=1) {
    x = startX+(a+b)*cos(f) - a*cos((1+(b/a))*f);
    y = startY+(a+b)*sin(f) - a*sin((1+(b/a))*f);
    point(x, y);
  }
}