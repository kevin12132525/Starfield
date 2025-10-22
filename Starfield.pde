//your code here
Particle [] total = new Particle[500];
void setup()
{
  size(800,800);
  noStroke();
  for(int i =0; i < total.length; i++){
    total[i] = new Particle();
  }
  for(int i = 0; i < (total.length/10); i++){
    total[i] = new OddballParticle();
  }
}
void draw()
{
  background(0);
  for(int i = 0; i < total.length; i++){
    total[i].show();
    total[i].move();
  }
}
class Particle
{
  int myColor;
  double myX, myY, mySpeed, myAngle;
  Particle(){
  myX = (Math.random()*50)+375;
  myY = (Math.random()*50)+375;
  myColor = color(0, (int)(Math.random()*256), (int)(Math.random()*256));
  mySpeed = (Math.random()*3)+1;
  myAngle = (Math.random()*2)*Math.PI;
  }
  //your code here
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed); 
    //bouncing part
    if(myX > 800 || myX < 0){
      myX = 400;
      myColor -=40;
    }
    if(myY > 800 || myY < 0){
      myY = 400;
      myColor -=40;
  }
  }
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }
}

class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle(){
  myX = (int)(Math.random()*50)+375;
  myX = (int)(Math.random()*50)+375;
  myColor = color((int)(Math.random()*200)+56,0,(int)(Math.random()*200)+56);
  mySpeed = (Math.random()*4)+1;
  myAngle = (Math.random()*3)*Math.PI;
  }
  void move(){ // oddball
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed); 
    
}
  void show(){ //oddball
    fill(myColor);
    ellipse((float)myX, (float)myY, 15, 15);
  }
}

