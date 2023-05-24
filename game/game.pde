import java.util.*;
private Room currentRoom;
private Inventory inventory;

void setup(){
  size(1000, 650); 
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
  
  
  currentRoom = new Room(0, "Tutorial");
  currentRoom.drawRoom();
  inventory = new Inventory();
  inventory.drawInventory();
  
}
