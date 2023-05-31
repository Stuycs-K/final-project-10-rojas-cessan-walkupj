class StairBlock extends Block{
  private boolean interactable = true;
    private int x, y;
  private PImage image = loadImage("blockImages/stairBlock.jpg");
  private int space;
  public StairBlock(){
    this.image = image;
  }
  public void use(){

  }
  public void destroy(){

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
}
