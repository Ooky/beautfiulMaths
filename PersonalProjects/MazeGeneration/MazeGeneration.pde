//last step, finalize everything
//comment other things
//private and shit
//in cell:
//  instead of an booleanArray with top-right-bottom-left, use a map with <String, boolean>
//  better to read!


//Variables
private final static int SQUARE_SIZE = 40;
public int columns; 
public int rows;
public Cell[] arrCells;
private Cell current;
private final int startingCell = 0;

void setup() {
  size(800, 800); 
  initGrid();
  initCells();
  frameRate(5);
}


void draw() {
  background(0);
  drawGrid();
  current.setVisited(true);
  Cell nextCell = current.checkNeighbours();
  if(nextCell != null) {
    nextCell.alreadyVisited = true;
    current = nextCell;
  }
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
  current = arrCells[startingCell];
}

private void drawGrid() {
  for (int i = 0; i <arrCells.length; i++) {
    arrCells[i].drawGrid();
  }
}