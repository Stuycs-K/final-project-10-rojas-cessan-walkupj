import java.util.*;
private Room currentRoom;
private Inventory inventory;
private Player player; 
private int MODE; 
private int inventoryFromMouse;
private int roomRFromMouse;
private int roomCFromMouse;
private static final int WALK = 0;
private static final int BUILD = 1;
private static final int INVENTORY = 2;
private static final int MAP = 3;
Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}


void setup(){
  MODE = 0;
  size(1000, 650);
  currentRoom = new Room(0, "Tutorial");
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
  if(mouseX >= 500){
    inventoryFromMouse = mouseX / 100;
  }
  else{
    roomRFromMouse = mouseX / 100;
    roomCFromMouse = mouseY / 100;
  }
}

void mouseReleased(){
  roomRFromMouse = mouseX / 100;
  roomCFromMouse = mouseY / 100;
  
  currentRoom.addBlock(inventory.get(inventoryFromMouse), roomRFromMouse, roomCFromMouse);
  inventory.removeFromInventory(inventoryFromMouse);
}

void draw(){
  drawSetting();
  if (MODE == WALK){
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
  }
  fill(0);
  text("Try pressing one or more of: WASD keys", 10, 70);
}

public void drawSetting(){
  background(255); //each block is 100
  currentRoom.drawRoom();
  player.drawPlayer();
  inventory.drawInventory();
}
