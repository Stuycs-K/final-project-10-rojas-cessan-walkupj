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
  public int getX(){
    return this.x;
  }
  public int getY(){
    return this.y;
  }
  public boolean isEmpty(){
    return false;
  }
  public String type(){
    return "Earth";
  }
}
