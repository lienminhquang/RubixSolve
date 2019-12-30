float x,y,z;
PImage img;
Rubix rubix;
Point<Integer> prevousMouse = null;


void setup()
{
  size(640, 480, P3D);
  background(0);
  lights();
  
  img = loadImage("img.jpg"); 
  rubix = new Rubix();
}

void draw(){
  
  background(0);
  rubix.Draw();
}

void keyPressed()
{
  
  switch(key)
  {
   case 'f':
     rubix.RotateFront(true);
   break;
   case 'b':
     rubix.RotateBack(true);
   break;
   case 'l':
     rubix.RotateLeft(true);
   break;
   case 'r':
     rubix.RotateRight(true);
   break;
   case 'u':
     rubix.RotateUp(true);
   break;
   case 'd':
     rubix.RotateDown(true);
   break;
  }
}



void mouseReleased()
{
 rubix.ResetRotate();
 prevousMouse = null;
}


void mouseDragged()
{
  if(prevousMouse == null)
  {
   prevousMouse = new Point<Integer>(mouseX, mouseY);
   return;
  }
  
  rubix.Rotate(mouseX - prevousMouse.x, - mouseY + prevousMouse.y, 0);
  prevousMouse.x = mouseX;
  prevousMouse.y = mouseY;
}
