class Button {

  int x;
  int y;
  int breite;
  int hoehe;
  color col = 100;
  boolean hovered;
  int cornerRadius = 10;

  

  
  void isHovered() {
  
    if (mouseX>=x && mouseX<=x+breite && mouseY>=y && mouseY<=y+hoehe) {
      hovered = true;
    } 
    else {
      hovered = false;
    }
    
  }
  
}

class IconButton extends Button {
  PImage icon;
  int resizeFactor = 18;
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
  }
  
  void display() {
    pushStyle();

    isHovered();
    if (hovered) {
      fill(255,0,0);
    }
    else {
      fill(col);
    }
    noStroke();
    
    
    rect(x,y,breite,hoehe,cornerRadius);
    icon.resize(breite-resizeFactor,hoehe-resizeFactor);
    image(icon,x+resizeFactor/2,y+resizeFactor/2);
    
    
    popStyle();
  }
  
}