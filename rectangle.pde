public class Rectangle {
  private float xAxe;
  private float yAxe;
  private float rectWidth;
  private float rectHeight;

  public Rectangle(float x, float y, float rectWidth, float rectHeight) {
    this.xAxe = x;
    this.yAxe = y;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
  }
  public float getx(){
    return xAxe;
  }
  public float gety(){
    return yAxe;
  }
  public float getWidth(){
    return rectWidth;
  }
  public float getHeight(){
    return rectHeight;
  }
}
