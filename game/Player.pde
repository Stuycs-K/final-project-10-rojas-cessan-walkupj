class Player{
  private String name;
  private PImage image = loadImage("player.jpg");
  private int health;
  private int[] location;
  //private Inventory inventory;
  public Player(){
     name = "Sonny";
     health = 3;
     location = new int[]{0,0};
  }

}
