public class Inventory{
  private int totalSpace;
  private Block[] inventory; 
  
  public Inventory(){
    inventory = new Block[width/100];
  }
  
  public void drawInventory(){ //placeholder for image?
    fill(225, 200, 255);
    rect(0, 500, 1000, 150);
    fill(0);
    textSize(20);
    text("INVENTORY", 20, 530);
    drawInventoryContents();
  }
  
  public void addToInventory(Block b, int i){
    inventory[i] = b;
  }
  
  public void removeFromInventory(int i){
    inventory[i] = null;
  }
  
  public void drawInventoryContents(){
    for(int i = 0; i < inventory.length; i++){
      if(inventory[i] != null){
        inventory[i].drawBlock(i*100, 550);
      }
    }
  }
  
}
