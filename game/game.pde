import java.util.*;
private Map map;
private int currentRoomNumber = 0;
private Room currentRoom;
private Inventory inventory;
private Player player; 
private PImage deathImage;
private int MODE; 
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
  frameRate(10);
  MODE = 0;
  size(1000, 650);
  map = new Map();
  map.add(new Room(0));
  map.add(new Room(1));
  map.add(new Room(2));
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
  if (player.getY() >= 550){
     MODE = DEATH;
  }
  if (MODE == WALK){
    drawSetting();
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      player.left = true;
      player.walkLeft();
    }
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      player.left = false;
      player.walkRight();
    }
    if (keyboardInput.isPressed(Controller.P1_UP)) {
      //player.walkUp();
    }

    //if player is at the end
   if (player.getX() > 900){
     MODE = MAP;
   } 
  }
  Block currentBlock = currentRoom.getBlock((player.getX())/100, (player.getY() + 150)/100);
  if(currentBlock.type().equals("Empty") || currentBlock.type().equals("Water")){ //death thing
    player.fall();
  }
  System.out.println(currentBlock.type());
  if(currentBlock.type().equals("Stair")){ 
    player.onStairs("true");
  }
  if(!currentBlock.type().equals("Stair")){ 
    player.onStairs("false");
  }
  
  if(MODE == DEATH){
    deathImage.resize(width, height);
    image(deathImage, 0, 0);
    fill(255, 255, 255);
    text("press shift to return to the map and try again", 50, 50);
    if(keyboardInput.isPressed(Controller.SHIFT_KEY)) MODE = MAP;
  }
  if (MODE == MAP){
    map.drawMap();
    textSize(100);
    text("Map", 10, 70);
    if (mousePressed == true && mouseX > 100 && mouseX < 200 && mouseY > 300 && mouseY < 400){
      MODE = WALK;
      currentRoomNumber= 0;
      setup();
    }
     if (mousePressed == true && mouseX > 400 && mouseX < 500 && mouseY > 300 && mouseY < 400){
      MODE = WALK;
      currentRoomNumber= 1;
      setup();
    }
     if (mousePressed == true && mouseX > 700 && mouseX < 800 && mouseY > 300 && mouseY < 400){
      MODE = WALK;
      currentRoomNumber= 2;
      setup();
    }
    
  }
  fill(0);
}

public void drawSetting(){
  currentRoom.drawRoom();
  player.drawPlayer();
  inventory.drawInventory();
}
