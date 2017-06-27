//last step, finalize everything
//comment other things
//private and shit



//Variables
private final int SQUARE_SIZE = 40;
public int columns; 
public int rows;
public Cell[] arrCells;
private Cell current;
private final int startingCell = 0;



void setup() {
  size(600, 600); 
  initGrid();
  initCells();
  frameRate(5);
}


void draw() {
  background(0);
  drawGrid();
  current.setVisited(true);
  //STEP 1
  Cell nextCell = current.checkNeighbours();
  if (nextCell != null) {
    nextCell.alreadyVisited = true;

    //STEP 2


    //STEP 3
    removeWallsBetweenCells(current, nextCell);



    //STEP 4
    current = nextCell;
  }
}

void removeWallsBetweenCells(Cell current, Cell nextCell) {

  int differenceVertical = current.x - nextCell.x;
  println(differenceVertical);
  if (differenceVertical == 1) {
    current.arrWalls.put("LEFT", false);
    nextCell.arrWalls.put("RIGHT", false);
  } else if ( differenceVertical == -1) {
    current.arrWalls.put("RIGHT", false);
    nextCell.arrWalls.put("LEFT", false);
  }



  int differenceHorizontal = current.y - nextCell.y;
  if (differenceHorizontal == 1) {
    current.arrWalls.put("TOP", false);
    nextCell.arrWalls.put("BOTTOM", false);
  } else if ( differenceHorizontal == -1) {
    current.arrWalls.put("BOTTOM", false);
    nextCell.arrWalls.put("TOP", false);
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
      arrCells[y+x*columns] = new Cell(x, y); //every index
    }
  }
  current = arrCells[startingCell];
}

private void drawGrid() {
  for (int i = 0; i < arrCells.length; i++) {
    arrCells[i].drawGrid();
  }
}