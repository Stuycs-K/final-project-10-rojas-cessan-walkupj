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
    for (int r = 0; r < 10; r ++){
      for (int c = 0; c < 6; c ++){
        //square(r, c, 10); //placeholder
        if(blockGrid[r][c] != null){
          blockGrid[r][c].drawBlock(r*100, c*100);
        }
      }
    }
  }
  public void addBlock(Block block, int r, int c){
    blockGrid[r][c] = block;
  }
  public void removeBlock(int r, int c){
    blockGrid[r][c] = null;
  }
  public Block get(int r, int c){
    return blockGrid[r][c];
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
