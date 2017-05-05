float e = (float) Math.E;

void setup() {
  size(800, 800);
  background(0);
  stroke(255, 255, 255);
  //drawSpirale(400, 400, 400);
  //drawSpiraleWithLine(50, 400, 400);
  //drawSpiraleWithLine2(0, 400, 400);
  //drawSpiraleLogarithmic(20, 400, 400);
  //somethingSpecial(200,400,400);
  //mikeSolutionSpiralLogarithmic(20, 0.01, 200, 200);
  goldenRatio(400, 400);
}

void goldenRatio(float posX, int posY) {
  //MiddlePoint
  point(posX, posY);
  //Ratio
  float a = 0.6180;
  float b = 0.382;

  float lastX=posX+a*pow(e, b*0)*cos(0);
  float lastY=posY+a*pow(e, b*0)*sin(0);

  for (float f = 0; f<720; f+=0.01) {//f<360; f+=1  //f<720; f+=0.5
    line(lastX, lastY, posX+a*pow(e, b*f)*cos(f), posY+a*pow(e, b*f)*sin(f));
    lastX=posX+a*pow(e, b*f)*cos(f);
    lastY=posY+a*pow(e, b*f)*sin(f);
    //radius+=0.5;
  }
}

void drawSpiraleLogarithmic(float gradientAngle, float posX, int posY) {
  //MiddlePoint
  point(posX, posY);

  float lastX=calcLastX(gradientAngle, posX, 0);
  float lastY=calcLastY(gradientAngle, posY, 0);

  for (float f = 0; f<720; f+=0.01) {//f<360; f+=1  //f<720; f+=0.5
    line(lastX, lastY, calcLastX(gradientAngle, posX, f), calcLastY(gradientAngle, posY, f));
    lastX=calcLastX(gradientAngle, posX, f);
    lastY=calcLastY(gradientAngle, posY, f);
    //radius+=0.5;
  }
}

float calcLastX(float gradientAngle, float posX, float f) {
  //return posX+gradientAngle*pow(e, tan(gradientAngle)*f)*cos(f);
  return posX+gradientAngle*pow(e, 0.05*f)*cos(f);
}

float calcLastY(float gradientAngle, float posY, float f) {
  //return posY+gradientAngle*pow(e, tan(gradientAngle)*f)*sin(f);
  return posY+gradientAngle*pow(e, 0.05*f)*sin(f);
}

void mikeSolutionSpiralLogarithmic(float radius, float distance, float x, float y) {
  for (float i = 0; i <720; i+=distance*0.1) {
    point(x+radius*cos(i), y+radius*sin(i));
    radius = (.403*pow((float)Math.E, .15*i));
  }
}

void somethingSpecial(float radius, int posX, int posY) {
  //MiddlePoint
  point(posX, posY);
  //SomeThing
  float e = (float) Math.E;
  float lastX=posX+ radius*pow(e, tan(0))*cos(0);
  float lastY=posY+ radius*pow(e, tan(0))*sin(0);

  for (float f = 0; f<720*2; f+=0.25) {//f<360; f+=1  //f<720; f+=0.5
    line(lastX, lastY, posX+radius*pow(e, tan(radius))*cos(f), posY+ radius*pow(e, tan(radius))*sin(f));

    lastX=posX+radius*pow(e, tan(radius))*cos(f);
    lastY=posY+radius*pow(e, tan(radius))*sin(f);
    radius+=2;
  }
}



void drawSpiraleWithLine2(float radius, int posX, int posY) {
  //MiddlePoint
  point(posX, posY);
  //SomeThing
  float lastX=posX+cos(0)*radius;
  float lastY=posY+sin(0)*radius;
  for (float f = 0; f<720*2; f+=0.25) {//f<360; f+=1  //f<720; f+=0.5
    lastX=posX+cos(f)*radius;
    lastY=posY+sin(f)*radius;
    radius+=0.5;
    line(lastX, lastY, posX+cos(f)*radius, posY+sin(f)*radius);
  }
}


void drawSpiraleWithLine(float radius, int posX, int posY) {
  //MiddlePoint
  point(posX, posY);
  //SomeThing
  float lastX=posX+cos(0)*radius;
  float lastY=posY+sin(0)*radius;
  for (float f = 0; f<720*2; f+=0.25) {//f<360; f+=1  //f<720; f+=0.5
    line(lastX, lastY, posX+cos(f)*radius, posY+sin(f)*radius);
    lastX=posX+cos(f)*radius;
    lastY=posY+sin(f)*radius;
    radius+=0.5;
  }
}

void drawSpirale(float radius, int posX, int posY) {
  //MiddlePoint
  point(posX, posY);
  for (float f = 0; f<720*2; f+=0.25) {//f<360; f+=1  //f<720; f+=0.5
    point(posX+cos(f)*radius, posY+sin(f)*radius);
    radius-=0.1;
  }
}