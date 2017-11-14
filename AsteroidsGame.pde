SpaceShip trek = new SpaceShip();
  ArrayList <Asteroid>rocks = new ArrayList <Asteroid>();
  ArrayList <Bullet>boom = new ArrayList <Bullet>();
Star[] dot = new Star[300];
boolean upIsPressed = false;
boolean downIsPressed = false;
boolean leftIsPressed = false;
boolean rightIsPressed = false;


public void setup() 
{
  size(1000, 1000);
  for(int i=0;i<dot.length;i++){
    dot[i] = new Star();
  } 
  for(int b=0;b<50;b++){
    rocks.add(b,new Asteroid());

  }
} 
public void draw() 
{
  background(0);
  trek.show();
  trek.move();
  for(int i=0;i<dot.length;i++){
    dot[i].show();
  }
  for(int b=0;b<rocks.size();b++){
    rocks.get(b).show();
    rocks.get(b).move();
    if(dist(trek.getX(),trek.getY(),rocks.get(b).getX(),rocks.get(b).getY())<25){
    rocks.remove(b);
  }  
  }
  for(int p=0;p<boom.size();p++){
    boom.get(p).show();
    boom.get(p).move();
  }
  for(int a=0;a<boom.size();a++){
    for(int c=0;c<rocks.size();c++){
      if(dist(boom.get(a).getX(),boom.get(a).getY(),rocks.get(c).getX(),rocks.get(c).getY())<20){
        rocks.remove(c);
        boom.remove(a);
        break;
      }
    }
  }

  
  //keys stuff
  if(upIsPressed==true)
  {
    trek.accelerate(0.2);
  }
  if(downIsPressed==true)
  {
    trek.accelerate(-0.2);
  }
  if(leftIsPressed==true)
  {
    trek.rotate(-3);
  }
  if(rightIsPressed==true)
  {
    trek.rotate(3);
  }
  if(upIsPressed==true && rightIsPressed==true)
  {
    trek.accelerate(0);
    trek.rotate(3);
  }
  if(upIsPressed==true && leftIsPressed==true)
  {
    trek.accelerate(0);
    trek.rotate(-3);
  }
  if(downIsPressed==true && rightIsPressed==true)
  {
    trek.accelerate(0);
    trek.rotate(3);
  }
  if(downIsPressed==true && leftIsPressed==true)
  {
    trek.accelerate(0);
    trek.rotate(-3);
  }

}
public void keyPressed(){
  if(keyCode == UP)
  {
    upIsPressed = true;
  }
  if(keyCode == RIGHT){
    rightIsPressed = true;
  }
  if(keyCode == LEFT){
    leftIsPressed = true;
  }
  if(key == 'a'){
    trek.setX((int)(Math.random()*1000));
    trek.setY((int)(Math.random()*1000));
    trek.setDirectionX(0);
    trek.setDirectionY(0);
    trek.setPointDirection((int)(Math.random()*360));
  }
  if(keyCode ==DOWN){
    downIsPressed = true;
  }
  if (key == 's') {
    trek.setDirectionX(0);
    trek.setDirectionY(0);
  }
  if(key == 32){
    boom.add(new Bullet(trek));//bullet
  }

}
public void keyReleased(){
  if(keyCode == UP){
    upIsPressed = false;
  }
  if(keyCode == DOWN){
    downIsPressed = false;
  }
  if(keyCode == RIGHT){
    rightIsPressed = false;
  }
  if(keyCode == LEFT){
    leftIsPressed = false;
  }
}
class SpaceShip extends Floater  
{   

   public void setX(int x){myCenterX=x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY=y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}  
   public double getPointDirection(){return myPointDirection;} 
   public SpaceShip(){
    myColor=color(255);
    corners =9;
    xCorners = new int[corners];
    yCorners = new int[corners];

    xCorners[0]=15;//tip
    yCorners[0]=0;
    xCorners[1]=10;//leftcorner
    yCorners[1]=-5;
    xCorners[2]=-5;//left second one
    yCorners[2]=-5;
    xCorners[3]=-10;//bottom left
    yCorners[3]=-10;
    xCorners[4]=-7;//vertex in left
    yCorners[4]=-5;
    xCorners[5]=-7;//vertex in right
    yCorners[5]=4;
    xCorners[6]=-10;//bottom right
    yCorners[6]=10;
    xCorners[7]=-5;//right second one
    yCorners[7]=5;
    xCorners[8]=10;//right corner
    yCorners[8]=5;
    
   


    myCenterX=300;
    myCenterY=300; 
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;    


   }
}
class Asteroid extends Floater
{
   private int rot;
   public void setX(int x){myCenterX=x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY=y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}  
   public double getPointDirection(){return myPointDirection;} 
   public Asteroid(){
    myColor=color(112, 105, 104);
    corners=6;
    xCorners = new int[corners];
    yCorners = new int [corners];

    xCorners[0]=-16;
    yCorners[0]=8;
    xCorners[1]=-8;
    yCorners[1]=12;
    xCorners[2]=8;
    yCorners[2]=8;
    xCorners[3]=16;
    yCorners[3]=0;
    xCorners[4]=8;
    yCorners[4]=-8;
    xCorners[5]=-12;
    yCorners[5]=-12;

    myCenterX=(int)(Math.random()*1000);
    myCenterY=(int)(Math.random()*1000); 
    myDirectionX=(int)(Math.random()*7)-3;
    myDirectionY=(int)(Math.random()*7)-3;
    myPointDirection=0;    
    rot=(int)(Math.random()*3)-1;
  
    
   }
   public void move(){
      super.move();
      rotate(rot);

   }

}
class Bullet extends Floater{
  public void setX(int x){myCenterX=x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY=y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}  
   public double getPointDirection(){return myPointDirection;} 
  public Bullet(SpaceShip trek){
    myCenterX=trek.getX();
    myCenterY=trek.getY(); 
    myPointDirection=trek.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX=5 * Math.cos(dRadians);
    myDirectionY=5 * Math.sin(dRadians);
  }
  public void show(){
    noStroke();
    fill(26, 255, 255);
    ellipse((float)myCenterX,(float)myCenterY,12,12);
  }
  public void move(){
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    //dont loop
    for(int i=0;i<boom.size();i++){
    if(myCenterX>1000){
      boom.remove(this);
    }
    if(myCenterY>1000){
      boom.remove(this);
    }
    if(myCenterX<0){
      boom.remove(this);
    }
    if(myCenterY<0){
      boom.remove(this);
    } 
  }

  }
}
class Star{ 
  private int mySx,mySy;
  Star(){
    mySx=(int)(Math.random()*1000);
    mySy=(int)(Math.random()*1000);
  }
  public void show(){
    fill(255);
    ellipse(mySx,mySy,1,1);
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 