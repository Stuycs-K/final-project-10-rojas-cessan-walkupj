import java.util.*;
private Room currentRoom;

void setup(){
  size(900, 600); 
  square(0,0,150); //each block is 150
  
  currentRoom = new Room(0, "Entrance");
  currentRoom.drawRoom();
}
