class Point3D<T>{
  T x,y,z;
  Point3D(T x, T y, T z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

class Rotate
{
 char direction;
 int degree;
 Rotate(char dir, int deg)
 {
  this.direction = dir;
  this.degree = deg;
 }
}
