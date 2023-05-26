class DoorBlock extends Block{
  private PImage image = loadImage("blockImages/doorBlock.jpg");
  public void teleport(){
  }
  public void drawBlock(int x, int y){
    image.resize(100, 100); 
    image(image, x, y);
  }
}
