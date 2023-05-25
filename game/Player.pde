class Player{
  private String name;
  //private PImage image = loadImage("player.jpg");
  private int health;
  private int[] location;
  //private Inventory inventory;
  public Player(){
     name = "Sonny";
     health = 3;
     location = new int[]{0,150};
  }
  
  public void drawPlayer(){ //placeholder for image
    int x = location[0];
    int y = location[1];
    fill(0, 255, 0);
    rect(x, y, 50, 150);
    fill(255);
    ellipse(x+10, y+15, 15, 10);
    ellipse(x+40, y+15, 15, 10);
    fill(0);
    ellipse(x+10, y+15, 7, 7);
    ellipse(x+40, y+15, 7, 7);
    fill(255, 0, 0);
    arc(x+25, y+30, 40, 30, 0, 3.14);
    line(x+5, y+30, x+45, y+30);
    textSize(20);
    text(name, x, y);
  }
  
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
