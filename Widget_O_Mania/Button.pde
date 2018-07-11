class Button {

  int x;
  int y;
  int breite;
  int hoehe;
  color col = 100;
  boolean hovered;
  int cornerRadius = 5;
  int targetScreen;
  int displayScreen;
  boolean displayed;
  int maxX = 50;
  int maxY = 40;

  
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
    if (hovered && screenNo == displayScreen) {
      if (function == "changeScreen") {
        changeScreen();
      }
    }
  }
  
  void changeScreen() {
    screenNo = targetScreen;
  }
  

  
}

class IconButton extends Button {
  PImage icon;
  PImage icon2;
  PImage displayedIcon;
  
  int resizeFactor = 10;
  color col = 50;
  color hoverCol = 80;
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_,int displayScreen_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    displayScreen = displayScreen_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_, PImage icon2_,int displayScreen_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    icon2 = icon2_;
    displayScreen = displayScreen_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_,int displayScreen_,  int targetScreen_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    displayScreen = displayScreen_;
    targetScreen = targetScreen_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PImage icon_, PImage icon2_,int displayScreen_, int targetScreen_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    icon2 = icon2_;
    displayScreen = displayScreen_;
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
    displayed = true;
    
    popStyle();
  }
  
  void displayMax() {
    pushStyle();
    displayedIcon = icon2;
    isHovered();
    if (mouseDown()) {
      fill(150);
      if (icon!=null) {
        displayedIcon = icon; 
      }
    }
    else if (hovered) {
      fill(hoverCol);
    }     
    else {
      fill(col);
    }
    noStroke();
    
    
    
    rect(maxX+15,maxY+15,breite,hoehe,cornerRadius);
    displayedIcon.resize(breite-resizeFactor,hoehe-resizeFactor);
    image(displayedIcon,maxX+resizeFactor/2,maxY+resizeFactor/2);
    displayed = true;
    
    popStyle();
  }
  

  
}