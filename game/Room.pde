class Room{
  private String name;
  private Block[][] blockGrid;
  private PImage background = loadImage("fortniteBackground.jpeg");
  private int roomNumber;
  private int value;

  public Room(int roomNumber){
    blockGrid = new Block[10][10];
    this.roomNumber = roomNumber;
    value = 255;
  }
  
  public int getNum(){
    return roomNumber;
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
    if (roomNumber == 1){
      setupRoom1();           
    }
    if (roomNumber == 2){
      setupRoom2();           
    }
    drawBlockGrid();
    
    textSize(55);
    text(getName(), 20, 50);
  }
  public void setupRoom0(){
    background = loadImage("sunny.jpg");
    name = "Tutorial";
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
   
   public void setupRoom1(){
     background = loadImage("storm.jpg");
     name = "Ahhh there's a storm a-coming";
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 10; i++){
       currentRoom.addBlock(new WaterBlock(), i, 4);
     }
     for (int i = 0; i < 10; i++){
       if (i != 2 && i != 6){
         currentRoom.addBlock(new EarthBlock(), i, 3);
       }
     }
     text("Try pressing one or more of: WASD keys and drag and drop items, be cautious", 10, 70);
   }
   
   public void setupRoom2(){
     background = loadImage("hell.jpg");
     name = "POV you forgot to say bless you when \n you sneezed";
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 10; i++){
       currentRoom.addBlock(new WaterBlock(), i, 4);
     }
     for (int i = 0; i < 10; i++){
       if (i != 2 && i != 4 && i != 6){
         currentRoom.addBlock(new EarthBlock(), i, 3);
       }
     }
   }
   public void setValue(int n){
     value = n;
   }
   
   public void drawRoomMap(){
     stroke(255);
     fill(255);
      if (roomNumber == 0){
         square(100, 250, 100);
      }
      if (roomNumber == 1){
         square(250, 100, 100);
      }
      if (roomNumber == 2){
         square(250, 400, 100);
      }
   }

}
