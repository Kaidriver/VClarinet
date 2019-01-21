public class keys {
  
  public float x;
  public float y;
  public int type;
  private float w;
  private float h;
  private int fillcolor = 255;
  private boolean pressed = false;
  
  public keys(float y, float x, int type) {
     this.x = x;
     this.y = y;
     this.type = type;
  }
  //Checks if pressed(rectangle collision)
  boolean isPressed(float mousex, float mousey) {
    /*
    float distance = sqrt(sq(mousex-x)+sq(mousey-y));
    if (h > (distance-10)) {
      return true;
    } else {
      return false;
      
    }
    */
    
    //(mousex < x + w/2 && mousex > x - w/2 && mousey < y+h/2 && mousey > y-h/2)
    if (sq(mousex - x)/((w/2)*(w/2)) + sq(mousey - y)/((h/2)*(h/2)) < 1)  {
        fillcolor = 0;
        return true;
    } else {
        fillcolor = 255;
        return false;
    }
    
  }
 
  
  //Draws out the key
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(fillcolor);
    switch(type) {
    case 2:
      w = 60;
      h = 120;
      break;
    case 3:
      w = 120;
      h = 60;
      break;
    case 4:
    case 5:
      w = 170;
      h = 70;
      break;
    default:
      w = 120; // org: 190
      h = 120;
     
    }
    ellipse(x, y, w, h);
  }
}
