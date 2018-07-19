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
  favoriteButton favButton;
  VolumeSlider volumeSlider;
  
  Radio(int x_, int y_) {
  
    x = x_;
    y = y_;
    playButton = new ToggleButton(x,y,80,80,playIcon,pauseIcon);
    forwardButton = new IconButton(x+100,y+20,40,40,forwardIcon);
    backwardButton = new IconButton(x-60,y+20,40,40,backwardIcon);
    favButton = new favoriteButton(x-140,y+20,40,40,favIcon,noFavIcon);
    volumeSlider = new VolumeSlider(x+220,y+35, 100);
  }
  
  void steuerungMain() {
    if (isPlaying) {
    playButton.active = true;
    }
    else {
    playButton.active = false;
    }
    playButton.display();

    forwardButton.displayNoBG();
    backwardButton.displayNoBG();
    favButton.display();
    volumeSlider.display();
    songInfoMain();
  }
  
    
  void steuerungSmall() {
    if (isPlaying) {
    playButton.active = true;
    }
    else {
    playButton.active = false;
    }
    playButton.display();

    forwardButton.displayNoBG();
    backwardButton.displayNoBG();
    favButton.display();
    volumeSlider.display();
    songInfoSmall();
  }
  
  void songInfoMain() {
    
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
  
  void songInfoSmall() {
    
    radioName = sender.getString("name");
    songtitle = meta.title();
    interpret = meta.author();
    album = meta.album();
    
    pushStyle();
    fill(255);
    textAlign(CENTER);
    textFont(SFproBold_128);
    textSize(24);
    text(radioName,x+35,y-10);
    //textFont(SFproSemiBold_128);
    //textSize(22);
    //text(songtitle,x+40,y-60);
    //textFont(SFproLight_128);
    //textSize(18);
    //text(interpret + " - " + album, x+40,y-35);
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
    
    ToggleButton() {}
    
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
      fill(200);
    }
    else if (hovered) {
      fill(255);
    }     
    else {
      fill(220);
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
  class favoriteButton extends ToggleButton{
    
    boolean isFavorite;

        favoriteButton(int x_,int y_, int breite_, int hoehe_, PShape icon_, PShape icon2_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    icon2 = icon2_;
  }
    
    void display() {
      pushStyle();
      isFavorite = checkIfFav();
      if (isFavorite) {
      displayedIcon = icon;
      }
      else {
      displayedIcon = icon2; 
      }
      isHovered();
      if (mouseDown()) {
        fill(200);
      }
      else if (hovered) {
        fill(255);
      }     
      else {
        fill(220);
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
    
    boolean checkIfFav() {
    
      return sender.getBoolean("isFavorite");
      
    }

  }
  
  class VolumeSlider{
  
    int x;
    int y;
    int len;
    float pixelVolume;
    boolean hovered;
    VolumeIcon volumeIcon;
    
    VolumeSlider(int x_, int y_, int len_) {
      x = x_;
      y = y_;
      len = len_;
      realToPixel();
      volumeIcon = new VolumeIcon(x-40,y-10,20,20);
    }
    
    void realToPixel() {
      pixelVolume = map(realVolume,0,1,0,len);
    }
    
    void pixelToReal() {
      realVolume = map(pixelVolume,0,len,0,1);
    }
    
    void isHovered() {
  
      if (mouseX>=x-10 && mouseX<=x+len+5 && mouseY>=y-20 && mouseY<=y+20) {
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
    
    void display() {
      
      volumeIcon.display();
      
      pushStyle();    
      isHovered();      
      stroke(150);
      strokeCap(ROUND);
      strokeWeight(6);
      stroke(100);
      line(x,y,x+len,y+0);
      if (!hovered && !muted) {
      stroke(150);
      }
      else if (!muted) {
      stroke(0,200,0);
      
      }
      if (mouseDown()) {
      pixelVolume = mouseX-x;
      pixelVolume = constrain(pixelVolume,0,len);
      }
      line(x,y,x+pixelVolume,y+0);
      if (hovered) {
      fill(255);
      noStroke();
      ellipse(x+pixelVolume,y,20,20);
      }
      if (mouseDown()) {
      fill(220);
      ellipse(x+pixelVolume,y,10,10);
      }
      pixelToReal();
      if (realVolume < 0.02) {
        player.mute();
        muted = true;
        //text("mute",x,y-100);
      }
      else if (muted) {
        player.unmute();
        muted = false;
      }
      //text(realVolume,x,y-50);
      popStyle();
    }
  
  }
  
  class VolumeIcon extends Button{
    
    PShape displayedIcon;
  
    VolumeIcon (int x_,int y_, int breite_, int hoehe_) {
      x = x_;
      y = y_;
      breite = breite_;
      hoehe = hoehe_;
      mutedIcon = loadShape("mute.svg");
      halfVolumeIcon = loadShape("half-volume.svg");
      fullVolumeIcon = loadShape("full-volume.svg");
    }
    
    void display() {
      pushStyle();
      if (realVolume <= 0.02) {
      displayedIcon = mutedIcon;
      }
      else if (realVolume <= 0.5) {
      displayedIcon = halfVolumeIcon; 
      }
      else {
      displayedIcon = fullVolumeIcon;
      }
      
      isHovered();
      if (mouseDown()) {
        fill(200);
      }
      else if (hovered) {
        fill(255);
      }     
      else {
        fill(220);
      }
      noStroke();
      
      //println("FOR FUCKS SAKE");
      //text("FUCK",200,200);
      displayedIcon.disableStyle();
      shape(displayedIcon,x,y,breite,hoehe);
      //rect(x,y,breite,hoehe,cornerRadius);
      
      //displayedIcon.resize(breite-resizeFactor,hoehe-resizeFactor);
      //image(displayedIcon,x+resizeFactor/2,y+resizeFactor/2);
      
      
      popStyle();
    }
    
  }