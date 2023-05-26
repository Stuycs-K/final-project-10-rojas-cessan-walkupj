class WaterBlock extends Block{
  private PImage image = loadImage("blockImages/waterBlock.png");
  public void drown(){
    
  }
  public void drawBlock(int x, int y){
    image.resize(100, 100); 
    image(image, x, y);
  }
}
