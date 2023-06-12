class Map{
  private ArrayList<Room> timeline;
  //private String name; opt if multiple maps

   public Map(){
     timeline = new ArrayList<Room>();
     timeline.add(new Room(0));
     timeline.add(new Room(1));
     timeline.add(new Room(2));
     timeline.add(new Room(3));
     timeline.add(new Room(4));
     timeline.add(new Room(5));
     timeline.add(new Room(6));
     timeline.add(new Room(7));
   }
   
   
   public Room get (int index){
     return timeline.get(index);
   }
   
   public int size(){
     return timeline.size();
   }
   
   public void drawMap(){
     background(0);
     for (Room room : timeline){
        room.drawRoomMap();
     }
     textSize(100);
     fill(255);
     text("Map", 10, 70);
   }
   
  
   
}
