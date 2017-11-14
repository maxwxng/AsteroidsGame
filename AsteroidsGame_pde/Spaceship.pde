class Bullet extends Floater  //extends Floater  
{   
    double dRadians;
  Bullet(SpaceShip jet)
  {  
    myColor = color(184, 156, 193);
    myCenterX = jet.getX();
    myCenterY = jet.getY();
    myPointDirection = jet.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + jet.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + jet.getDirectionY();
  }
  
  public void setX(int x) { myCenterX = x;}
    public int getX() { return (int)myCenterX;}
    public void setY(int y) { myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) { myDirectionX = x;}
    public double getDirectionX() { return (double)myDirectionX; }
    public void setDirectionY(double y) { myDirectionY = y; }
    public double getDirectionY() { return (double)myDirectionY; }
    public void setPointDirection(int degrees) { myPointDirection = degrees;}
    public double getPointDirection() { return (double)myPointDirection; } 
    public void show() 
  {   
    fill(myColor);
    stroke(myColor);
    ellipse((int)myCenterX, (int)myCenterY, 7,7);
  }
  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
  //your code here
}