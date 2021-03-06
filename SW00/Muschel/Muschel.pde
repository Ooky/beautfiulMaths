float e = (float) Math.E;
boolean booleanDrawShellWithFormulaTry5Animated = false;
void setup() {
  background(0);
  size(800, 800, P3D);
  frame.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
  stroke(255);
  //drawShellWithFormulaTry1(400, 400, 400 );
  //drawShellWithFormulaTry2(100,10);
  //drawShellWithFormulaTry3(400,400);
  //drawShellWithFormulaTry4(400, 400);
  //drawShellWithFormulaTry5();
  //booleanDrawShellWithFormulaTry5Animated=true;
  drawShellWithFormulaTry6();
  //drawSpirale(5, 400, 400);
  //goldenRatio(400, 400);
  //somethingOther(400,400);
}
void drawShellWithFormulaTry6() {
  //https://en.wikipedia.org/wiki/Seashell_surface
  float x=0; 
  float y=0;
  float z=0;
  translate(400, 800);//VERSCHIEBEN
  rotateX(PI/2);
  //rotateY(PI/2);
  float[] vertexArr=new float[99225*3];
  int arrayCounter = 0;
  int arrayLoopCounter = 0;
  //println(vertexArr.length);
  //println(10*PI*10*10*PI*10*3);
  for (float u = 0; u<10*PI; u+=0.1) {
    for (float v = 0; v <10*PI; v+=0.1) {
      //point(x, y, z);
      vertexArr[arrayCounter] = x;
      arrayCounter++;
      vertexArr[arrayCounter] = y;
      arrayCounter++;
      vertexArr[arrayCounter] = z;
      arrayCounter++;
      x=((5/4)*(1-(v/2*PI))*cos(2*v)*(1+cos(u))+cos(2*v));
      y=((5/4)*(1-(v/2*PI))*sin(2*v)*(1+cos(u))+sin(2*v));
      z=((10*v/2*PI)+(5/4)*(1-(v/2*PI))*sin(u)+15);
      arrayLoopCounter++;
    }
  }
  println(arrayLoopCounter);
  beginShape(POINTS);//TRIANGLE_STRIP  //TRIANGLE_FAN   //QUADS  //POINTS  //LINES //TRIANGLES  //QUAD_STRIP
  for (int i = 0; i < vertexArr.length; i+=3) {
    //stroke(255-i);
    vertex(vertexArr[i], vertexArr[i+1], vertexArr[i+2]);
  }
  endShape();
}


void drawShellWithFormulaTry5() {
  //https://en.wikipedia.org/wiki/Seashell_surface
  float x=0; 
  float y=0;
  float z=0;
  translate(400, 800);//VERSCHIEBEN
  rotateX(PI/2);
  //rotateY(PI/2);
  for (float u = 0; u<10*PI; u+=0.1) {
    for (float v = 0; v <10*PI; v+=0.1) {
      point(x, y, z);
      x=((5/4)*(1-(v/2*PI))*cos(2*v)*(1+cos(u))+cos(2*v));
      y=((5/4)*(1-(v/2*PI))*sin(2*v)*(1+cos(u))+sin(2*v));
      z=((10*v/2*PI)+(5/4)*(1-(v/2*PI))*sin(u)+15);
    }
  }
}

void drawShellWithFormulaTry4(int startX, int startY) {
  //https://en.wikipedia.org/wiki/Helix 
  float x=0; 
  float y=0;
  float z=0;
  translate(10, -20);

  for (float f = 0; f<10000; f+=0.1) {
    point(x, y, z);
    x=cos(f)*7+startX;
    y=sin(f)*8+startY;
    z=f+1;
  }
}

void somethingOther(int startX, int startY) {
  //https://en.wikipedia.org/wiki/Helix 
  float x=0; 
  float y=0;
  float z=0;
  translate(10, -20);

  for (float f = 0; f<10000; f+=0.1) {
    point(x, y, z);
    x=cos(f)*f+startX;
    y=sin(f)*f+startY;
    z=f+1;
  }
}

void drawShellWithFormulaTry3(int startX, int startY) {
  //https://en.wikipedia.org/wiki/Helix 
  float x=0; 
  float y=0;
  float z=0;
  translate(10, -20);

  for (float f = 0; f<10000; f+=0.1) {
    point(x, y, z);
    x=cos(f)*3+startX;
    y=sin(f)*3+startY;
    z=f+1;
  }
}

void drawShellWithFormulaTry2(float a, float c) {
  //http://symmetry-us.com/Journals/lucca/index.html#fig4
  float s = 20;
  float p;
  float x;
  float y;
  float z;

  for (float f = 0; f<100; f+=0.1) {
    p = 1/(sqrt(pow(cos(s), 2))/(pow(a, 2))+(pow(sin(s), 2))/(pow(c, 2)));
    x=p*cos(20);
    y=1;
    z=p*sin(20);
    println("x:"+x+ " y:"+y+" z:"+z);
    point(x, y, z);
  }
}


void drawShellWithFormulaTry1(float omega, float r, float z) {
  float omegaStart = omega;
  float rStart = r;
  float zStart = z;

  float OmegaTemp;
  float rTemp;
  float zTemp;
  for (float f = 0; f<100; f+=0.1) {
    //for (int j = 0; j<100; j++) {
    point(omega, r, z);
    OmegaTemp = omega;
    rTemp = r;
    zTemp = z;
    omega = OmegaTemp+(omega-OmegaTemp);
    r=rTemp*f*r;
    z=zTemp *f*z;
    //}
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


float xDraw=0; 
float yDraw=0;
float zDraw=0;
float uDraw = 0;
public void drawShellWithFormulaTry5Animated() {
  translate(400, 800);//VERSCHIEBEN
  rotateX(PI/2);
  if (uDraw>=10*PI)
  {
    uDraw = 0;
  }
  for (float vDraw = 0; vDraw <10*PI; vDraw+=0.1) {
    point(xDraw, yDraw, zDraw);
    xDraw=((5/4)*(1-(vDraw/2*PI))*cos(2*vDraw)*(1+cos(uDraw))+cos(2*vDraw));
    yDraw=((5/4)*(1-(vDraw/2*PI))*sin(2*vDraw)*(1+cos(uDraw))+sin(2*vDraw));
    zDraw=((10*vDraw/2*PI)+(5/4)*(1-(vDraw/2*PI))*sin(uDraw)+15);
  }
  uDraw+=0.1;
}


void draw() {
  if (booleanDrawShellWithFormulaTry5Animated) {
    drawShellWithFormulaTry5Animated();
  }
}