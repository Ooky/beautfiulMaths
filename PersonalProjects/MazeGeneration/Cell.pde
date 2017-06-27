class Cell {
  private final int x;
  private final int y;
  //TOP-RIGHT-BOTTOM-LEFT
  private final boolean[] arrWalls = {true, true, true, true};

  Cell(final int x, final int y) {
    this.x = x; 
    this.y = y;
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
    if (this.arrWalls[0]) {
      line(positionX, positionY, positionX+ SQUARE_SIZE, positionY);
    }
    //RIGHT    From: TopRight to BottomRight
    if (this.arrWalls[1]) {
      line(positionX+SQUARE_SIZE, positionY, positionX+SQUARE_SIZE, positionY+SQUARE_SIZE);
    }
    //BOTTOM   From: BottomRight to BottomLeft
    if (this.arrWalls[2]) {
      line(positionX+SQUARE_SIZE, positionY+SQUARE_SIZE, positionX, positionY+SQUARE_SIZE);
    }
    //LEFT     From: BottomLeft to TopLeft
    if (this.arrWalls[3]) {
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