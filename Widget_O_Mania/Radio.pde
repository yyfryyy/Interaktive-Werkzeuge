class Radio{

  int x;
  int y;
  String songtitle;
  String interpret;
  String radioName;
  String album;

  
  ToggleButton playButton;
  IconButton forwardButton;
  IconButton backwardButton;
  
  Radio(int x_, int y_) {
  
    x = x_;
    y = y_;
    playButton = new ToggleButton(x,y,80,80,playIcon,pauseIcon);
    forwardButton = new IconButton(x+100,y+20,40,40,forwardIcon);
    backwardButton = new IconButton(x-60,y+20,40,40,backwardIcon);
  }
  
  void steuerungSmall() {
    
    playButton.display();
    forwardButton.displayNoBG();
    backwardButton.displayNoBG();
    songInfo();
  }
  
  void songInfo() {
    
    radioName = sender.getString("name");
    songtitle = meta.title();
    interpret = meta.author();
    album = meta.album();
    
    pushStyle();
    fill(255);
    textAlign(CENTER);
    textFont(SFproBold_128);
    textSize(72);
    text(radioName,x+40,y-110);
    textFont(SFproSemiBold_128);
    textSize(22);
    text(songtitle,x+40,y-60);
    textFont(SFproLight_128);
    textSize(18);
    text(interpret + " - " + album, x+40,y-35);
    popStyle();
  }
  

}

class ToggleButton extends Button {
    
    PShape icon;
    PShape icon2;
    
    PShape displayedIcon;
  
    int resizeFactor = 10;
    color col = 255;
    color hoverCol = 230;
    
    ToggleButton(int x_,int y_, int breite_, int hoehe_, PShape icon_, PShape icon2_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    icon2 = icon2_;
  }
  
    void display() {
    pushStyle();
    if (active) {
    displayedIcon = icon2;
    }
    else {
    displayedIcon = icon; 
    }
    isHovered();
    if (mouseDown()) {
      fill(hoverCol-30);
    }
    else if (hovered) {
      fill(hoverCol);
    }     
    else {
      fill(col);
    }
    noStroke();
    
    //println("FOR FUCKS SAKE");
    //text("FUCK",200,200);
    displayedIcon.disableStyle();
    shape(displayedIcon,x,y,breite-resizeFactor,hoehe-resizeFactor);
    //rect(x,y,breite,hoehe,cornerRadius);
    
    //displayedIcon.resize(breite-resizeFactor,hoehe-resizeFactor);
    //image(displayedIcon,x+resizeFactor/2,y+resizeFactor/2);
    
    
    popStyle();
  }
  
  
}