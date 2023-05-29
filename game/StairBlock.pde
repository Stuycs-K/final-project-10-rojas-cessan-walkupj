class StairBlock extends Block{
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
    image.resize(100, 100); 
    image(image, x, y);
  }
}
