public class Cell {
  private final int x; 
  private final int y;
  private final boolean[] walls = new boolean[4];
  private boolean visited = false;

  //Constructor exactly like this
  public Cell(int x, int y) {
    this.x = x; 
    this.y = y;
    walls[0] = true;
    walls[1] = true; 
    walls[2] = true;
    walls[3] = true;
  }
  public void drawGrid() {
    stroke(colorWalls);
    int positionX = this.x*squareSize;
    int positionY = this.y*squareSize;
    //----------------------Corners----------------------------------
    //TOP    - LEFT : ( positionX            , positionY            ) 
    //TOP    - RIGHT: ( positionX+squareSize , positionY            )
    //BOTTOM - RIGHT: ( positionX+squareSize , positionY+squareSize )
    //BOTTOM - LEFT : ( positionX            , positionY+squareSize )
    //---------------------------------------------------------------

    //TOP      From: TopLeft to TopRight
    if (this.walls[0]) {
      line(positionX, positionY, positionX + squareSize, positionY);
    }
    //RIGHT    From: TopRight to BottomRight
    if (this.walls[1]) {
      //right wall fix
      if ((this.x+1) % (columns) != 0) {
        line(positionX + squareSize, positionY, positionX + squareSize, positionY + squareSize);
      } else {
        line(positionX + squareSize-1, positionY, positionX + squareSize-1, positionY + squareSize);
      }
    }
    //BOTTOM   From: BottomRight to BottomLeft
    if (this.walls[2]) {
      //bottom wall fix
      if ((this.y+1) % (rows) != 0) {
        line(positionX + squareSize, positionY + squareSize, positionX, positionY + squareSize);
      } else {
        line(positionX + squareSize, positionY + squareSize-1, positionX, positionY + squareSize-1);
      }
    }
    //LEFT     From: BottomLeft to TopLeft
    if (this.walls[3]) {
      line(positionX, positionY + squareSize, positionX, positionY);
    }
    if (this.visited) {
      noStroke();
      fill(colorVisited);
      rect(positionX, positionY, squareSize, squareSize);
    }
  }//public void drawGrid() {

  public void highlight () {
    int positionX = this.x*squareSize;
    int positionY = this.y*squareSize;
    noStroke();
    fill(colorHighlight);
    rect(positionX, positionY, squareSize, squareSize);
  }//public void highlight () {

  public Cell getRandomNextNeighbourCell() {
    ArrayList<Cell> neighbourCells = new ArrayList<Cell>();
    Cell top, right, bottom, left;
    top = right = bottom = left = null;
    //--------------------------------------------------------------
    //TOP    : (x  , y-1) 
    //RIGHT  : (x+1, y  )
    //BOTTOM : (x  , y+1)
    //LEFT   : (x-1, y  )
    //--------------------------------------------------------------
    //Define top right bottom left
    if (getIndex(x, y-1) > -1) {
      top = cells.get(getIndex(x, y-1));
    }
    if (getIndex(x+1, y) > -1) {
      right = cells.get(getIndex(x+1, y));
    }
    if (getIndex(x, y+1) > -1) {
      bottom = cells.get(getIndex(x, y+1));
    }
    if (getIndex(x-1, y) > -1) {
      left = cells.get(getIndex(x-1, y));
    }

    //Add to neighbourCells
    if (top != null && !top.visited) {
      neighbourCells.add(top);
    }
    if (right != null &&  !right.visited) {
      neighbourCells.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbourCells.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbourCells.add(left);
    }

    if (neighbourCells.size() > 0) {
      int randomCell = floor(random(0, neighbourCells.size()));
      return neighbourCells.get(randomCell);
    } else {
      return null;
    }
  }//public Cell getRandomNextNeighbourCell() {

  private int getIndex(int x, int y) {
    //Edgecases: TOP, RIGHT, BOTTOM, LEFT
    if ( y < 0 || x > (columns-1) || y > (rows -1)|| x < 0  ) {
      return -1;
    }
    return x + y * columns;
  }//private int getIndex(int x, int y) {
}