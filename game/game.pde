import java.util.*;
import processing.sound.*;
SoundFile jazz, boom, sadJazz;
boolean music = false; 
private Map map;
private int currentRoomNumber = 0;
private Room currentRoom;
private Inventory inventory;
private Player player; 
private PImage deathImage;
private int MODE = -1; 
private int inventoryFromMouse;
private int initMouseY;
private int initMouseX;
private int roomRFromMouse;
private int roomCFromMouse;
private int ogMode;
private static final int SETTINGS = -2;
private static final int START = -1;
private static final int WALK = 0;
private static final int MAP = 1;
private static final int DEATH = 2;
private boolean left = false;
private boolean right = false;
private boolean hacks = false;

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
  player = new Player();
  inventory = player.inventory;
  inventory.setupInventory(new BridgeBlock(), new BridgeBlock(), new BridgeBlock(), new BridgeBlock(), new BridgeBlock(), new StairBlock(), null, null, null, null);
  deathImage = loadImage("blockImages/youDied.jpg");
  background(0);
  textSize(100);
  text("Welcome to the game!", 10, 150);
  textSize(60);
  text("Click on an option", 250, 250);
  fill (255);
  rect(350, 300, 300, 100);
  rect(350, 450, 300, 100);
  fill (0);
  textSize(40);
  text("Play Normally", 380, 360);
  text("Play with Hacks", 370, 510);
  //this loads the file based on the file name
  jazz = new SoundFile(this,"sound/Himiko_Kikuchi_Fluffy.mp3");
  sadJazz = new SoundFile(this,"sound/Cowboy-Bebop-Farewell-Blues.mp3");
  boom = new SoundFile(this,"sound/vine-boom.mp3");
  jazz.play();
  
  //this changes the volume level (number between 0 and 1)
  jazz.amp(.5);
}

void mousePressed(){
  ogMode = MODE;
  if (MODE == START){
    if (mouseX>350 && mouseX<650){
      if (mouseY>300 && mouseY < 400){
        MODE = WALK;
      }
      if (mouseY>450 && mouseY < 550){
        hacks = true;
        MODE = WALK;
      }
    }

  }

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
}




void draw(){
  if (MODE == SETTINGS){
    background(255);
    fill(0);
    square(948, 2, 50);
    
  }
  
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
      boom.play();
      jazz.stop();
      music = true;
      sadJazz.play();
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
        currentRoomNumber= 0;
        respawn();
      }     
       else if (mousePressed == true && mouseX > x && mouseX < x + 100 && (map.get(0).getStatus()||hacks)){
        currentRoomNumber= 1;
        respawn();
      }
       else if (mousePressed == true && mouseX > x * 2 && mouseX < x * 2 + 100 && (map.get(1).getStatus()||hacks)){
        currentRoomNumber= 2;
        respawn();
      }
      else if (mousePressed == true && mouseX > x * 3 && mouseX < x * 3 + 100 && (map.get(2).getStatus()||hacks)){
        currentRoomNumber= 3;
        respawn();
      }
      else if (mousePressed == true && mouseX > x * 4 && mouseX < x * 4 + 100 && (map.get(3).getStatus()||hacks)){
        currentRoomNumber= 4;
        respawn();
      }
      else if (mousePressed == true && mouseX > x * 5 && mouseX < x * 5 + 100 && (map.get(4).getStatus()||hacks)){
        currentRoomNumber= 5;
        respawn();
      }
      else if (mousePressed == true && mouseX > x * 6 && mouseX < x * 6 + 100 && map.get(5).getStatus()){
        currentRoomNumber= 6;
        respawn();
      }
    }
  }
}

public void respawn(){
  player = new Player();
  MODE = WALK;
  sadJazz.stop();
  if (music){
    jazz.play();
    music = false;
  }
}
public void drawSetting(){
  currentRoom = map.get(currentRoomNumber);
  currentRoom.drawRoom();
  player.drawPlayer();
  inventory.drawInventory();
}
