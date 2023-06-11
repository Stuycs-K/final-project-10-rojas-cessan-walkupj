class Map{
  private ArrayList<Room> timeline;
  public int value0 = 255;
  public int value1 = 255;
  public int value2 = 255;
  //private String name; opt if multiple maps

   public Map(){
     timeline = new ArrayList<Room>();
     add(new Room(0));
     add(new Room(1));
     add(new Room(2));
     add(new Room(3));
     add(new Room(4));
   }
   
   public void add(Room room){
     timeline.add(room);
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
     text("Map", 10, 70);
   }
   
  
   
}
