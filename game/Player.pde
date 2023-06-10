class Player{
  private String name;
  private PImage leftImage = loadImage("blockImages/playerLeft.png");
  private PImage rightImage = loadImage("blockImages/playerRight.png");
  private int pheight = 150;
  private int pwidth = 75;
  private boolean Pleft, isOnStairs;
  private int[] location;
  //private Inventory inventory;
  //150 tall, 100 across
  public Player(){
     name = "Sonny";
     location = new int[]{0,160};
  }
  
  public int getX(){
    return location[0];
  }
  public int getY(){
    return location[1];
  }
  
  public void setX(int x){
    location[0] = x;
  }
  public void setY(int y){
    location[1] = y;
  }
  
  public void updatePosition (){
    if (right){
      Pleft = false;
      player.walkRight();
    }
    else if (left){
      Pleft = true;
      player.walkLeft();
    }
  }
  
  public void drawPlayer(){ //placeholder for image
  updatePosition();
    if(Pleft){
      leftImage.resize(pwidth, pheight);
      image(leftImage, location[0], location[1]);
    }
    else{
      rightImage.resize(pwidth, pheight);
      image(rightImage, location[0], location[1]);
    }
  }
  
  
  public void walkLeft(){
    if (location[0] < 0){
      location[0] = 0;
    }
    if (location[0] > width-50){
      location[0] = width-50;
    }
    location[0] -= 25;  
  }
  public void walkRight(){
    if (location[0] < 0){
      location[0] = 0;
    }
    if (location[0] > width-50){
      location[0] = width-50;
    }
      location[0] += 25; 
     if (isOnStairs){
       walkUp();
     }
  }
  
  public void walkUp(){
    if (location[1] < 0){
      location[1] = 0;
    }
    if (location[1] > width-50){
      location[1] = width-50;
    }
    location[1] -= 100;  
  }
  
  public void fall(){

    if(player.getY() > 650) player.setY(650);

    location[1] += 25;
  }
  
  public void onStairs(String bool){
    if (bool.equals("true")) isOnStairs = true;
    if (bool.equals("false")) isOnStairs = false;
  }

}
