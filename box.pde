class Box
{
  float x, y, z;
  float rotate_x, rotate_y, rotate_z;
  
  float half_size;
  
  //ArrayList<Point3D<Integer>> rotates = new ArrayList<Point3D<Integer>>();
  ArrayList<Rotate> rotates2 = new ArrayList<Rotate>();

  int id = 0;
  boolean top = false,down = false,left = false,right = false,front = false,back = false;

  public Box(float x, float y, float z, float half_size, int i, int j, int k)
  {
    this.x = x;
    this.y = y;
    this.z = z;
    
    this.half_size = half_size;
    
    
    if(j == 0) 
    {
      top = true;
    }
    else if(j == 2)
    {
     down = true; 
    }
    if(i == 0) 
    {
      left = true;
    }
    else if(i == 2)
    {
     right = true; 
    }
    if(k == 0) 
    {
      back = true;
    }
    else if(k == 2)
    {
      front = true; 
    }
    
    //this.rotates.add(new Point3D<Integer>(0, 0, 0));
  }
  
  void SetId(int id)
  {
    this.id = id;
  }
  
  void SetPosition(float x, float y, float z)
  {
   this.x = x;
   this.y = y; 
   this.z = z;
  }
  
  void Rotate(int x_, int y_, int z_)
  {
    //this.rotates.add(new Point3D<Integer>(x_, y_, z_));
    if(x_ != 0)
      this.rotates2.add(new Rotate('x', x_));
    if(y_ != 0)
      this.rotates2.add(new Rotate('y', y_));
    if(z_ != 0)
      this.rotates2.add(new Rotate('z', z_));
  }
   
  public void Draw()
  {
    pushMatrix();
    translate(this.x, this.y, this.z);
    
    //fill(255, 0, 0);
    //text("" + id, this.x, this.y, this.z);
    //fill(0, 0, 0);
    /**
    for(int i = 0; i < rotates.size(); i++)
    {
      rotateX(radians(rotates.get(i).x));
      rotateY(radians(rotates.get(i).y));
      rotateZ(radians(rotates.get(i).z));
      System.out.println("x = " + rotates.get(i).x + " y = " + rotates.get(i).y + " z = " + rotates.get(i).z);
    }
    **/
    for(int i = rotates2.size() - 1; i >= 0 ; i--)
    {
      Rotate r = rotates2.get(i);
      if(r.direction == 'x')
      {
       rotateX(radians(r.degree)); 
      }
      else if(r.direction == 'y')
      {
       rotateY(radians(r.degree)); 
      }
      else if(r.direction == 'z')
      {
       rotateZ(radians(r.degree)); 
      }
      //System.out.println("" + r.direction + " : " + r.degree);
    }
    
    
    //Front
    beginShape();
    if(!front) fill(0,0,0); else fill(255, 0, 0);
    //stroke(127);
    vertex(-half_size, -half_size, half_size);
    vertex( half_size, -half_size, half_size);
    vertex( half_size,  half_size, half_size);
    vertex(-half_size,  half_size, half_size);
    endShape();
    
    //Down
    beginShape();
    if(!down) fill(0,0,0); else fill(255, 255, 0);
    //stroke(127);
    vertex(-half_size, half_size, half_size);
    vertex( half_size, half_size, half_size);
    vertex( half_size,  half_size, -half_size);
    vertex(-half_size,  half_size, -half_size);
    endShape();
    
    //Back cam
    beginShape();
    if(!back) fill(0,0,0); else fill(255, 127, 0);
    //stroke(127);
    vertex(-half_size,  half_size, -half_size);
    vertex( half_size,  half_size, -half_size);
    vertex(half_size, -half_size, -half_size);
    vertex(-half_size, -half_size, -half_size);
    endShape();
    
    
    //Up
    beginShape();
    if(!top) fill(0,0,0); else fill(255, 255, 255);
    //stroke(127);
    vertex(-half_size, -half_size, half_size);
    vertex( half_size, -half_size, half_size);
    vertex( half_size, -half_size, -half_size);
    vertex(-half_size, -half_size, -half_size);
    endShape();
    
    //Left 
    beginShape();
    if(!left) fill(0,0,0); else fill(0, 255, 0);
    vertex(-half_size, -half_size, half_size);
    vertex(-half_size, -half_size,-half_size);
    vertex(-half_size,  half_size,-half_size);
    vertex(-half_size,  half_size, half_size);
    endShape();
    
    //Right
    beginShape();
    if(!right) fill(0,0,0); else fill(0, 0, 255);
    vertex( half_size, -half_size, half_size);
    vertex( half_size, -half_size,-half_size);
    vertex( half_size,  half_size, -half_size);
    vertex( half_size,  half_size,  half_size);
    endShape();
    
    
    popMatrix();
  }
 
}
