class Map{
  private PriorityQueue<Room> timeline;
  //private String name; opt if multiple maps

   public Map(){
     timeline = new PriorityQueue<Room>();
   }
   public void drawMap(){
     background(0);
     fill(255);
     stroke(255);
     circle(300, 300, 100);
     circle(600, 150, 100);
     circle(600, 500, 100);
     line(300, 300, 600, 150);
     line(300, 300, 600, 500);
   }
   
}
