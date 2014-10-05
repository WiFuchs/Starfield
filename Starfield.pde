Particle[] p;
int secs, savedTime;

void setup()
{
  noStroke();
  smooth();
  secs=millis();
  savedTime=0;
  size(800, 800);
  p = new Particle[400];
  for(int i=0; i<p.length; i++){
    if(i==0){
      p[i]=new OddballParticle();
    }else{
      p[i] = new NormalParticle();
    }
  }
}
void draw() {
  secs=millis();
  fill(0,0,0,50);
  rect(-1,-1,802,802);
  if(mousePressed==true){
    for(int i=0; i<p.length; i++){
      p[i].reset();
      savedTime=millis();
    }
  } else {
    for(int i=0; i<p.length; i++){
      p[i].move();
      p[i].show();
    }
  }
}
class NormalParticle implements Particle
{
  float x,y,speed,angle;
  int size;
  color clr;
  NormalParticle(){
    clr=color(greyscale+(int)(Math.random()*40-20),greyscale+(int)(Math.random()*40-20),greyscale+(int)(Math.random()*40-20));
    x=(float)Math.random()*50+225;
    y=(float)Math.random()*50+225;
    speed=(float)Math.random()*5+1;
    angle=(float)Math.random()*360;
    size=(int)(Math.random()*4+2);
  }
  public void move(){
    x+=cos(angle)*speed;
    y+=sin(angle)*speed;
    y+=0.005*(secs-savedTime);
  }
  public void show(){
    fill(clr);
    ellipse(x, y, size, size);
  }
  public void reset(){
    x=mouseX;
    y=mouseY;
    int greyscale = (int)(Math.random()*230);
    clr=color(greyscale+(int)(Math.random()*40-20),greyscale+(int)(Math.random()*40-20),greyscale+(int)(Math.random()*40-20));
  }
}
interface Particle
{
  public void move();
  public void show();
  public void reset();
}
class OddballParticle implements Particle
{
  float x,y,speed,angle;
  int size;
  color clr;
  OddballParticle(){
    clr=color(greyscale+(int)(Math.random()*40-20),greyscale+(int)(Math.random()*40-20),greyscale+(int)(Math.random()*40-20));
    x=(float)Math.random()*50+225;
    y=(float)Math.random()*50+225;
    speed=(float)Math.random()*6+1;
    angle=(float)Math.random()*360;
    size=(int)(Math.random()*4+2);
  }
  
  public void move(){
    x+=(cos(angle)*speed)*Math.random();
    y+=sin(angle)*speed;
  }
  public void show(){
    fill(clr);
    ellipse(x, y, size, size);
  }
  public void reset(){
    x=mouseX;
    y=mouseY;
  }
}