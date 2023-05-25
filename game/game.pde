import java.util.*;
private Room currentRoom;
private Inventory inventory;
private Player player; 
private int MODE; 
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
  inventory = new Inventory();
  player = new Player();
  keyboardInput = new Controller();
  drawSetting();
}

void draw(){
  drawSetting();
  if (MODE == WALK){
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      player.walkLeft();
    }
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      player.walkRight();
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
