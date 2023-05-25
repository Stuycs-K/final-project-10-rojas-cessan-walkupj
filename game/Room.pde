class Room{
  private int dV;
  private String name;
  private Block[][] blockGrid;
  //private PImage background = loadImage("bridgeBlock.jpg");

  public Room(int decisionValue, String name){
    dV = decisionValue;
    this.name = name;
    blockGrid = new Block[10][10];
  }
  
  public int getdV(){
    return dV;
  }
  public String getName(){
    return name;
  }
  public void drawRoom(){
    fill(0);
    textSize(55);
    text(getName(), 20, 50);
  }
}
