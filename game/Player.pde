class Player{
  private String name;
  private PImage leftImage = loadImage("blockImages/playerLeft.png");
  private PImage rightImage = loadImage("blockImages/playerRight.png");
  private int health;
  private boolean left;
  private int[] location;
  //private Inventory inventory;
  public Player(){
     name = "Sonny";
     health = 3;
     location = new int[]{0,150};
  }
  
  public void drawPlayer(){ //placeholder for image
    if(left) image(leftImage, location[0], location[1]);
    else image(rightImage, location[0], location[1]);
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
      location[0] += 5;  
  }

}
