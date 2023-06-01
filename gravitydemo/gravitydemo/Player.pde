public class Player{
  float w, h, x, y, vx, vy, accX, accY;
  float gravity;
  boolean inAir;
  float strength;
  
  public Player(){
    w = 50;
    h = 75;
    x = 0; 
    y = 0;
    vx = 0;
    vy = 0;
    accX = 0; 
    accY = 0;
    gravity = 9.8;
  }
  void update(){
    if (left && !right) accX = -0.5;
    if (!left && right) accX = 0.5;
    if (!left && !right) accX = 0;
    if (up && !down) accY = -0.5;
    if (!up && down) accY = 0.5;
    if (!up && !down) accY = 0;
    vx += accX;
    vy += accY;
    x+= vx;
    y+= vy;
  }
  void display(){
  rect(x, y, w, h);
}
}
