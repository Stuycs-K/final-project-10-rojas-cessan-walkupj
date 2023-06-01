abstract class Block{
  int row, col;
  boolean interactable;
  
  public abstract void drawBlock(int x, int y);
  
  public abstract int getX();
  
  public abstract int getY();
}
