void draw() {
  if (widt != width || heigh != height)
  {
    bordY = height / 9;
    h = height - bordY;
    
    w = width;
    
    widt = width;
    heigh = height;
    
    rectMode(CENTER);
    
    if (w / Xsize < h / Ysize)
    {
      scale = (w / Xsize);
    }
    else
    {
      scale = (h / Ysize);
    }
    
    if (scale * Xsize < width)
    {
      bordX = (width - scale * Xsize) / 2;
    }
    else
    {
      bordX = 0;
    }
    
    w = width - bordX;
    
    if (w / Xsize < h / Ysize)
    {
      scale = (w / Xsize);
    }
    else
    {
      scale = (h / Ysize);
    }
    
    font = createFont("NotoMono-Regular.ttf", (scale / 4) * 3);
    textAlign(CENTER, CENTER);
    textFont(font);
  }
  
  background(175, 175, 175);
  win = true;
  
  for (int a = 0; a < Xsize; a++)
  {
    for (int b = 0; b < Ysize; b++)
    {
      fill(228, 229, 231);
      triangle(a * scale + bordX, b * scale + bordY, (a + 1) * scale + bordX, b * scale + bordY, a * scale + bordX, (b + 1) * scale + bordY);
      
      fill(125, 132, 140);
      triangle((a + 1) * scale + bordX, b * scale + bordY, (a + 1) * scale + bordX, (b + 1) * scale + bordY, a * scale + bordX, (b + 1) * scale + bordY);
      
      boolean mined = false;
      if (showGrid[a][b] == 1)
      {
        if (mineGrid[a][b])
        {
          mined = true;
        }
        else
        {
          mined = false;
        }
        
        fill(192, 192, 192);
        rect(a * scale + scale / 2 + bordX, b * scale + bordY + scale / 2, scale * 0.95, scale * 0.95);
      }
      else if (showGrid[a][b] == 2)
      {
        if (!mineGrid[a][b])
        {
          win = false;
        }
        
        fill(192, 192, 192);
        rect(a * scale + bordX + scale / 2, b * scale + bordY + scale / 2, scale * 0.8, scale * 0.8);
        
        fill(0, 0, 0);
        triangle(a * scale + bordX + scale / 2, b * scale + bordY + scale * 0.15 + scale / 2, a * scale + bordX - scale * 0.25 + scale / 2, b * scale + bordY + scale * 0.3 + scale / 2, a * scale + bordX + scale * 0.25 + scale / 2, b * scale + bordY + scale * 0.3 + scale / 2);
        rect(a * scale + bordX + scale / 2, b * scale + bordY + scale / 2, scale * 0.1, scale * 0.5);
        
        fill(222, 10, 22);
        triangle(a * scale + bordX + scale / 2 + scale * 0.05, b * scale + bordY + scale / 2 - scale * 0.05, a * scale + bordX + scale / 2 + scale * 0.05, b * scale + bordY + scale / 2 - scale * 0.3, a * scale + bordX + scale / 2 - scale * 0.3, b * scale + bordY + scale / 2 - scale * 0.15);
      }
      else
      {
        if (!mineGrid[a][b])
        {
          win = false;
        }
        
        fill(192, 192, 192);
        rect(a * scale + bordX + scale / 2, b * scale + bordY + scale / 2, scale * 0.8, scale * 0.8);
      }
      
      if (mined)
      {
        fill(0, 0, 0);
        ellipse(a * scale + bordX + scale / 2, b * scale + bordY + scale / 2, scale * 0.8, scale * 0.8);
      }
      
      if (numGrid[a][b] > 0 & showGrid[a][b] == 1)
      {
        if (numGrid[a][b] == 1)
        {
          fill(13, 10, 213);
        }
        else if (numGrid[a][b] == 2)
        {
          fill(16, 114, 5);
        }
        else if (numGrid[a][b] == 3)
        {
          fill(224, 6, 22);
        }
        else if (numGrid[a][b] == 4)
        {
          fill(2, 0, 118);
        }
        else if (numGrid[a][b] == 5)
        {
          fill(102, 16, 15);
        }
        else if (numGrid[a][b] == 6)
        {
          fill(26, 132, 132);
        }
        else if (numGrid[a][b] == 7)
        {
          fill(3, 3, 3);
        }
        else if (numGrid[a][b] == 8)
        {
          fill(122, 122, 122);
        }
        
        text(numGrid[a][b], a * scale + scale / 2 + bordX, b * scale + scale / 2 + bordY);
      }
    }
  }
  
  test = false;
  if (mouseY <= bordY)
  {
    if (mouseX > width / 2 - ((bordY / 4) * 1.5) & mouseX < ((bordY / 4) * 1.5) + width / 2)
    {
      if (mouseY >= -1 * (sqrt(sq(((bordY / 4) * 1.5)) - sq(mouseX - (width / 2.0))) - (bordY / 2.0 - ((bordY / 4) * 0))) & mouseY <= 1 * (sqrt(sq(((bordY / 4) * 1.5)) - sq(mouseX - (width / 2.0))) + (bordY / 2.0 - ((bordY / 4) * 0))))
      {
        test = true;
      }
    }
  }
  
  if (test)
  {
    fill(0, 255, 255);
  }
  else
  {
    fill(255, 255, 0);
  }
  
  ellipse(width / 2, bordY / 2, (bordY / 4) * 3, (bordY / 4) * 3);
  
  if (test)
  {
    fill(0, 0, 0);
  }
  else
  {
    fill(255, 255, 255);
  }
  
  if (play)
  {
    ellipse(width / 2 - (bordY / 7), (bordY / 7) * 3, (bordY / 6), (bordY / 6));
    ellipse(width / 2 + (bordY / 7), (bordY / 7) * 3, (bordY / 6), (bordY / 6));
  }
  
  if (test)
  {
    fill(255, 255, 255);
  }
  else
  {
    fill(0, 0, 0);
  }
  
  if (play)
  {
    float a = mouseX - w / 2;
    float b = mouseY - (bordY / 7) * 3;
    float c = sqrt(sq(a) + sq(b));
    float d = sqrt(sq(w / 2) + sq(h - (bordY / 7) * 3));
    float e = c / d;
    float abc = atan(abs(mouseY - (bordY / 7) * 3) / abs(mouseX - w / 2));
    if (a >= 0 & b >= 0)
    {
    }
    else if (a < 0 & b >= 0)
    {
      abc = radians(180) - abc;
    }
    else if (a < 0 & b < 0)
    {
      abc = radians(180) + abc;
    }
    else if (a >= 0 & b < 0)
    {
      abc = radians(360) - abc;
    }
    
    pushMatrix();
    translate(width / 2 + (bordY / 7), (bordY / 7) * 3);
    rotate(abc);
    ellipse((bordY / 24) * e, 0, (bordY / 12), (bordY / 12));
    popMatrix();
    
    pushMatrix();
    translate(width / 2 - (bordY / 7), (bordY / 7) * 3);
    rotate(abc);
    ellipse((bordY / 24) * e, 0, (bordY / 12), (bordY / 12));
    popMatrix();
  }
  else
  {
    pushMatrix();
    translate(width / 2 - (bordY / 7), (bordY / 7) * 3);
    rotate(degrees(45));
    rect(0, 0, (bordY / 4), (bordY / 24));
    rotate(degrees(-90));
    rect(0, 0, (bordY / 4), (bordY / 24));
    popMatrix();
    
    pushMatrix();
    translate(width / 2 + (bordY / 7), (bordY / 7) * 3);
    rotate(degrees(45));
    rect(0, 0, (bordY / 4), (bordY / 24));
    rotate(degrees(-90));
    rect(0, 0, (bordY / 4), (bordY / 24));
    popMatrix();
  }
  
  if (mouseX > bordX & mouseX < Xsize * scale & mouseY > bordY & mouseY < Ysize * scale)
  {
    if (showGrid[int((mouseX - bordX) / scale)][int((mouseY - bordY) / scale)] == 0 & play & !win)
    {
      ellipse(width / 2, (bordY / 16) * 11, bordY / 8, bordY / 8);
    }
    else
    {
      ellipse(width / 2, (bordY / 16) * 11, bordY / 3, bordY / 16);
    }
  }
  else
  {
    ellipse(width / 2, (bordY / 16) * 11, bordY / 3, bordY / 16);
  }
  
  fill(200, 50, 50);
  textSize((bordY / 4) * 3);
  text(int(numMineFinal - flags), width / 8 + bordX, bordY / 2);
  
  if (play & !win & firstClick)
  {
    time = millis();
  }
  text(int((time - timeCor) / 1000), (width / 8) * 7 - bordX, bordY / 2);
  
  textSize((scale / 4) * 3);
  
  if (!play)
  {
    fill(0, 0, 0, 100);
    rect(width / 2, height / 2, width, height);
    
    fill(200, 50, 50);
    textSize(scale * (Xsize / 5));
    text("Game Over", width / 2, height / 2);
    textSize((scale / 4) * 3);
  }
  
  if (win)
  {
    fill(0, 0, 0, 100);
    rect(width / 2, height / 2, width, height);
    
    fill(200, 50, 50);
    textSize(scale * (Xsize / 5));
    text("You Won", width / 2, height / 2);
    textSize((scale / 4) * 3);
  }
}
