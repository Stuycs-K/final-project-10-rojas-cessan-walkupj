class BridgeBlock extends Block{
  private PImage image = loadImage("blockImages/bridgeBlock.jpg");
  public void drawBlock(int x, int y){
    image.resize(100, 100); 
    image(image, x, y);
  }
}
