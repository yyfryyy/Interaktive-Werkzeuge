class Button {

  int x;
  int y;
  int breite;
  int hoehe;
  color col = 100;
  boolean hovered;
  int cornerRadius = 5;
  int targetScreen;
  

  
  void isHovered() {
  
    if (mouseX>=x && mouseX<=x+breite && mouseY>=y && mouseY<=y+hoehe) {
      hovered = true;
    } 
    else {
      hovered = false;
    }
    
  }
  
  boolean mouseDown() {
    if (mousePressed && hovered) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void clicked(String function) {
    if (hovered) {
      if (function == "changeScreen") {
        changeScreen();
      }
    }
  }
  
  void changeScreen() {
    screenNo = targetScreen;
    hovered = false;
  }
  
}

class IconButton extends Button {
  PImage icon;
  PImage icon2;
  PImage displayedIcon;
  
  int resizeFactor = 10;
  color col = 70;
  color hoverCol = 100;
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_, PImage icon2_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    icon2 = icon2_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_, int targetScreen_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    targetScreen = targetScreen_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_, PImage icon2_, int targetScreen_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    icon2 = icon2_;
    targetScreen = targetScreen_;
  }  
  void display() {
    pushStyle();
    displayedIcon = icon;
    isHovered();
    if (mouseDown()) {
      fill(150);
      if (icon2!=null) {
        displayedIcon = icon2; 
      }
    }
    else if (hovered) {
      fill(hoverCol);
    }     
    else {
      fill(col);
    }
    noStroke();
    
    
    
    rect(x,y,breite,hoehe,cornerRadius);
    displayedIcon.resize(breite-resizeFactor,hoehe-resizeFactor);
    image(displayedIcon,x+resizeFactor/2,y+resizeFactor/2);
    
    
    popStyle();
  }
  
}