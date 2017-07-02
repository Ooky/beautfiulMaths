/* 
 * Jony Margelist, 01.07.2017
 * Maze Generator
 * Recursive backtracker with depth-first-search algorithm
 * https://en.wikipedia.org/wiki/Maze_generation_algorithm
 */

import java.util.Stack;

//Variables
private final int squareSize=40;
private int rows;
private int columns;
private int startingCellIndex;
private Cell currentCell;
private ArrayList<Cell> cells = new ArrayList<Cell>();
private Stack<Cell> stack = new Stack<Cell>();
//Colors
public final color colorHighlight = color(0, 255, 0, 255);
public final color colorWalls = color(255);
public final color colorVisited = color(0, 255, 0, 100);


void setup() {
  size(600, 400);
  initGridAndCells();
  setStartingCell();
  //frameRate(1);
}//void setup() {


void draw() {
  background(0);
  drawStartingCell();
  drawGrid();
  currentCell.highlight();
  currentCell.visited = true;

  // STEP 1
  Cell nextCell = currentCell.getRandomNextNeighbourCell();
  if (nextCell != null) {

    // STEP 2
    stack.push(currentCell);

    // STEP 3
    removeWallsBetweenCells(currentCell, nextCell);

    // STEP 4
    currentCell = nextCell;
    nextCell.visited = true;
  } else if (!stack.empty()) {
    currentCell = stack.pop();
  }
}//void draw() {

private void initGridAndCells() {
  //Grid
  rows = floor(height/squareSize);
  columns = floor(width/squareSize);
  //Cells
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < columns; x++) {
      Cell cell = new Cell(x, y);
      cells.add(cell);
    }
  }
}//private void initGridAndCells() {

private void setStartingCell() {
  //Random start position
  startingCellIndex = floor(random(0, columns*rows-1));
  currentCell = cells.get(startingCellIndex);
}//private void setStartingCell() {

private void drawStartingCell() {
  int positionX = cells.get(startingCellIndex).x*squareSize;
  int positionY = cells.get(startingCellIndex).y*squareSize;
  fill(colorVisited);
  rect(positionX, positionY, squareSize, squareSize);
}//private void drawStartingCell() {

private void drawGrid() {
  for (int i = 0; i < cells.size(); i++) {
    cells.get(i).drawGrid();
  }
}//private void drawGrid() {

private void removeWallsBetweenCells(Cell currentCell, Cell nextCell) {
  int differenceVertical = currentCell.x - nextCell.x;
  if (differenceVertical == 1) {
    currentCell.wallMap.put("LEFT", false);
    nextCell.wallMap.put("RIGHT", false);
  } else if (differenceVertical == -1) {
    currentCell.wallMap.put("RIGHT", false);
    nextCell.wallMap.put("LEFT", false);
  }
  int differenceHorizontal = currentCell.y - nextCell.y;
  if (differenceHorizontal == 1) {
    currentCell.wallMap.put("TOP", false);
    nextCell.wallMap.put("BOTTOM", false);
  } else if (differenceHorizontal == -1) {
    currentCell.wallMap.put("BOTTOM", false);
    nextCell.wallMap.put("TOP", false);
  }
}//private void removeWallsBetweenCells(Cell currentCell, Cell nextCell) {