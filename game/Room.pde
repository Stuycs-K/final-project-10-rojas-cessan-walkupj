class Room{
  private int dV;
  private String name;
  private Block[][] blockGrid;
  private PImage background = loadImage("fortniteBackground.jpeg");

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
  public void drawBlockGrid(){
    for (int r = 0; r < width; r += 100){
      for (int c = 0; c < height; c += 100){
        square(r, c, 10); //placeholder
        //drawblock(r, c);
      }
    }
  }
  public void drawRoom(){
    fill(0);
    background.resize(1000, 600);
    image(background, 0, 0);
    drawBlockGrid();
    
    textSize(55);
    text(getName(), 20, 50);
  }
}
