void cleaner(int X, int Y) {
  if (numGrid[X][Y] == 0)
        {
          if (X > 0)
          {
            if (showGrid[X - 1][Y] == 0)
            {
              showGrid[X - 1][Y] = 1;
              if (numGrid[X - 1][Y] == 0)
              {
                cleaner(X - 1, Y);
              }
            }
            
            if (false)
            {
            if (Y > 0)
            {
              if (showGrid[X - 1][Y - 1] == 0)
              {
                showGrid[X - 1][Y - 1] = 1;
                if (numGrid[X - 1][Y - 1] == 0)
                {
                  cleaner(X - 1, Y - 1);
                }
              }
            }
            
            if (Y < Ysize - 1)
            {
              if (showGrid[X - 1][Y + 1] == 0)
              {
                showGrid[X - 1][Y + 1] = 1;
                if (numGrid[X - 1][Y + 1] == 0)
                {
                  cleaner(X - 1, Y + 1);
                }
              }
            }
            }
          }
          
          if (X < Xsize - 1)
          {
            if (showGrid[X + 1][Y] == 0)
            {
              showGrid[X + 1][Y] = 1;
              if (numGrid[X + 1][Y] == 0)
              {
                cleaner(X + 1, Y);
              }
            }
            
            if (false)
            {
            if (Y > 0)
            {
              if (showGrid[X + 1][Y - 1] == 0)
              {
                showGrid[X + 1][Y - 1] = 1;
                if (numGrid[X + 1][Y - 1] == 0)
                {
                  cleaner(X + 1, Y - 1);
                }
              }
            }
            
            if (Y < Ysize - 1)
            {
              if (showGrid[X + 1][Y + 1] == 0)
              {
                showGrid[X + 1][Y + 1] = 1;
                if (numGrid[X + 1][Y + 1] == 0)
                {
                  cleaner(X + 1, Y + 1);
                }
              }
            }
            }
          }
          
          if (Y > 0)
          {
            if (showGrid[X][Y - 1] == 0)
            {
              showGrid[X][Y - 1] = 1;
              if (numGrid[X][Y - 1] == 0)
              {
                cleaner(X, Y - 1);
              }
            }
          }
          
          if (Y < Ysize - 1)
          {
            if (showGrid[X][Y + 1] == 0)
            {
              showGrid[X][Y + 1] = 1;
              if (numGrid[X][Y + 1] == 0)
              {
                cleaner(X, Y + 1);
              }
            }
          }
        }
}
