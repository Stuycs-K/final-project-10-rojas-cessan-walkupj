class Player{
  private String name;
  private PImage leftImage = loadImage("blockImages/playerLeft.png");
  private PImage rightImage = loadImage("blockImages/playerRight.png");
  private int health;
  private int pheight = 150;
  private int pwidth = 75;
  private boolean left;
  private int x, y;
  //private Inventory inventory;
  //150 tall, 100 across
  public Player(){
     name = "Sonny";
     x = 0;
     y = 160;
  }
  
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  
  public void drawPlayer(){ //placeholder for image
    if(left){
      leftImage.resize(pwidth, pheight);
      image(leftImage, x, y);
    }
    else{
      rightImage.resize(pwidth, pheight);
      image(rightImage, x, y);
    }
  }
  
  //public void drawPlayerLeft(){ //placeholder for image
  //  image(leftImage, location[0], location[1]);
  //}
  
  //  public void drawPlayerRight(){ //placeholder for image
  //  image(rightImage, location[0], location[1]);
  //}
  
  public void walkLeft(){
    if (x < 0){
      x = 0;
    }
    if (x > width-50){
      x = width-50;
    }
    x -= 20;  
  }
  public void walkRight(){
    if (x < 0){
      x = 0;
    }
    if (x > width-50){
      x = width-50;
    }
      x += 20;  
  }
  
  public void walkUp(){
    if (y < 0){
      y = 0;
    }
    if (y > width-50){
      y = width-50;
    }
    y -= 50;  
  }
  
  public void walkDown(){
    if (y < 0){
      y = 0;
    }
    if (y > width-50){
      y = width-50;
    }
    y += 50;  
  }
  
  public void fall(){
    y = 0;
  }

}
