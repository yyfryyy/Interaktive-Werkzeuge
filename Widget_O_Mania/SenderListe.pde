class SenderListe{

  boolean eingabeAktiv;
  boolean blink;
  int x;
  int y;
  int breite;
  int hoehe;
  String text = "+";
  boolean feedback;
  boolean setTimer;
  int time;
  int senderIndex=0;
  
  SenderListe(int x_, int y_, int breite_, int hoehe_) {
   x = x_;
   y = y_;
   breite = breite_;
   hoehe = hoehe_;
  }
  SenderListe(int x_, int y_, int breite_, int hoehe_, String text_) {
   x = x_;
   y = y_;
   breite = breite_;
   hoehe = hoehe_;
   text = text_;
  }
  
  boolean isHovering() {
    if (mouseX>x && mouseX<x+breite && mouseY>y && mouseY<y+hoehe) {
    return true;
    }
    else {
    return false;
    }
  }
  
  void senderListeDisplay() {
    pushStyle();
    rectMode(CORNER);
    noStroke();
    fill(255,30);
    rect(x,y,breite,hoehe);
    stroke(100);
    line(x,y,x+breite,y);
    line(x,y+hoehe,x+breite,y+hoehe);
    noStroke();
    fill(255);
    textFont(SFproLight_128);
    textSize(22);
    textAlign(LEFT);
    text(senderIndex+".",x+10,y-12+hoehe);
    textAlign(RIGHT);
    textFont(SFproSemiBold_128);
    textSize(22);
    if (isHovering()) {
      fill(200);
    }
    else {
      fill(255);
    }
    text(text,x+breite-10,y-12+hoehe);
   
    if (eingabeAktiv) {
      noStroke();
      fill(255);
      if (blink) {
        rect(x+breite-5,y+33,1,-28);
      }
      if (frameCount%15 ==0) {
        blink = !blink;
      }
    }

    popStyle();
  }
  
  void sucheDisplay() {
    pushStyle();
    rectMode(CORNER);
    noStroke();
    fill(255,30);
    rect(x,y,breite,hoehe,10);
    fill(255);
    textFont(SFproLight_128);
    textSize(28);
    textAlign(LEFT);
    text(text,x+10,y+hoehe-10);
    if (eingabeAktiv) {
      noStroke();
      fill(255);
      if (blink) {
        rect(x+textWidth(text)+15,y+33,1,-28);
      }
      if (frameCount%15 ==0) {
        blink = !blink;
      }
    }
    
    
    if (feedback) {
    feedBack();
    }
    popStyle();
  }
    
    void feedBack() {
     pushStyle();
     if (!setTimer) {
      time = millis();
      setTimer = true;
     }
     if (time+5000 > millis()) {
     noStroke();
     fill(200,0,0);
     textFont(SFproLight_128);
     textSize(28);
     textAlign(LEFT);
     rect(x,y-10,breite,-hoehe,10);
     fill(255);
     text("Kein Sender gefunden", x+10,y-20);
     }
     else {
     setTimer = false;
     feedback = false;
     }
     popStyle();
    }
}