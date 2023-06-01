class WaterBlock extends Block{
  private boolean interactable = false;
    private int x, y;
  private PImage image = loadImage("blockImages/waterBlock.png");
  public WaterBlock(){
    this.image = image;
  }
  public void drown(){
    
  }
  public void drawBlock(int x, int y){
    this.x = x;
    this.y = y;
    image.resize(100, 100); 
    image(image, x, y);
  }
  public int getX(){
    return this.x;
  }
  public int getY(){
    return this.y;
  }
  public boolean isEmpty(){
    return false;
  }
}
