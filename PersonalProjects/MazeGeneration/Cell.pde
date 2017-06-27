class Cell {
  private final int x;
  private final int y;
  //TOP-RIGHT-BOTTOM-LEFT
  //private boolean[] arrWalls = {true, true, true, true};
  private HashMap<String, Boolean> arrWalls = new HashMap<String, Boolean>();

  Cell(final int x, final int y) {
    this.x = x; 
    this.y = y;
    arrWalls.put("TOP", true);
    arrWalls.put("RIGHT", true);
    arrWalls.put("BOTTOM", true);
    arrWalls.put("LEFT", true);
  }

  private void drawGrid() {
    /*
    stroke(255);
     noFill();
     int positionX = x*SQUARE_SIZE;
     int positionY = y*SQUARE_SIZE;
     rect(positionX, positionY, SQUARE_SIZE, SQUARE_SIZE); 
     */

    stroke(255);
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
  }

  //Needed? wouldnt be getINdex be better?
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}