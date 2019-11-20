PFont font;

int Xsize = 30;
int Ysize = 16;

int numGrid[][] = new int[Xsize][Ysize];
boolean mineGrid[][] = new boolean[Xsize][Ysize];
int showGrid[][] = new int[Xsize][Ysize];

float diff = 256.0 / 50.0;
final int numMineFinal = int((float(Xsize * Ysize) / diff + 0.1));

float scale;

boolean play = true;
boolean win = false;

float w;
float h;

float bordX = 0;
float bordY = 100;

final int maxFlag = int(numMineFinal);
int flags = 0;

int timeCor = millis();
int time = millis();

boolean test = false;

boolean firstClick = false;

float widt;
float heigh;

void setup() {
  size(800, 900);
  surface.setResizable(true);
  noStroke();
  
  w = width;
  
  bordY = height - w;

  h = height - bordY;
  
  widt = width;
  heigh = height;
  
  rectMode(CENTER);
  
  scale = int(w / Xsize);
  font = createFont("NotoMono-Regular.ttf", (scale / 4) * 3);
  textAlign(CENTER, CENTER);
  textFont(font);
}

void dispose() {
  
}

void newGrid(int X, int Y) {
  flags = 0;
  float numMine = numMineFinal;
  numGrid = new int[Xsize][Ysize];
  mineGrid = new boolean[Xsize][Ysize];
  showGrid = new int[Xsize][Ysize];
  
  do{
    for (int a = 0; a < Xsize; a++)
    {
      for (int b = 0; b < Ysize; b++)
      {
        showGrid[a][b] = 0;
        
        if (a != X & b != Y)
        {
          if (!mineGrid[a][b])
          {
            if (numMine > 0 & int(random(0, 1000)) == 1)
            {
              mineGrid[a][b] = true;
              numMine--;
            }
            else
            {
              mineGrid[a][b] = false;
            }
          }
        }
      }
    }
  }while(numMine > 0);
  
  for (int a = 0; a < Xsize; a++)
  {
    for (int b = 0; b < Ysize; b++)
    {
      int mines = 0;
      
      if (!mineGrid[a][b])
      {
        if (a > 0)
        {
          if (mineGrid[a - 1][b])
          {
            mines++;
          }
          
          if (b > 0)
          {
            if (mineGrid[a - 1][b - 1])
            {
              mines++;
            }
          }
          
          if (b < Ysize - 1)
          {
            if (mineGrid[a - 1][b + 1])
            {
              mines++;
            }
          }
        }
        
        if (a < Xsize - 1)
        {
          if (mineGrid[a + 1][b])
          {
            mines++;
          }
          
          if (b > 0)
          {
            if (mineGrid[a + 1][b - 1])
            {
              mines++;
            }
          }
          
          if (b < Ysize - 1)
          {
            if (mineGrid[a + 1][b + 1])
            {
              mines++;
            }
          }
        }
        
        if (b > 0)
        {
          if (mineGrid[a][b - 1])
          {
            mines++;
          }
        }
        
        if (b < Ysize - 1)
        {
          if (mineGrid[a][b + 1])
          {
            mines++;
          }
        }
      }
      
      numGrid[a][b] = mines;
    }
  }
  
  play = true;
  win = false;
  
  timeCor = millis();
}
