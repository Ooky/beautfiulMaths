import java.util.Stack;

class Cell {
  private final int x;
  private final int y;
  private HashMap<String, Boolean> arrWalls = new HashMap<String, Boolean>();
  private boolean alreadyVisited = false;

  Cell(final int x, final int y) {
    this.x = x; 
    this.y = y;
    arrWalls.put("TOP", true);
    arrWalls.put("RIGHT", true);
    arrWalls.put("BOTTOM", true);
    arrWalls.put("LEFT", true);
  }

  private void drawGrid() {
    stroke(255); //lineColor
    int positionX = x*SQUARE_SIZE;
    int positionY = y*SQUARE_SIZE;     
    //--------------------------------------------------------------
    //TOP    - LEFT : (positionX            , positionY) 
    //TOP    - RIGHT: (positionX+SQUARE_SIZE, positionY)
    //BOTTOM - RIGHT: (positionX+SQUARE_SIZE, positionY+SQUARE_SIZE)
    //BOTTOM - LEFT : (positionX            , positionY+SQUARE_SIZE)
    //--------------------------------------------------------------
    //TOP      From: TopLeft to TopRight
    if (this.arrWalls.get("TOP")) {
      line(positionX, positionY, positionX+ SQUARE_SIZE, positionY);
    }
    //RIGHT    From: TopRight to BottomRight
    if (this.arrWalls.get("RIGHT")) {
      line(positionX+SQUARE_SIZE, positionY, positionX+SQUARE_SIZE, positionY+SQUARE_SIZE);
    }
    //BOTTOM   From: BottomRight to BottomLeft
    if (this.arrWalls.get("LEFT")) {
      line(positionX+SQUARE_SIZE, positionY+SQUARE_SIZE, positionX, positionY+SQUARE_SIZE);
    }
    //LEFT     From: BottomLeft to TopLeft
    if (this.arrWalls.get("BOTTOM")) {
      line(positionX, positionY+SQUARE_SIZE, positionX, positionY);
    }

    if (this.alreadyVisited) {
      fill(0, 255, 0, 100); 
      rect(positionX, positionY, SQUARE_SIZE, SQUARE_SIZE);
    }
  }

  public Cell checkNeighbours() {
    Cell[] neighbourCells = new Cell[4];
    int index = 0;
    //--------------------------------------------------------------
    //TOP    : (x  , y-1) 
    //RIGHT  : (x+1, y  )
    //BOTTOM : (x  , y+1)
    //LEFT   : (x-1, y  )
    //--------------------------------------------------------------
    Cell cellTop, cellRight, cellBottom, cellLeft;
    cellTop = cellRight = cellBottom = cellLeft = null;
    //check if neighbour Cell is in grid(index >= 0)
    if (calcAndReturnIndex(x, y-1) > -1) {
      cellTop     = arrCells[calcAndReturnIndex(x, y-1)];
    }
    if (calcAndReturnIndex(x+1, y  ) > -1) {
      cellRight   = arrCells[calcAndReturnIndex(x+1, y  )];
    }
    if (calcAndReturnIndex(x, y+1) > -1) {
      cellBottom  = arrCells[calcAndReturnIndex(x, y+1)];
    }
    if (calcAndReturnIndex(x-1, y  ) > -1) {
      cellLeft    = arrCells[calcAndReturnIndex(x-1, y  )];
    }

    //Important Order! Check FIRST !=null, otherwise nullpointerException!
    if (cellTop != null && !cellTop.alreadyVisited) {
      neighbourCells[index] = cellTop;
      index++;
    }
    if (cellRight != null && !cellRight.alreadyVisited) {
      neighbourCells[index] = cellRight;
      index++;
    }
    if (cellBottom != null && !cellBottom.alreadyVisited) {
      neighbourCells[index] = cellBottom;
      index++;
    }
    if (cellLeft != null && !cellLeft.alreadyVisited) {
      neighbourCells[index] = cellLeft;
      index++;
    }

    if (neighbourCells.length > 0) {
      int randomNumber = floor(random(0, neighbourCells.length));
      return neighbourCells[randomNumber];
    } else {
      //this should never happen
      return null; 
    }
  }

  public int calcAndReturnIndex(int x, int y) {
    //EdgeCases: TOP, RIGHT, BOTTOM, LEFT
    if ( y <0 || x > (columns-1) || y >(rows -1)|| x < 0  ) {
      return -1;
    }
    return (y+x*columns);
  }
  public boolean getVisited() {
    return this.alreadyVisited;
  }
  public void setVisited(boolean alreadyVisited) {
    this.alreadyVisited = alreadyVisited;
  }
}