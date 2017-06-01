int squareSize = 4;
int[] arrActualState;
int[] arrOld;
int gridPosition =0;

int[] arrRuleset={0, 1, 0, 1, 1, 0, 1, 0};
int counter=0;

void setup() {
  size(600, 600);
  background(255);
  arrActualState = new int[width/squareSize];
  arrOld = new int[width/squareSize];
  setupFirstArray();
  arrayCopy(arrActualState, arrOld);
}



void draw() {
  rect(20, 20, 20,20);
  drawRectangle();
}


void drawRectangle() {
  if (counter <= height) {
    counter++;
    drawSquares(counter);
    arrayCopy(arrActualState, arrOld);
  }
}

void defineNextGeneration() {
  for (int i = 0; i < arrOld.length; i++) {
    if (i==0) { //is i is at start of array
      if (arrOld[arrOld.length-1] == 0 && arrOld[i] == 0 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[0];
      } else if (arrOld[arrOld.length-1] == 0 && arrOld[i] == 0 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[1];
      } else if (arrOld[arrOld.length-1] == 0 && arrOld[i] == 1 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[2];
      } else if (arrOld[arrOld.length-1] == 0 && arrOld[i] == 1 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[3];
      } else if (arrOld[arrOld.length-1] == 1 && arrOld[i] == 0 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[4];
      } else if (arrOld[arrOld.length-1] == 1 && arrOld[i] == 0 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[5];
      } else if (arrOld[arrOld.length-1] == 1 && arrOld[i] == 1 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[6];
      } else if (arrOld[arrOld.length-1] == 1 && arrOld[i] == 1 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[7];
      }
    } else if (i==arrOld.length-1) { //if i is at end of array
      if (arrOld[i-1] == 0 && arrOld[i] == 0 && arrOld[0] == 0) {
        arrActualState[i] = arrRuleset[0];
      } else if (arrOld[i-1] == 0 && arrOld[i] == 0 && arrOld[0] == 1) {
        arrActualState[i] = arrRuleset[1];
      } else if (arrOld[i-1] == 0 && arrOld[i] == 1 && arrOld[0] == 0) {
        arrActualState[i] = arrRuleset[2];
      } else if (arrOld[i-1] == 0 && arrOld[i] == 1 && arrOld[0] == 1) {
        arrActualState[i] = arrRuleset[3];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 0 && arrOld[0] == 0) {
        arrActualState[i] = arrRuleset[4];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 0 && arrOld[0] == 1) {
        arrActualState[i] = arrRuleset[5];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 1 && arrOld[0] == 0) {
        arrActualState[i] = arrRuleset[6];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 1 && arrOld[0] == 1) {
        arrActualState[i] = arrRuleset[7];
      }
    } else {//if i is in middle of array
      if (arrOld[i-1] == 0 && arrOld[i] == 0 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[0];
      } else if (arrOld[i-1] == 0 && arrOld[i] == 0 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[1];
      } else if (arrOld[i-1] == 0 && arrOld[i] == 1 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[2];
      } else if (arrOld[i-1] == 0 && arrOld[i] == 1 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[3];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 0 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[4];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 0 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[5];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 1 && arrOld[i+1] == 0) {
        arrActualState[i] = arrRuleset[6];
      } else if (arrOld[i-1] == 1 && arrOld[i] == 1 && arrOld[i+1] == 1) {
        arrActualState[i] = arrRuleset[7];
      }
    }
  }
}


void drawSquares(int counter) {
  for (int i = 0; i < arrActualState.length; i++) {
    if (arrActualState[i] == 1) {
      fill(255);
    } else {
      fill(0);
    }
    rect(i*squareSize, counter, squareSize, squareSize);
    defineNextGeneration();
  }
}


void setupFirstArray() {
  //init everything with zeros
  for (int i  =0; i <arrActualState.length; i++) {
    arrActualState[i] = 0;
  }
  //init the middle cell with a 1.
  arrActualState[arrActualState.length/2] =1;
}