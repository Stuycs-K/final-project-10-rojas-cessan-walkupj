class Room{
  private String name;
  private Block[][] blockGrid;
  private PImage background = loadImage("backgrounds/fortniteBackground.jpeg");
  private int roomNumber;

  public Room(int roomNumber){
    blockGrid = new Block[10][10];
    this.roomNumber = roomNumber;
    
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
  
  public int[][] getHorizon(){
    int[][] horizonCoors = new int[10][2];
    //int r = 0;
    //for(int i = 0; i < blockGrid.length; i++){
    //  for(int j = 0; j < blockGrid[i].length; j++){
    //    if(thereIsBlock(i, j)){
    //      horizonCoors[r][0] = i*100;
    //      horizonCoors[r][1] = j*100;
    //      r++;
    //    }
    //  }
    //}
    return horizonCoors;
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
  public void fillWithEmpty(){
    for(int i = 0; i < blockGrid.length; i++){
      for(int j = 0; j < blockGrid[i].length; j++){
        if(blockGrid[i][j] == null){
          blockGrid[i][j] = new EmptyBlock();
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
  public Block getBlock(int r, int c){
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
    if (roomNumber == 3){
      setupRoom3();           
    }
    drawBlockGrid();
    
    textSize(55);
    text(getName(), 20, 50);
  }
  public void setupRoom0(){
    background = loadImage("backgrounds/sunny.jpg");
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
     fillWithEmpty();
     text("Try pressing the WASD keys, dragging and dropping items, and be cautious!", 10, 70);
   }
   
   public void setupRoom1(){
     background = loadImage("backgrounds/storm.jpg");
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
     fillWithEmpty();
   }
   
   public void setupRoom2(){
     background = loadImage("backgrounds/hell.jpg");
     name = "POV you forgot to say bless you when \n you sneezed";
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 10; i++){
       currentRoom.addBlock(new MonsterBlock(), i, 4);
     }
     for (int i = 0; i < 10; i++){
       if (i != 2 && i != 4 && i != 6){
         currentRoom.addBlock(new EarthBlock(), i, 3);
       }
     }
     fillWithEmpty();
   }
   
   public void setupRoom3(){
     background = loadImage("backgrounds/bluesky.jpg");
     name = "climb!";
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 10; i++){
       currentRoom.addBlock(new WaterBlock(), i, 4);
     }
     for (int i = 0; i < 5; i++){
         currentRoom.addBlock(new EarthBlock(), i, 3);
     }
     for (int i = 6; i < 10; i++){
         currentRoom.addBlock(new EarthBlock(), i, 2);
     }
     fillWithEmpty();
   }

   
   public void drawRoomMap(){
     stroke(0);
     fill(255);
     int x = width/4 * roomNumber;   //change this
      if (roomNumber == 0){
         square(x, 300, 100);
         text("0", x, 300);
      }
      if (roomNumber == 1){
         square(x, 300, 100);
         text("1", x, 300);
      }
      if (roomNumber == 2){
         square(x, 300, 100);
         text("2", x, 300);
      }
      if (roomNumber == 3){
         square(x, 300, 100);
         text("3", x, 300);
      }
   }

}
