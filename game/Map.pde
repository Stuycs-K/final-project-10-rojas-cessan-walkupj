class Map{
  private Room[] timeline;
  public int value0 = 255;
  public int value1 = 255;
  public int value2 = 255;
  //private String name; opt if multiple maps

   public Map(){
     timeline = new Room[3];
   }
   public void drawMap(){
     background(0);
     for (int i = 0; i < 3; i ++){
        drawRoomMap(i);
     }
   }
   
   public void drawRoomMap(int n){
      if (n == 0){
         stroke(255);
         fill(value0);
         circle(100, 250, 100);
      }
      if (n == 1){
         stroke(255);
         fill(value1);
         circle(250, 100, 100);
      }
      if (n == 2){
         stroke(255);
         fill(value2);
         circle(250, 400, 100);
      }
   }
   
}
