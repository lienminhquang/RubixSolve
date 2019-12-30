class Rubix{
  Box[][][] boxs;
  float box_size = 70;
  int a = 0;
  float rotate_x = 0, rotate_y = 0, rotate_z = 0;
  
  
 Rubix()
 {
   boxs = new Box[3][][];
   for(int i = 0; i < 3; i++)
   {
     boxs[i] = new Box[3][];
     for(int j = 0; j < 3; j++)
     {
       boxs[i][j] = new Box[3];
       for(int k = 0; k < 3; k++)
       {
         boxs[i][j][k] = new Box(
           (box_size) * (i - 1), 
           (box_size) * (j - 1), 
           (box_size) * (k - 1), 
           box_size / 2.1,
           i,
           j,
           k
          );
          boxs[i][j][k].SetId(i * 100 + j * 10 + k);
          
       }
     }
   }
 }
 
 void RotateFront(boolean isClockwise)
 {
   System.out.print("F ");
   Box[][] temp = new Box[3][];
   for(int i = 0; i < 3; i++)
   {
     temp[i] = new Box[3];
   }
   
   for(int i = 0; i < 3; i++)
   {
     
    for(int j = 0; j < 3; j++)
    {
      Point<Integer> target = this.Rotate90(new Point(i, j), new Point(1, 1), isClockwise);
      temp[target.x][target.y] = boxs[i][j][2]; 
    }
   }
   
   for(int i = 0; i < 3; i++)
   {
    for(int j = 0; j < 3; j++)
    {
      boxs[i][j][2] = temp[i][j]; 
      if(isClockwise) boxs[i][j][2].Rotate(0, 0 , 90);
      else boxs[i][j][2].Rotate(0, 0 , -90);
      boxs[i][j][2].SetPosition(
           (box_size) * (i - 1), 
           (box_size) * (j - 1), 
           (box_size) * (2 - 1));
    }
   }
 }
 void RotateBack(boolean isClockwise)
 {
   System.out.print("B ");
   Box[][] temp = new Box[3][];
   for(int i = 0; i < 3; i++)
   {
     temp[i] = new Box[3];
   }
   
   for(int i = 0; i < 3; i++)
   {
     
    for(int j = 0; j < 3; j++)
    {
      Point<Integer> target = this.Rotate90(new Point(i, j), new Point(1, 1), !isClockwise);
      temp[target.x][target.y] = boxs[i][j][0]; 
    }
   }
   
   for(int i = 0; i < 3; i++)
   {
    for(int j = 0; j < 3; j++)
    {
      boxs[i][j][0] = temp[i][j]; 
      if(isClockwise) boxs[i][j][0].Rotate(0, 0 , -90);
      else boxs[i][j][0].Rotate(0, 0 , 90);
      boxs[i][j][0].SetPosition(
           (box_size) * (i - 1), 
           (box_size) * (j - 1), 
           (box_size) * (0 - 1));
    }
   }
 }
 
 void RotateLeft(boolean isClockwise)
 {
   System.out.print("L ");
   Box[][] temp = new Box[3][];
   for(int i = 0; i < 3; i++)
   {
     temp[i] = new Box[3];
   }
   
   for(int i = 0; i < 3; i++)
   {
     
    for(int j = 0; j < 3; j++)
    {
      Point<Integer> target = this.Rotate90(new Point(i, j), new Point(1, 1), !isClockwise);
      temp[target.x][target.y] = boxs[0][i][j]; 
    }
   }
   
   for(int i = 0; i < 3; i++)
   {
    for(int j = 0; j < 3; j++)
    {
      boxs[0][i][j] = temp[i][j]; 
      if(isClockwise) boxs[0][i][j].Rotate(-90, 0 , 0);
      else boxs[0][i][j].Rotate(90, 0 , 0);
      boxs[0][i][j].SetPosition(
           (box_size) * (0 - 1), 
           (box_size) * (i - 1), 
           (box_size) * (j - 1));
    }
   }
 }
 
 void RotateRight(boolean isClockwise)
 {
   System.out.print("R ");
   Box[][] temp = new Box[3][];
   for(int i = 0; i < 3; i++)
   {
     temp[i] = new Box[3];
   }
   
   for(int i = 0; i < 3; i++)
   {
     
    for(int j = 0; j < 3; j++)
    {
      Point<Integer> target = this.Rotate90(new Point(i, j), new Point(1, 1), isClockwise);
      temp[target.x][target.y] = boxs[2][i][j]; 
    }
   }
   
   //System.out.println("x = " + boxs[2][0][0].rotate_x + " y = " + boxs[2][0][0].rotate_y + " z = " + boxs[2][0][0].rotate_z);
   
   for(int i = 0; i < 3; i++) //<>//
   {
    for(int j = 0; j < 3; j++)
    {
      boxs[2][i][j] = temp[i][j]; 
      if(isClockwise) boxs[2][i][j].Rotate(90, 0 , 0);
      else boxs[2][i][j].Rotate(-90, 0 , 0);
      boxs[2][i][j].SetPosition(
           (box_size) * (2 - 1), 
           (box_size) * (i - 1), 
           (box_size) * (j - 1));
    }
   }
   //System.out.println("x = " + boxs[2][0][0].rotate_x + " y = " + boxs[2][0][0].rotate_y + " z = " + boxs[2][0][0].rotate_z);

 } //<>//
 
 void RotateUp(boolean isClockwise)
 {
   System.out.print("U ");
   Box[][] temp = new Box[3][];
   for(int i = 0; i < 3; i++)
   {
     temp[i] = new Box[3];
   }
   
   for(int i = 0; i < 3; i++)
   {
     
    for(int j = 0; j < 3; j++)
    {
      Point<Integer> target = this.Rotate90(new Point(i, j), new Point(1, 1), isClockwise);
      temp[target.x][target.y] = boxs[i][0][j]; 
    }
   }
   
   for(int i = 0; i < 3; i++)
   {
    for(int j = 0; j < 3; j++)
    {
      boxs[i][0][j] = temp[i][j]; 
      if(isClockwise) boxs[i][0][j].Rotate(0, -90 , 0);
      else boxs[i][0][j].Rotate(0, 90 , 0);
      boxs[i][0][j].SetPosition(
           (box_size) * (i - 1), 
           (box_size) * (0 - 1), 
           (box_size) * (j - 1));
    }
   }
 }
 
 void RotateDown(boolean isClockwise)
 {
   System.out.print("D ");
   Box[][] temp = new Box[3][];
   for(int i = 0; i < 3; i++)
   {
     temp[i] = new Box[3];
   }
   
   for(int i = 0; i < 3; i++)
   {
     
    for(int j = 0; j < 3; j++)
    {
      Point<Integer> target = this.Rotate90(new Point(i, j), new Point(1, 1), !isClockwise);
      temp[target.x][target.y] = boxs[i][2][j]; 
    }
   }
   
   for(int i = 0; i < 3; i++)
   {
    for(int j = 0; j < 3; j++)
    {
      boxs[i][2][j] = temp[i][j]; 
      if(isClockwise) boxs[i][2][j].Rotate(0, 90 , 0);
      else boxs[i][2][j].Rotate(0, -90 , 0);
      boxs[i][2][j].SetPosition(
           (box_size) * (i - 1), 
           (box_size) * (2 - 1), 
           (box_size) * (j - 1));
    }
   }
 }
 
 void Rotate(float x, float y, float z)
 {
   rotate_x += x;
   rotate_y += y;
   rotate_z += z;
 }
 
 void ResetRotate()
 {
   rotate_x = 0;
   rotate_y = 0;
   rotate_z = 0;
 }
 
 void Draw()
 {
  
   translate(width / 2, height / 2, 0);
   rotateY(radians(rotate_x));
   rotateX(radians(rotate_y));
   rotateZ(radians(rotate_z));
   //rotateZ(radians(100));
   //rotateZ(radians(0));
   pushMatrix();
  
   
   for(int i = 0; i < 3; i++)
   {
     for(int j = 0; j < 3; j++)
     {
       for(int k = 0; k < 3; k++)
       {
         if(boxs[i][j][k] != null)
         boxs[i][j][k].Draw();
       }
     }
   }
   popMatrix();
 }
  
  Point<Integer> Rotate90(Point<Integer> p, Point<Integer> pivot, boolean isClockwise)
  {
  
    int sin = isClockwise ? 1 : -1;
    int cos = 0;
    
    //translate point back to orgin
    p.x -= pivot.x;
    p.y -= pivot.y;
    
    // rotate point
    int newx = p.x * cos - p.y * sin;
    int newy = p.x * sin + p.y * cos;
    
    //translate point back
    p.x = newx + pivot.x;
    p.y = newy + pivot.y;
    
    return p;
  }
}
