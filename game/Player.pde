class Player{
  private String name;
  private PImage leftImage = loadImage("blockImages/playerLeft.png");
  private PImage rightImage = loadImage("blockImages/playerRight.png");
  private int health;
  private int pheight = 150;
  private int pwidth = 75;
  private boolean left;
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
  
  public void drawPlayer(){ //placeholder for image
    if(left){
      leftImage.resize(pwidth, pheight);
      image(leftImage, location[0], location[1]);
    }
    else{
      rightImage.resize(pwidth, pheight);
      image(rightImage, location[0], location[1]);
    }
  }
  
  //public void drawPlayerLeft(){ //placeholder for image
  //  image(leftImage, location[0], location[1]);
  //}
  
  //  public void drawPlayerRight(){ //placeholder for image
  //  image(rightImage, location[0], location[1]);
  //}
  
  public void walkLeft(){
    if (location[0] < 0){
      location[0] = 0;
    }
    if (location[0] > width-50){
      location[0] = width-50;
    }
    location[0] -= 5;  
  }
  public void walkRight(){
    if (location[0] < 0){
      location[0] = 0;
    }
    if (location[0] > width-50){
      location[0] = width-50;
    }
      location[0] += 50;  
  }
  
  public void walkUp(){
    if (location[1] < 0){
      location[1] = 0;
    }
    if (location[1] > width-50){
      location[1] = width-50;
    }
    location[1] -= 10;  
  }
  
  public void walkDown(){
    if (location[1] < 0){
      location[1] = 0;
    }
    if (location[1] > width-50){
      location[1] = width-50;
    }
    location[1] += 10;  
  }
  
  public void fall(){
    walkDown();
  }

}
