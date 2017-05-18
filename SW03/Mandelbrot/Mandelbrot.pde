//    f(z) = z^2 +c
//    z0 = 0
//    z(n+1) = z(n)^2 +c
//    z(1)  = z(0)^2 +c   =>   z1 = c
//    z2    z(1)^1 +c    =>   z2= c^2 +c
//    c = a+ib 
//    changed code from:
//    https://github.com/CodingTrain/Rainbow-Code/blob/master/CodingChallenges/CC_21_Mandelbrot/CC_21_Mandelbrot.pde
//------------------------------------------------

// declare variables just once
int maxIterations;
//width/height
float w = 5;
float h = (w * height) / width;
// Start at negative half the width and height
float xmin = -w/2;
float ymin = -h/2;
// x goes from xmin to xmax
float xmax = xmin + w;
// y goes from ymin to ymax
float ymax = ymin + h;

void setup() {
  size(600, 600);
  colorMode(RGB, 1);
  //since it draws every pixel, we don't need to draw each time the background new
  background(255);
  maxIterations= 100;
}
void draw() {  
  //load Pixels to write in
  loadPixels();
  // Calculate amount we increment x,y for each pixel
  //this cant be above setup, due width/height wont be initialized...
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  // Start y
  float y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin;
    for (int i = 0; i < width; i++) {
      // Now we test, as we iterate z = z^2 + c does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxIterations) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        // Infinty in our finite world is simple, let's just consider it 16
        if (a*a + b*b > 16.0) {
          break;
        }
        n++;
      }
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxIterations) {
        pixels[i+j*width] = color(0);
      } else {
        pixels[i+j*width] = color(sqrt(float(n) / maxIterations));
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  //println(frameRate);
}