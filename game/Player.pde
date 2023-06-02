class Player{
  private String name;
  private PImage leftImage = loadImage("blockImages/playerLeft.png");
  private PImage rightImage = loadImage("blockImages/playerRight.png");
  private int health;
  float x, y, vx, vy, accX, accY;
  float gravity, bounce, friction;
  float jumpForce;
  private int h = 150;
  private int w = 75;
  private boolean left;

  public Player(){
     name = "Sonny";
     x = 0;
     y = 160;
    vx = 0;
    vy = 0;
    accX = 0;
    accY = 0;
    jumpForce = -5;

    friction = 0.96;
    gravity = 0.6;
    bounce = -0.2;
  }
  
  public int getX(){
    return (int)x;
  }
  public int getY(){
    return (int)y;
  }
  
  public void drawPlayer(){ //placeholder for image
    if(left){
      leftImage.resize(w, h);
      image(leftImage, x, y);
    }
    else{
      rightImage.resize(w, h);
      image(rightImage, x, y);
    }
  }
  
 void update() {
    if (left && !right) {
      accX = -0.2;
      friction = 1;
    }
    if (!left && right) {
      accX = 0.2;
      friction = 1;
    }
    if (!left && !right) accX = 0;
    if (up && !down) {
      accY = -0.2;
      gravity = 0;
      friction = 1;
    }
    if (!up && down) {
      accY = 0.2;
      friction = 1;
    }
    if (!up && !down) accY = 0;
    if (!up && !down && !left && !right) {
      friction = 0.96;
      gravity = 0.3;
    }

    vx += accX;
    vy += accY;
    vx *= friction;
    vx *= friction;
    vy += gravity;
    x+= vx;
    y+= vy;
    bounds();
  }

  void bounds() {
    if (x< 0) {
      vx *= bounce;
      x =0;
    }
    if (x + w > width) {
      vx *= bounce;
      x = width - w;
    }
    if (y< 0) {
      vy *= bounce;
      y =0;
    }
    if (y + h > height) {
      vy *= bounce;
      y = height - h;
    }
  }
public void fall(){
    y = 0;
  }


}
