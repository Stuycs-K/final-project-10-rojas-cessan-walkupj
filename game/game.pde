import java.util.*;
private Map map;
private int currentRoomNumber;
private Room currentRoom;
private Inventory inventory;
private Player player; 
private int MODE; 
private int inventoryFromMouse;
private int initMouseY;
private int initMouseX;
private int roomRFromMouse;
private int roomCFromMouse;
private boolean isLayer;
private static final int WALK = 0;
private static final int MAP = 1;
Controller keyboardInput;

void changeMode(){
  if (MODE == WALK){
    MODE = MAP;
  } else {
    MODE = WALK;
  }
}

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}


void setup(){
  MODE = 0;
  currentRoomNumber = 0;
  size(1000, 650);
  map = new Map();
  map.add(new Room(0));
  map.add(new Room(1));
  map.add(new Room(2));
  currentRoom = map.get(currentRoomNumber);
  for(int i = 0; i < width / 100; i++){
    currentRoom.addBlock(new EarthBlock(), i, 4);
  }
  inventory = new Inventory();
  inventory.addToInventory(new BridgeBlock(), 0);
  player = new Player();
  keyboardInput = new Controller();
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
    inventory.addToInventory(currentRoom.get(initMouseX / 100, initMouseY / 100), inventoryFromMouse);
    currentRoom.removeBlock(initMouseX / 100, initMouseY / 100);
  }
  else if(initMouseY < 500 && mouseY < 500){ // room to room
    roomRFromMouse = mouseX / 100;
    roomCFromMouse = mouseY / 100;
    currentRoom.addBlock(currentRoom.get(initMouseX / 100, initMouseY / 100), roomRFromMouse, roomCFromMouse);
    currentRoom.removeBlock(initMouseX / 100, initMouseY / 100);
  }
  else if(initMouseY >= 500 && mouseY < 500){ // inv to room
    roomRFromMouse = mouseX / 100;
    roomCFromMouse = mouseY / 100;
    currentRoom.addBlock(inventory.get(inventoryFromMouse), roomRFromMouse, roomCFromMouse);
    inventory.removeFromInventory(inventoryFromMouse);
  }
}




void draw(){
  System.out.println(MODE);
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
      player.walkUp();
    }
    if (keyboardInput.isPressed(Controller.P1_DOWN)) {
      player.walkDown();
    }
    //if player is at the end
   if (player.getX() > 900){
     currentRoom.setValue(150);
     MODE = MAP;
   } 
  }
  if (MODE == MAP){
    map.drawMap();
    textSize(100);
    text("Map", 10, 70);
    if (mouseX > 800){
      MODE = WALK;
      currentRoomNumber++;
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
