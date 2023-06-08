import java.util.*;
private Map map;
private int currentRoomNumber = 0;
private Room currentRoom;
private Inventory inventory;
private Player player; 
private PImage deathImage;
private int MODE = 0; 
private int inventoryFromMouse;
private int initMouseY;
private int initMouseX;
private int roomRFromMouse;
private int roomCFromMouse;
private static final int WALK = 0;
private static final int MAP = 1;
private static final int DEATH = 2;
Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}


void setup(){
  frameRate(60);
  size(1000, 650);
  map = new Map();
  map.add(new Room(0));
  map.add(new Room(1));
  map.add(new Room(2));
  map.add(new Room(3));
  currentRoom = map.get(currentRoomNumber);
  inventory = new Inventory();
  inventory.addToInventory(new BridgeBlock(), 0);
  inventory.addToInventory(new BridgeBlock(), 1);
  inventory.addToInventory(new BridgeBlock(), 2);
  inventory.addToInventory(new BridgeBlock(), 3);
  inventory.addToInventory(new BridgeBlock(), 4);
  inventory.addToInventory(new StairBlock(), 5);
  player = new Player();
  keyboardInput = new Controller();
  deathImage = loadImage("blockImages/youDied.jpg");
  drawSetting();
}

void mousePressed(){
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
  if(initMouseY < 500 && mouseY >= 500){ // room to inv
    inventoryFromMouse = mouseX / 100;
    inventory.addToInventory(currentRoom.getBlock(initMouseX / 100, initMouseY / 100), inventoryFromMouse);
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
  }
}




void draw(){
  if (MODE == WALK){ ////////////////////////////////////////////////////////////////////////
    drawSetting();
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      player.left = true;
      player.walkLeft();
    }
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      player.left = false;
      player.walkRight();
    }
    //if (keyboardInput.isPressed(Controller.P1_UP)) {
      //player.walkUp();
    //}
    if (player.getX() > 900){
     MODE = MAP;
    } 
    Block currentBlock = currentRoom.getBlock((player.getX())/100, (player.getY() + 150)/100);
    Block blockBelow = currentRoom.getBlock((player.getX())/100, (player.getY() + 150)/100);
    String typeBelow = blockBelow.type();
    Block blockOn = currentRoom.getBlock((player.getX()-20)/100, (player.getY()+75)/100);
    String typeOn = blockOn.type();
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
  } ////////////////////////////////////////////////////////////////////////

  
  else if(MODE == DEATH){ ////////////////////////////////////////////////////////////////////////
    deathImage.resize(width, height);
    image(deathImage, 0, 0);
    fill(255, 255, 255);
    text("press shift to return to the map and try again", 50, 50);
    if(keyboardInput.isPressed(Controller.SHIFT_KEY)) MODE = MAP;
  } ////////////////////////////////////////////////////////////////////////
  
  else if (MODE == MAP){
    map.drawMap();
    int x = width/4;
    if (mousePressed == true && mouseX > x * 0 && mouseX < x * 0 + 100 && mouseY > 300 && mouseY < 400){
      MODE = WALK;
      currentRoomNumber= 0;
      setup();
    }
     else if (mousePressed == true && mouseX > x && mouseX < x + 100 && mouseY > 300 && mouseY < 400){
      MODE = WALK;
      currentRoomNumber= 1;
      setup();
    }
     else if (mousePressed == true && mouseX > x * 2 && mouseX < x * 2 + 100 && mouseY > 300 && mouseY < 400){
      MODE = WALK;
      currentRoomNumber= 2;
      setup();
    }
    else if (mousePressed == true && mouseX > x * 3 && mouseX < x * 3 + 100 && mouseY > 300 && mouseY < 400){
      MODE = WALK;
      currentRoomNumber= 3;
      setup();
    }
  }
}

public void drawSetting(){
  currentRoom.drawRoom();
  player.drawPlayer();
  inventory.drawInventory();
}
