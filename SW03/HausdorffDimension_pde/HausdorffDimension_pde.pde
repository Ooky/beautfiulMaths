import peasy.*;


float p = 0.1f;
float r = 1f;
int arrSize = 200;
float startX;
float startY;
float stretchFactorX = 400;
float stretchFactorY = 400;
float maxNumberInArray;
float[] numbers = new float[arrSize];
PeasyCam cam;


void setup() {
  //Init default things
  size(800, 800, P3D);
  cam = new PeasyCam(this, -200);
  background(0);
  stroke(255);
  strokeWeight(2);
  startX= -600;
  //startX= width/10;
  startY= height/4;
  //initializeHausdorffArray(p, r);
  //printHausdorffArrayValues();
  
}

void draw()  {
  background(0);
  printLinesFromValues();
}

private void printLinesFromValues() {
  for (float r = 1; r <=4; r+=0.01) {
    initializeHausdorffArray(p, r);
    for (int i = 100; i < numbers.length; i++) { //ignore first 100
      point(startX+(r)*stretchFactorX, startY+numbers[i-1]*stretchFactorY);
    }
  }
}

private void initializeHausdorffArray(float p, float r) {
  this.p = p;
  this.r = r;
  //First Value
  numbers[0] = p+(r*p)*(1-p);
  //p(n) = p(n+1)*p(n)*r*(1-p(n))
  for (int i = 1; i <= numbers.length-1; i++) {
    numbers[i] =  numbers[i-1]+(r*numbers[i-1])*(1-numbers[i-1]);
    //println("i"+i);
    //println("r:"+r);
  }
}

private void printHausdorffArrayValues() {
  for (float values : numbers) {
    println(values);
  }
}