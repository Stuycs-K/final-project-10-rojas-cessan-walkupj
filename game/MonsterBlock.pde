class MonsterBlock extends Block{
  private boolean interactable = false;
    private int x, y;
  private PImage image = loadImage("blockImages/monsterBlock.gif"); //will be a gif
  public void attack(){
    
  }
  public MonsterBlock(){
    this.image = image;
  }
  public void drawBlock(int x, int y){
    this.x = x;
    this.y = y;
    image.resize(100, 100); 
    image(image, x, y);
  }
}
