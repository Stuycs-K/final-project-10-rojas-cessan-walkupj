public class Inventory{
  private Block[] inventory; 
  private Block[] initinventory;
  
  public Inventory(){
    inventory = new Block[width/100];
    initinventory = new Block[width/100];
  }
  
  public Inventory(Block a, Block b, Block c, Block d, Block e, Block f, Block g, Block h, Block i, Block j){
    inventory = new Block[width/100];
    initinventory = new Block[width/100];
    inventory[0] = a;
    inventory[1] = b;
    inventory[2] = c;
    inventory[3] = d;
    inventory[4] = e;
    inventory[5] = f;
    inventory[6] = g;
    inventory[7] = h;
    inventory[8] = i;
    inventory[9] = j;
    
    initinventory[0] = a;
    initinventory[1] = b;
    initinventory[2] = c;
    initinventory[3] = d;
    initinventory[4] = e;
    initinventory[5] = f;
    initinventory[6] = g;
    initinventory[7] = h;
    initinventory[8] = i;
    initinventory[9] = j;
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
  
  public Block getItem(int i){
    return inventory[i];
  }
  
  public void drawInventoryContents(){
    for(int i = 0; i < inventory.length; i++){
      if(inventory[i] != null){
        inventory[i].drawBlock(i*100, 550);
      }
    }
  }
  
  public void emptyInventory(){
    for(int i = 0; i < inventory.length; i++){
      inventory[i] = null;
    }
  }
  
  public void setupInventory(Block a, Block b, Block c, Block d, Block e, Block f, Block g, Block h, Block i, Block j){
    inventory[0] = a;
    inventory[1] = b;
    inventory[2] = c;
    inventory[3] = d;
    inventory[4] = e;
    inventory[5] = f;
    inventory[6] = g;
    inventory[7] = h;
    inventory[8] = i;
    inventory[9] = j;
    
    initinventory[0] = a;
    initinventory[1] = b;
    initinventory[2] = c;
    initinventory[3] = d;
    initinventory[4] = e;
    initinventory[5] = f;
    initinventory[6] = g;
    initinventory[7] = h;
    initinventory[8] = i;
    initinventory[9] = j;
  }
  
  public void resetInventory(){    
    inventory[0] = initinventory[0];
    inventory[1] = initinventory[1];
    inventory[2] = initinventory[2];
    inventory[3] = initinventory[3];
    inventory[4] = initinventory[4];
    inventory[5] = initinventory[5];
    inventory[6] = initinventory[6];
    inventory[7] = initinventory[7];
    inventory[8] = initinventory[8];
    inventory[9] = initinventory[9];
  }
  
}
