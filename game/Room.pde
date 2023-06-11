class Room{
  private String name;
  private Block[][] blockGrid;
  private PImage background = loadImage("backgrounds/fortniteBackground.jpeg");
  private int roomNumber;
  private boolean done = false;

  public Room(int roomNumber){
    blockGrid = new Block[10][10];
    this.roomNumber = roomNumber;
    
  }
  
  public boolean getStatus(){ //tells u if room is done (true)or not (f)
    return done;
  }
  
  public void changeStatus(){ //room is done
    done = true;
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
    else if (roomNumber == 1){
      setupRoom1();           
    }
    else if (roomNumber == 2){
      setupRoom2();           
    }
    else if (roomNumber == 3){
      setupRoom3();           
    }
    else if (roomNumber == 4){
      setupRoom4();           
    }
    else if (roomNumber == 5){
      setupRoom5();           
    }
    else if (roomNumber == 6){
      setupRoom6();           
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
     //currentRoom.addBlock(new MonsterBlock(), 3, 2);
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
     for (int i = 0; i < 6; i++){
         currentRoom.addBlock(new EarthBlock(), i, 3);
     }
     for (int i = 6; i < 10; i++){
         currentRoom.addBlock(new EarthBlock(), i, 2);
     }
     fillWithEmpty();
   }
   
   public void setupRoom4(){
     background = loadImage("backgrounds/ireland.jpg");
     name = "what to do what to do...";
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 4; i++){
         currentRoom.addBlock(new EarthBlock(), i, 3);
     }
     for (int i = 7; i < 10; i++){
         currentRoom.addBlock(new EarthBlock(), i, 2);
     }
     fillWithEmpty();
   }
   
   public void setupRoom5(){
     background = loadImage("backgrounds/castlefar.jpg");
     name = "what to do what to do...";
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 6; i++){
         if (i != 4 && i != 6){
         currentRoom.addBlock(new EarthBlock(), i, 3);
       }
     }
     for (int i = 7; i < 10; i++){
         currentRoom.addBlock(new EarthBlock(), i, 2);
     }
     fillWithEmpty();
   }
   
   public void setupRoom6(){
     background = loadImage("backgrounds/insidecastle.jpeg");
     name = "what to do what to do...";
     image(background, 0, 0, 1000, 600);
     for (int i = 0; i < 10; i++){
         if (i != 3 && i != 4 && i != 5){
         currentRoom.addBlock(new EarthBlock(), i, 3);
       }
     }

     fillWithEmpty();
   }

   
   public void drawRoomMap(){
     stroke(0);
     fill(100);
     if (getStatus() == false){
       fill(255);
     }
     int x = width/7 * roomNumber;   //change this
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
      if (roomNumber == 4){
         square(x, 300, 100);
         text("4", x, 300);
      }
      if (roomNumber == 5){
         square(x, 300, 100);
         text("5", x, 300);
      }
      if (roomNumber == 6){
         square(x, 300, 100);
         text("6", x, 300);
      }
   }

}
