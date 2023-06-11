import java.util.*;
private Map map;
private int currentRoomNumber = 0;
private Room currentRoom;
private Player player; 
private Inventory inventory;
private Block[] inv = new Block[10];
private PImage deathImage;
private int MODE = 0; 
private int inventoryFromMouse;
private int initMouseY;
private int initMouseX;
private int roomRFromMouse;
private int roomCFromMouse;
private int ogMode;
private static final int WALK = 0;
private static final int MAP = 1;
private static final int DEATH = 2;
private boolean left = false;
private boolean right = false;

void keyPressed() {
  switch (keyCode){
    case 'A': //left
      left = true;
      break;
    case 'D': //right
      right = true;
      break;    
    case SHIFT: 
      if (MODE == DEATH) MODE = MAP;
      break;
  }
}

void keyReleased() {
  switch (keyCode){
    case 'A': 
      left = false;
      break;
    case 'D': 
      right = false;
      break;
  }
}


void setup(){
  frameRate(60);
  size(1000, 650);
  map = new Map();
  currentRoom = map.get(currentRoomNumber);
<<<<<<< HEAD
  inventory = new Inventory();
=======
>>>>>>> origin/nelli
  player = new Player();
  if(currentRoomNumber == 0){
    inventory.setupInventory(new BridgeBlock(), new BridgeBlock(), new BridgeBlock(), new BridgeBlock(), new BridgeBlock(), new StairBlock(), null, null, null, null);
    inv[0] = new BridgeBlock();
    inv[1] = new BridgeBlock();
    inv[2] = new BridgeBlock();
    inv[3] = new BridgeBlock();
    inv[4] = new BridgeBlock();
    inv[5] = new StairBlock();
    inv[6] = null;
    inv[7] = null;
    inv[8] = null;
    inv[9] = null;
  }
  else{
   for(int i = 0; i < 10; i++){
    inventory.addToInventory(inv[i], i);
   }
  }
  deathImage = loadImage("blockImages/youDied.jpg");
  drawSetting();
}

void mousePressed(){
  ogMode = MODE;
  if (MODE == WALK){
    initMouseY = mouseY;
    initMouseX = mouseX;
    if(initMouseY >= 500){
      inventoryFromMouse = mouseX / 100;
    }
    else{
      roomRFromMouse = mouseX / 100;
      roomCFromMouse = mouseY / 100;
    }
  }
}



void mouseReleased(){
  if(MODE == WALK && ogMode != MAP){
    if(initMouseY < 500 && mouseY >= 500){ // room to inv
      inventoryFromMouse = mouseX / 100;
      inventory.addToInventory(currentRoom.getBlock(initMouseX / 100, initMouseY / 100), inventoryFromMouse);
      inv[inventoryFromMouse] = currentRoom.getBlock(initMouseX / 100, initMouseY / 100);
      currentRoom.removeBlock(initMouseX / 100, initMouseY / 100);
    }
    else if(initMouseY < 500 && mouseY < 500){ // room to room
       roomRFromMouse = mouseX / 100;
      roomCFromMouse = mouseY / 100;
      currentRoom.addBlock(currentRoom.getBlock(initMouseX / 100, initMouseY / 100), roomRFromMouse, roomCFromMouse);
      currentRoom.removeBlock(initMouseX / 100, initMouseY / 100);
    }
    else if(initMouseY >= 500 && mouseY < 500){ // inv to room
      roomRFromMouse = mouseX / 100;
      roomCFromMouse = mouseY / 100;
      currentRoom.addBlock(inventory.getItem(inventoryFromMouse), roomRFromMouse, roomCFromMouse);
      inventory.removeFromInventory(inventoryFromMouse);
      inv[inventoryFromMouse] = null;
    }
  }
}




void draw(){
  println(MODE);
  if (MODE == WALK){ ////////////////////////////////////////////////////////////////////////
    drawSetting();
    Block blockBelow = currentRoom.getBlock((player.getX())/100, (player.getY() + 150)/100);
    String typeBelow = blockBelow.type();
    Block blockOn = currentRoom.getBlock((player.getX()-20)/100, (player.getY()+75)/100);
    String typeOn = blockOn.type();
    if (player.getX() > 900){
     MODE = MAP;
     currentRoom.changeStatus();
    } 
    if(typeOn.equals("Monster")||typeBelow.equals("Monster")){
      MODE = DEATH;
    }
    if(typeOn.equals("Stair")){
      player.onStairs("true");
    }
    if(!typeOn.equals("Stair")){
      player.onStairs("false");
    }
    if(typeBelow.equals("Empty") || typeBelow.equals("Water")){ //death thing
      player.fall();
    }
    if(player.getY() >= 550){
      MODE = DEATH;
    }
  } 
  
  else if(MODE == DEATH){ ////////////////////////////////////////////////////////////////////////
    deathImage.resize(width, height);
    image(deathImage, 0, 0);
    fill(255, 255, 255);
    text("press shift to return to the map and try again", 50, 50);
  } 
  
  else if (MODE == MAP){////////////////////////////////////////////////////////////////////////
    map.drawMap();
    int x = width/map.size();  
    if (mouseY > 300 && mouseY < 400){
      if (mousePressed == true && mouseX > 0 && mouseX < 100){
        MODE = WALK;
        currentRoomNumber= 0;
        player = new Player();
      }     
       else if (mousePressed == true && mouseX > x && mouseX < x + 100 && map.get(0).getStatus()){
        MODE = WALK;
        currentRoomNumber= 1;
        player = new Player();
      }
       else if (mousePressed == true && mouseX > x * 2 && mouseX < x * 2 + 100 && map.get(1).getStatus()){
        MODE = WALK;
        currentRoomNumber= 2;
        player = new Player();
      }
      else if (mousePressed == true && mouseX > x * 3 && mouseX < x * 3 + 100 && map.get(2).getStatus()){
        MODE = WALK;
        currentRoomNumber= 3;
        player = new Player();
      }
      else if (mousePressed == true && mouseX > x * 4 && mouseX < x * 4 + 100 && map.get(3).getStatus()){
        MODE = WALK;
        currentRoomNumber= 4;
        player = new Player();
      }
      else if (mousePressed == true && mouseX > x * 5 && mouseX < x * 5 + 100 && map.get(3).getStatus()){
        MODE = WALK;
        currentRoomNumber= 5;
        player = new Player();
      }
      else if (mousePressed == true && mouseX > x * 6 && mouseX < x * 6 + 100 && map.get(3).getStatus()){
        MODE = WALK;
        currentRoomNumber= 6;
        player = new Player();
      }
    }
  }
}

public void drawSetting(){
  currentRoom = map.get(currentRoomNumber);
  currentRoom.drawRoom();
  player.drawPlayer();
  inventory.drawInventory();
}
