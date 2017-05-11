float p = 0.1f;
float r = 1f;
int arrSize = 200;
float startX;
float startY;
float stretchFactorX = 200;
float stretchFactorY = 200;
float maxNumberInArray;
float[] numbers = new float[arrSize];


void setup() {
  //Init default things
  size(800, 800);
  background(0);
  stroke(255);
  initializeHausdorffArray(p, r);
  //printHausdorffArrayValues();
  printLinesFromValues();
}


private void printLinesFromValues() {
  startX= 1*width/10;
  startY= height/2;
  for (float j = 1; j <=4; j+=0.01) {
    initializeHausdorffArray(p, j);
    for (int i = 100; i < numbers.length; i++) { //ignore first 100
      point(startX+(j)*stretchFactorX, startY+numbers[i-1]*stretchFactorY);
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