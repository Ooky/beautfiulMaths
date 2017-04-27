PVector[][] gradient;

int gridsize = 40;

int resolution = 40;



void setup(){

  size(400,400);

  background(255);

  gradient = new PVector [gridsize][resolution];

  for(int i =0; i< resolution; i++){

    for(int j = 0; j<gridsize;j++){

      gradient[i][j] =new PVector(random(1.0),random(1.0));

    }

  }



  for(float i = 0; i< 400; i++){

    for(float j = 0; j < 400; j++){

      

      float res = perlin(i/20,j/20);

      //res = 255 * res;

      stroke(res * 5);

      //println(res);

      point(j,i);

      //println(res);

    }

  };

  println("done");

}





float customLerp(float a0, float a1, float w){

  return ( 1.0 - w ) * a0 + w * a1;

}

 







float dotGridGradient(int ix, int iy, float x, float y){

  

    

  

   

  float dx = x + (float)ix;

  float dy = y + (float)iy;

  PVector v1 = gradient[iy][ix];

  PVector v2 = new PVector(dy,dx);

  return( PVector.dot(v1,v2));

}



float perlin(float x, float y){

  

  int x0 = floor(x);

  int x1 = x0 + 1;

  int y0 = floor(y);

  int y1 = y0 + 1;

  

  float sx = x - (float)x0;

  float sy = y - (float)y0;

  

  float n0; 

  n0 = dotGridGradient (x0, y0, x, y); 

  float n1;

  n1 = dotGridGradient (x1, y0, x, y); 

  float ix0;

  ix0 = lerp(n0, n1, sx);

  n0 = dotGridGradient (x0, y1, x, y); 

  n1 = dotGridGradient (x1, y1, x, y); 

  float ix1;

  ix1 = lerp(n0, n1, sx);

  return customLerp(ix0, ix1, sy);

  

}