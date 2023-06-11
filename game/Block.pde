abstract class Block{
  int row, col;
  
  public abstract void drawBlock(int x, int y);
  
  public abstract int getX();
  
  public abstract int getY();
  
  public abstract boolean isEmpty();
  
  public abstract String type();
}
