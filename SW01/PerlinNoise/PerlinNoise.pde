//init array for random values
float[][] randomValues;

void setup() {
  size(800, 800);
  randomValues = new float[width][height];
  fillNoiseArrayWithRandomValues(width, height);
  float[][] colorValue = GenerateSmoothNoise(randomValues, 10);
  for (int y = 0; y < width; y++) {
    for (int x = 0; x <height; x++) {
      stroke(colorValue[x][y]);
      point(x, y);
    }
  }
}
public float[][] GenerateSmoothNoise(float[][] baseNoise, int octave) {

  float[][] smoothNoise = new float[width][height];

  int samplePeriod = 50; // calculates 2 ^ k ==>  2^octave
  float sampleFrequency = (1.0f / samplePeriod);

  for (int i = 0; i < width; i++) {
    //calculate the horizontal sampling indices
    int sample_i0 = (i / samplePeriod) * samplePeriod;
    int sample_i1 = (sample_i0 + samplePeriod) % width; //wrap around
    float horizontal_blend = (i - sample_i0) * sampleFrequency;

    for (int j = 0; j < height; j++) {
      //calculate the vertical sampling indices
      int sample_j0 = (j / samplePeriod) * samplePeriod;
      int sample_j1 = (sample_j0 + samplePeriod) % height; //wrap around
      float vertical_blend = (j - sample_j0) * sampleFrequency;

      //blend the top two corners
      float top = Interpolate(baseNoise[sample_i0][sample_j0], 
        baseNoise[sample_i1][sample_j0], horizontal_blend);

      //blend the bottom two corners
      float bottom = Interpolate(baseNoise[sample_i0][sample_j1], 
        baseNoise[sample_i1][sample_j1], horizontal_blend);

      //final blend
      smoothNoise[i][j] = Interpolate(top, bottom, vertical_blend);
    }
  }

  return smoothNoise;
}
public float Interpolate(float x0, float x1, float alpha) {
  return x0 * (1 - alpha) + alpha * x1;
}
public float[][] GeneratePerlinNoise(float[][] baseNoise, int octaveCount) {
  int width = baseNoise.length;
  int height = baseNoise[0].length;

  float[][][] smoothNoise = new float[octaveCount][][]; //an array of 2D arrays containing

  float persistance = 0.5f;

  //generate smooth noise
  for (int i = 0; i < octaveCount; i++) {
    smoothNoise[i] = GenerateSmoothNoise(baseNoise, i);
  }

  float[][] perlinNoise = new float[width][height];
  float amplitude = 1.0f;
  float totalAmplitude = 0.0f;

  //blend noise together
  for (int octave = octaveCount - 1; octave >= 0; octave--) {
    amplitude *= persistance;
    totalAmplitude += amplitude;

    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        perlinNoise[i][j] += smoothNoise[octave][i][j] * amplitude;
      }
    }
  }

  //normalisation
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      perlinNoise[i][j] /= totalAmplitude;
    }
  }

  return perlinNoise;
}

public float[][] fillNoiseArrayWithRandomValues(int width, int height) {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      randomValues[i][j] = random(255);
    }
  }
  return randomValues;
}
void draw() {
}