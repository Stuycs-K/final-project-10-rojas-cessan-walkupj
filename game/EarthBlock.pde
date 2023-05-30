class EarthBlock extends Block{
  private PImage image = loadImage("blockImages/earthBlock.jpg");
  public EarthBlock(){
    this.image = image;
  }
  public void drawBlock(int x, int y){
    image(image, x, y, 100, 100);
  }
}
