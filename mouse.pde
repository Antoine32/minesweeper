void mouseClicked() {
  if (mouseX >= bordX & mouseX < bordX + Xsize * scale & mouseY >= bordY & mouseY < bordY + Ysize * scale)
  {
    if (play & !win)
    {
      int X = int((mouseX - bordX) / scale);
      int Y = int((mouseY - bordY) / scale);
      
      if (!firstClick)
      {
        firstClick = true;
        newGrid(X, Y);
      }
      
      if (mouseButton == LEFT)
      {
        if (showGrid[X][Y] == 0)
        {
          showGrid[X][Y] = 1;
          if (mineGrid[X][Y])
          {
            play = false;
            
            for (int a = 0; a < Xsize; a++)
            {
              for (int b = 0; b < Ysize; b++)
              {
                if (mineGrid[a][b])
                {
                  showGrid[a][b] = 1;
                }
              }
            }
          }
          else
          {          
            cleaner(X, Y);
          }
        }
      }
      else if (mouseButton == RIGHT)
      {
        if (showGrid[X][Y] == 0)
        {
          if (flags < maxFlag)
          {
            showGrid[X][Y] = 2;
            flags++;
          }
        }
        else if (showGrid[X][Y] == 2)
        {
          showGrid[X][Y] = 0;
          flags--;
        }
      }
    }
    else
    {
      firstClick = false;
      flags = 0;
      numGrid = new int[Xsize][Ysize];
      mineGrid = new boolean[Xsize][Ysize];
      showGrid = new int[Xsize][Ysize];
      play = true;
      win = false;
      time = timeCor;
    }
  }
  else if (test & mouseButton == LEFT)
  {
    firstClick = false;
      flags = 0;
      numGrid = new int[Xsize][Ysize];
      mineGrid = new boolean[Xsize][Ysize];
      showGrid = new int[Xsize][Ysize];
      play = true;
      win = false;
      time = timeCor;
  }
}
