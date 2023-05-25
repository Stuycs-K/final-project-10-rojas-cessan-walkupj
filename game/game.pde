import java.util.*;
private Room currentRoom;
private Inventory inventory;
private Player player; 
private int MODE; 
private static final int WALK = 0;
private static final int BUILD = 1;
private static final int INVENTORY = 2;
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
  background(255); 
  line(100,0,100, 500); //each block is 100
  line(200,0,200, 500);
  line(300,0,300, 500);
  line(400,0,400, 500);
  line(500,0,500, 500);
  line(600,0,600, 500);
  line(700,0,700, 500);
  line(800,0,800, 500);
  line(900,0,900, 500);
  line(0,100,1000, 100);
  line(0,200,1000, 200);
  line(0,300,1000, 300);
  line(0,400,1000, 400);
  line(0,500,1000, 500);
  currentRoom.drawRoom();
  player.drawPlayer();
  inventory.drawInventory();
}
