float p;
float r;
float startX;
float startY;
float stretchFactorX = 6;
float stretchFactorY = 20;
float[] numbers = new float[100];


void setup() {
  //Init default things
  size(800, 800);
  background(0);
  stroke(255);
  initializeHausdorffArray(0.01f, 3f);
  printHausdorffArrayValues();
  printLinesFromValues();
}


private void printLinesFromValues() {
  startX= 1*width/10;
  startY= height/2;
  for (int i = 1; i < numbers.length-1; i++) {
    line((i-1)*stretchFactorX+startX, numbers[i-1]*stretchFactorY+startY, i*stretchFactorX+startX, numbers[i]*stretchFactorY+startY);
  }
}


private void printHausdorffArrayValues() {
  for (float values : numbers) {
    println(values);
  }
}

void initializeHausdorffArray(float p, float r) {
  this.p = p;
  this.r = r;
  //First Value
  numbers[0] = p+(r*p)*(1-p);
  for (int i = 1; i <= numbers.length-1; i++) {
    numbers[i] =  numbers[i-1]+(r*numbers[i-1])*(1-numbers[i-1]);
  }
}