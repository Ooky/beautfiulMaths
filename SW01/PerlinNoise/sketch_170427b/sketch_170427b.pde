public final int[] permutation = { 151, 160, 137, 91, 90, 15, // Hash lookup table as defined by Ken Perlin.  This is a randomly
  131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, // arranged array of all numbers from 0-255 inclusive.
  190, 6, 148, 247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33, 
  88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74, 165, 71, 134, 139, 48, 27, 166, 
  77, 146, 158, 231, 83, 111, 229, 122, 60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 
  102, 143, 54, 65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196, 
  135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250, 124, 123, 
  5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 
  223, 183, 170, 213, 119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 
  129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228, 
  251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81, 51, 145, 235, 249, 14, 239, 107, 
  49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 
  138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180
};

public int[] p;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  perlin(2134, 13.5, 800);
  perlin();
}



void perlin() {
  p = new int[512];
  for (int x=0; x<512; x++) {
    p[x] = permutation[x%256];
  }
}


public float perlin(float pointX, float pointY, int dimension) {  
  float myPointX = pointX%dimension;
  float myPointY = pointY%dimension;
  PVector myPoint = new PVector(myPointX, myPointY);
  int x0=0;
  int x1=dimension;
  int y0=0;
  int y1=dimension;

  /*  
   int aaa, aba, aab, abb, baa, bba, bab, bbb;
   aaa = p[p[p[    xi ]+    yi ]+    zi ];
   aba = p[p[p[    xi ]+inc(yi)]+    zi ];
   aab = p[p[p[    xi ]+    yi ]+inc(zi)];
   abb = p[p[p[    xi ]+inc(yi)]+inc(zi)];
   baa = p[p[p[inc(xi)]+    yi ]+    zi ];
   bba = p[p[p[inc(xi)]+inc(yi)]+    zi ];
   bab = p[p[p[inc(xi)]+    yi ]+inc(zi)];
   bbb = p[p[p[inc(xi)]+inc(yi)]+inc(zi)];
   */

  PVector gradientVectorBottomLeft, gradientVectorBottomRight, 
    gradientVectorTopRight, gradientVectorTopLeft;

  gradientVectorBottomLeft = new PVector(randomGradientVector(dimension), randomGradientVector(dimension));
  gradientVectorBottomRight = new PVector(randomGradientVector(dimension), randomGradientVector(dimension));
  gradientVectorTopRight = new PVector(randomGradientVector(dimension), randomGradientVector(dimension));
  gradientVectorTopLeft = new PVector(randomGradientVector(dimension), randomGradientVector(dimension));

  PVector distanceVectorBottomLeft, distanceVectorBottomRight, 
    distanceVectorTopRight, distanceVectorTopLeft;

  distanceVectorBottomLeft= myPoint.sub(x0, y0);
  distanceVectorBottomRight= myPoint.sub(x1, y0);
  distanceVectorTopRight= myPoint.sub(x1, y1);
  distanceVectorTopLeft= myPoint.sub(x0, y1);

  float influenceValueBottomLeft = gradientVectorBottomLeft.x * distanceVectorBottomLeft.x+
    gradientVectorBottomLeft.y * distanceVectorBottomLeft.y;
  float influenceValueBottomRight= gradientVectorBottomRight.x * distanceVectorBottomRight.x+
    gradientVectorBottomRight.y * distanceVectorBottomRight.y;
  float influenceValueTopRight=    gradientVectorTopRight.x * distanceVectorTopRight.x+
    gradientVectorTopRight.y * distanceVectorTopRight.y;
  float influenceValueTopLeft=     gradientVectorTopLeft.x * distanceVectorTopLeft.x+
    gradientVectorTopLeft.y * distanceVectorTopLeft.y;

  // Below are 4 influence values in the arrangement:
  // [g1] | [g2]
  // -----------
  // [g3] | [g4]
  float g1, g2, g3, g4;
  g1=g2=g3=g4=0;
  // These coordinates are the location of the input coordinate in its unit square.  
  // For example a value of (0.5,0.5) is in the exact center of its unit square.

  float x1Lerp = myLerp(g1, g2, myPointX);
  float x2Lerp = myLerp(g3, g4, myPointX);


  float average = lerp(x1Lerp, x2Lerp, myPointY);
  stroke(255-average);
  point(myPointX, myPointY);



  return influenceValueBottomLeft;
}

public float myLerp(float a, float b, float x) {
  return a+x*(b-a);
}


public float fade(float t) {
  // Fade function as defined by Ken Perlin.  This eases coordinate values
  // so that they will ease towards integral values.  This ends up smoothing
  // the final output.
  return t * t * t * (t * (t * 6 - 15) + 10);         // 6t^5 - 15t^4 + 10t^3
}


public int randomGradientVector(int dimension) {
  return round(random(-1*(dimension), dimension));
}


void draw() {
}