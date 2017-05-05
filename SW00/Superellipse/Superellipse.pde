void setup() {
 size(800, 800);
 background(0);
 drawSuperEllipse(400,400, 400, 400, 4);
}


void drawSuperEllipse(int posX, int posY, int a, int b, float n) {
  //Color
  stroke(255,255,255);
  //MiddlePoint
  point(posX, posY);

  for(float f = 0 ; f<720*2; f+=0.25) {//f<360; f+=1  //f<720; f+=0.5
   point(posX+pow(cos(f), 2/n)*a,posY+pow(sin(f), 2/n)*b); 
   point(posX-pow(cos(f), 2/n)*a,posY-pow(sin(f), 2/n)*b); 
   point(posX+pow(cos(f), 2/n)*a,posY-pow(sin(f), 2/n)*b);
   point(posX-pow(cos(f), 2/n)*a,posY+pow(sin(f), 2/n)*b); 
  }  
}