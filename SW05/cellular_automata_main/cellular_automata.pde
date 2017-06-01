class CA {
  int[] cells;     // An array of 0s and 1s 
  int generation;  // How many generations?
  //int[] ruleset = {0, 0, 0, 1, 1, 1, 1, 0}; //Rule 30
  //int[] ruleset = {0, 1, 1, 1, 1, 1, 1, 0}; //Rule 126
  int[] ruleset = {0, 0, 1, 1, 0, 1, 1, 0}; //Rule 54
  //int[] ruleset = {1, 0, 0, 1, 0, 1, 1, 0}; //Rule 150
  //int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0}; //Rule 90

  //int[] ruleset = {1, 0, 0, 1, 0, 1, 1, 1}; //Rule random nice thing 1
  //int[] ruleset = {1, 0, 1, 1, 0, 1, 0, 1};

  int w = 1; //change this for less(higher value) points

  CA() {
    cells = new int[width/w]; //how many points
    //set all cells initially to 0
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;    //the middle cell starts with 1
    generation = 0;
  }

  //new line
  void generate() {
    // new empty array
    int[] nextgen = new int[cells.length];
    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];   // Left neighbor state
      int me = cells[i];       // Current state
      int right = cells[i+1];  // Right neighbor state
      nextgen[i] = rules(left, me, right); // Compute next generation state based on ruleset
    }
    // The current generation is the new generation
    cells = nextgen;
    generation++;
  }

  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) { 
        fill(0);
      } else {            
        fill(255);
      }
      noStroke();
      rect(i*w, generation*w, w, w);
    }
  }



  // Implementing the Wolfram rules
  // Could be improved and made more concise, but here we can explicitly see what is going on for each case
  int rules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return ruleset[0];
    if (a == 1 && b == 1 && c == 0) return ruleset[1];
    if (a == 1 && b == 0 && c == 1) return ruleset[2];
    if (a == 1 && b == 0 && c == 0) return ruleset[3];
    if (a == 0 && b == 1 && c == 1) return ruleset[4];
    if (a == 0 && b == 1 && c == 0) return ruleset[5];
    if (a == 0 && b == 0 && c == 1) return ruleset[6];
    if (a == 0 && b == 0 && c == 0) return ruleset[7];
    return 0;
  }
}