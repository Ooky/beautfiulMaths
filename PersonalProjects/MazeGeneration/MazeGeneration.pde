//last step, finalize everything
//comment other things
//private and shit
//in cell:
//  instead of an booleanArray with top-right-bottom-left, use a map with <String, boolean>
//  better to read!


//Variables
private final static int SQUARE_SIZE = 40;
private int columns; 
private int rows;
private Cell[] arrCells;

void setup() {
  size(800, 800); 
  background(0);
  initGrid();
  initCells();
  drawGrid();
}


void draw() {
}


private void initGrid() {
  //floor(..) for not integers
  columns = floor(width/SQUARE_SIZE);
  rows = floor(height/SQUARE_SIZE);
  //init arrCells
  arrCells = new Cell[columns * rows];
}
private void initCells() {
  //Create every Cell
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < columns; y++) {
      Cell cell = new Cell(x, y);
      arrCells[y+x*columns] = cell; //every index
    }
  }
}

private void drawGrid() {
  for (int i = 0; i <arrCells.length; i++) {
    arrCells[i].drawGrid();
  }
}