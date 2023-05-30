class EarthBlock extends Block{
  private boolean interactable = false;
    private int x, y;
  private PImage image = loadImage("blockImages/earthBlock.jpg");
  public EarthBlock(){
    this.image = image;
  }
  public void drawBlock(int x, int y){
    this.x = x;
    this.y = y;
    image(image, x, y, 100, 100);
  }
}
