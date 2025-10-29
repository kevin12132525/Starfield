//your code here
Particle [] total = new Particle[500];
void setup()
{
  size(800, 800);
  noStroke();
  for (int i =0; i < total.length; i++) {
    total[i] = new Particle();
  }
  for (int i = 0; i < (total.length/8); i++) {
    total[i] = new OddballParticle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < total.length; i++) {
    total[i].show();
    total[i].move();
  }
}
class Particle
{
  private int myColor;
  private double myX, myY, mySpeed, myAngle;
  Particle() {
    myX = (Math.random()*50)+375;
    myY = (Math.random()*50)+375;
    myColor = color(0, (int)(Math.random()*256), (int)(Math.random()*256));
    mySpeed = (Math.random()*3)+1;
    myAngle = (Math.random()*2)*Math.PI;
  }
  //your code here
  public void move() {
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed); 
    //bouncing part
    if (myX > 800 || myX < 0) {
      myX = 400;
      myColor -=40;
    }
    if (myY > 800 || myY < 0) {
      myY = 400;
      myColor -=40;
    }
  }
  public void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }

  // get/set myX
  public double getmyX() {
    return myX;
  }
  public void setmyX(double xNew) {
    myX = xNew;
  }
  // get/set myY
  public double getmyY() {
    return myY;
  }
  public void setmyY(double yNew) {
    myY = yNew;
  }
  // get/set myColor
  public int getmyColor() {
    return myColor;
  }
  public void setmyColor(int cNew) {
    myColor = cNew;
  }
  // get/set mySpeed
  public double getmySpeed() {
    return mySpeed;
  }
  public void setmySpeed(double sNew) {
    mySpeed = sNew;
  }
  // get/set myAngle
  public double getmyAngle() {
    return myAngle;
  }
  public void setmyAngle(double aNew) {
    myAngle = aNew;
  }
}
class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle() {
    setmyX((int)(Math.random()*50)+375);
    setmyY((int)(Math.random()*50)+375);
    setmyColor(color((int)(Math.random()*200)+56, 0, (int)(Math.random()*200)+56));
    setmySpeed((Math.random()*4)+1);
    setmyAngle((Math.random()*3)*Math.PI);
  }
  public void move() { // oddball
    setmyX(getmyX() + (Math.cos(getmyAngle())*getmySpeed()));
    setmyY(getmyY() + (Math.sin(getmyAngle())*getmySpeed()));
  }
  public void show() { //oddball
    fill(getmyColor());
    ellipse((float)getmyX(), (float)getmyY(), 15, 15);
    if (mousePressed) {
      setmyX(mouseX);
      setmyY(mouseY);
      setmyColor(color((int)(Math.random()*200)+56, 0, (int)(Math.random()*200)+56));
      setmyAngle((Math.random()*3)*Math.PI);
    }
  }
}
