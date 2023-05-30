class Room{
  private int dV;
  private String name;
  private Block[][] blockGrid;
  private PImage background = loadImage("fortniteBackground.jpeg");
  private int roomNumber;

  public Room(int decisionValue, String name, int roomNumber){
    dV = decisionValue;
    this.name = name;
    blockGrid = new Block[10][10];
    this.roomNumber = roomNumber;
  }
  
  public int getdV(){
    return dV;
  }
  public String getName(){
    return name;
  }
  
  public boolean thereIsBlock (int x, int y){
    return blockGrid[x][y] != null;
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
    if (roomNumber == 0){
      setupRoom0();
    }
    drawBlockGrid();
    
    textSize(55);
    text(getName(), 20, 50);
  }
  public void setupRoom0(){
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 10; i++){
       currentRoom.addBlock(new WaterBlock(), i, 4);
     }
     for (int i = 0; i < 10; i++){
       if (i != 4 && i != 5){
         currentRoom.addBlock(new EarthBlock(), i, 3);
       }
     }
   }
}
