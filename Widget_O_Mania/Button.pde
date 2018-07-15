class Button {

  int x;
  int y;
  int breite;
  int hoehe;
  color col = 100;
  boolean hovered;
  int cornerRadius = 5;
  int targetScreen;
  boolean active;  

  
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
      if (function == "switchState") {
        switchState();
      }
      if (function == "play/pause") {
        playPause();
      }
      if (function == "forward") {
        senderForward();
      }
      if (function == "backward") {
        senderBackward();
      }
      if (function == "mute/unmute") {
        muteUnmute();
      }
    }
  }
  
  void changeScreen() {
    screenNo = targetScreen;
    //init = false;
    hovered = false;
  }
  
  void switchState() {
    active = !active;
    clockActive = active;
  }
  
  void playPause() {
    if (player.isPlaying()) {
      player.pause();
      isPlaying = false;
    }
    else {
      player.play();
      isPlaying = true;
    }
    active = !active;
  }
  
  void senderForward() {
    player.pause();
    senderIndex++;
    if (senderIndex>senderArray.size()-1) {
    senderIndex = 0;
    }
    //println(senderIndex);
    sender = senderArray.getJSONObject(senderIndex);
    playlist = sender.getJSONArray("songs");
    songIndex = floor(random(playlist.size()));
    song = playlist.getString(songIndex);
    player = minim.loadFile(song);
    meta = player.getMetaData();
    if (radioSteuerung.playButton.active) {
    player.play();
    }
  }
  
  void senderBackward() {
    player.pause();
    senderIndex--;
    if (senderIndex<0) {
    senderIndex = senderArray.size()-1;
    }
    //println(senderIndex);
    sender = senderArray.getJSONObject(senderIndex);
    playlist = sender.getJSONArray("songs");
    songIndex = floor(random(playlist.size()));
    song = playlist.getString(songIndex);
    player = minim.loadFile(song);
    meta = player.getMetaData();
    if (radioSteuerung.playButton.active) {
    player.play();
    }
  }
  
  void muteUnmute() {
    if (!muted) {
      oldVolume = radioSteuerung.volumeSlider.pixelVolume;
      radioSteuerung.volumeSlider.pixelVolume = 0;
      player.mute();
      muted = true;
    }
    else if (muted) {
      radioSteuerung.volumeSlider.pixelVolume = oldVolume;
      player.unmute();
      muted = false;
    }
  }
}

class IconButton extends Button {
  PShape icon;
  PShape icon2;
  PShape displayedIcon;
  
  int resizeFactor = 10;
  color col = 70;
  color hoverCol = 100;
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PShape icon_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PShape icon_, PShape icon2_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    icon2 = icon2_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PShape icon_, int targetScreen_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    icon = icon_;
    targetScreen = targetScreen_;
  }
  
  IconButton (int x_,int y_, int breite_, int hoehe_, PShape icon_, PShape icon2_, int targetScreen_) {
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
      fill(200);
      if (icon2!=null) {
        displayedIcon = icon2; 
      }
    }
    else if (hovered) {
      fill(255);
    }     
    else {
      fill(220);
    }
    noStroke();
    
    
    
    rect(x,y,breite,hoehe,cornerRadius);
    //displayedIcon.resize(breite-resizeFactor,hoehe-resizeFactor);
    displayedIcon.disableStyle();
    fill(255);
    shape(displayedIcon,x+resizeFactor/2,y+resizeFactor/2,breite-resizeFactor,hoehe-resizeFactor);
    
    
    popStyle();
  }
  
  void displayNoBG() {
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