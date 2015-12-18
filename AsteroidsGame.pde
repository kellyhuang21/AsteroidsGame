SpaceShip shippy = new SpaceShip();
Stars [] plu;
ArrayList <Asteroids> floaty;
public void setup() 
{
  size(800,800);
  plu = new Stars[200];
  for(int i=0; i<plu.length; i++){
    plu[i] = new Stars();
  }
  floaty = new ArrayList <Asteroids>();
  for(int i=0; i<=21; i++){
    floaty.add(new Asteroids());
  }
}
public void draw() 
{
  background(0);
  shippy.show();
  shippy.move();
  
  for(int i=0;i<plu.length;i++){
    plu[i].show();
  }
  
  for(int i=0;i<floaty.size(); i++){
    floaty.get(i).setDirectionX(0);
    floaty.get(i).setDirectionY(0);
    floaty.get(i).show();
    floaty.get(i).move();
  }
}
public void keyPressed(){
  //left
  if (keyCode == 37){
    shippy.rotate(-10);
  }
  //right
  if (keyCode == 39){
    shippy.rotate(10);
  }
  //up
  if (keyCode == 38){
    shippy.accelerate(.123);
  }
  //down
  if (keyCode == 40){
    shippy.accelerate(-.123);
  }
  //h
  if (keyCode ==72){
    shippy.setX((int)(Math.random()*800));
    shippy.setY((int)(Math.random()*800));
  }
}

class SpaceShip extends Floater  
{   

  public SpaceShip()
  {
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0-5;
    yCorners[0] = 46-23;
    xCorners[1] = 10-5;
    yCorners[1] = 11-23;
    xCorners[2] = 20-5;
    yCorners[2] = 46-23;
    myCenterX = 400;
    myCenterY = 400;
    myColor =255;
  }

    public void setX(int x) {myCenterX = x;}
    public int getX(){return myCenterX;}   
    public void setY(int y) {myCenterY = y;}   
    public int getY() {return myCenterY;}  
    public void setDirectionX(double x) {myDirectionX = x;}   
    public double getDirectionX() {return myDirectionX;}  
    public void setDirectionY(double y) {myDirectionY = y;}   
    public double getDirectionY() {return myDirectionY;}   
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;} 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected int myCenterX, myCenterY; //holds center coordinates   
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
public class Stars{
  private int starX, starY, starSize;
  public Stars(){
    starX = (int)(Math.random()*width);
    starY = (int)(Math.random()*height);
    starSize = (int)(Math.random()*6);
  }
  public void show(){
    noStroke();
    fill(255);
    ellipse(starX,starY,starSize,starSize);
  }
}

public class Asteroids extends Floater
 {
  private int rotSpeed;
 
  public Asteroids()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    
    myCenterX=(int)(Math.random()*width);
    myCenterY=(int)(Math.random()*height);
    myColor=color(255);
    myPointDirection=(int)(Math.random()*360);
    
       
    if(Math.random()<.5)
    {
      rotSpeed= 3;
    }
    if(Math.random()>.5)
    {
      rotSpeed= -3;     
    }
    
    }
 
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
  
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
}
