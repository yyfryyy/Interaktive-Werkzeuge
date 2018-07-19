class Uhr {

  int sec;
  int min;
  int std;
  
  float angleStd;
  float angleMin;
  float angleSec;
  float angleWeckerStd;
  float angleWeckerMin;
  
  
  String uhrzeit;
  
  int day;
  int month;
  int year;
  String tagesname;
  String monatsname;
  
  int x;
  int y;
  
  int radius;
  
  Uhr (int x_,int y_, int radius_){
    x = x_;
    y = y_;
    radius = radius_;
  }
  
  void updateClock() {
    sec = second();
    min = minute();
    std = hour();
    
    day = day();
    month = month();
    year = year();
    
    tagesname = new SimpleDateFormat("EEEE").format(new Date());
    monatsname = new SimpleDateFormat("MMMM").format(new Date());
    //println(tagesname);
  }
  
  void digital() {
    pushStyle();
    
    uhrzeit = nf(std,2)+":"+nf(min,2);
    textAlign(CENTER);
    textFont(SFproUltraLight_128);
    textSize(128);
    //fill(40);
    //text("00:00:00",x,y);
    fill(255);
    text(uhrzeit,x,y);
    popStyle();
    //println(uhrzeit);
    showDate(x,y+40);
  }
  
  void digital(float scale) {
    pushStyle();
    pushMatrix();
    scale(scale);
    uhrzeit = nf(std,2)+":"+nf(min,2);
    textAlign(CENTER);
    textFont(SFproUltraLight_128);
    textSize(128);
    //fill(40);
    //text("00:00:00",x,y);
    fill(255);
    text(uhrzeit,x,y);
    showDate(x,y+40);
    popMatrix();
    popStyle();
    //println(uhrzeit);
    
  }  

  
  void smallDigital(int x_, int y_) {
    pushStyle();    
    uhrzeit = nf(std,2)+":"+nf(min,2);
    textAlign(LEFT);
    textFont(SFproThin_128);
    textSize(80);
    //fill(40);
    //text("00:00:00",x,y);
    fill(255);
    text(uhrzeit,x_+20,y_);
    textFont(SFproUltraLight_128);
    textSize(40);
    text(nf(sec,2),x_+textWidth(uhrzeit)+120,y_-28);
    textSize(36);
    text(weckerHour+":"+nf(weckerMinute,2),x_+390,y_);
    popStyle();
  }
  
  void analog() {
    
    pushMatrix();
    pushStyle();
    translate(x,y-40);
    updateClock();
    fill(255);
    stroke(0);
    ellipse(0,0,radius*2,radius*2);
    //===========Stundenstriche==============
    for (int i = 0; i<= 12; i++) {
      pushMatrix();
      rotate(map(i,0,12,0,TWO_PI));
      translate(0,-radius+5);
      strokeCap(CORNER);
      strokeWeight(6);
      line(0,0,0,25);
      popMatrix();
    }
    
    //===========Minutenstriche==============
    for (int i = 0; i<= 60; i++) {
      pushMatrix();
      rotate(map(i,0,60,0,TWO_PI));
      translate(0,-radius+5);
      strokeCap(CORNER);
      strokeWeight(4);
      line(0,0,0,10);
      popMatrix();
    }
    
    //==============Weckerzeiger==============
    pushStyle();
    angleWeckerStd = map(weckerHour+norm(weckerMinute,0,60),0,24,0,4*PI);
    angleWeckerStd -= HALF_PI;
    strokeWeight(3);
    stroke(0,200,0);
    line(0,0,radius*0.5*cos(angleWeckerStd),radius*0.5*sin(angleWeckerStd));
    line(0,0,-radius*0.15*cos(angleWeckerStd),-radius*0.15*sin(angleWeckerStd));
    popStyle();
    //==============Stundenzeiger==============
    angleStd = map(std+norm(min,0,60),0,24,0,4*PI);
    angleStd -= HALF_PI;
    strokeWeight(10);
    line(0,0,radius*0.6*cos(angleStd),radius*0.6*sin(angleStd));
    line(0,0,-radius*0.2*cos(angleStd),-radius*0.2*sin(angleStd));
    
    
    //==============Minutenzeiger==============
    angleMin = map(min+norm(sec,0,60),0,60,0,TWO_PI);
    angleMin -= HALF_PI;
    strokeWeight(7);
    line(0,0,radius*0.8*cos(angleMin),radius*0.8*sin(angleMin));
    line(0,0,-radius*0.2*cos(angleMin),-radius*0.2*sin(angleMin));
    
    //==============Sekundenzeiger==============
    angleSec = map(sec,0,60,0,TWO_PI);
    angleSec -= HALF_PI;
    strokeWeight(3);
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(0,0,8,8);
    line(0,0,radius*0.7*cos(angleSec),radius*0.7*sin(angleSec));
    line(0,0,-radius*0.2*cos(angleSec),-radius*0.2*sin(angleSec));
    ellipse(radius*0.7*cos(angleSec),radius*0.7*sin(angleSec),20,20);
    
    popStyle();
    popMatrix();
    
    showDate(x,y+120);
  }

  void analog(float scale) {
    
    pushMatrix();
    pushStyle();   
    scale(scale);
    translate(x,y-40);
    fill(255);
    stroke(0);
    ellipse(0,0,radius*2,radius*2);
    //===========Stundenstriche==============
    for (int i = 0; i<= 12; i++) {
      pushMatrix();
      rotate(map(i,0,12,0,TWO_PI));
      translate(0,-radius+5);
      strokeCap(CORNER);
      strokeWeight(6);
      line(0,0,0,25);
      popMatrix();
    }
    
    //===========Minutenstriche==============
    for (int i = 0; i<= 60; i++) {
      pushMatrix();
      rotate(map(i,0,60,0,TWO_PI));
      translate(0,-radius+5);
      strokeCap(CORNER);
      strokeWeight(4);
      line(0,0,0,10);
      popMatrix();
    }
    
    //==============Weckerzeiger==============
    pushStyle();
    angleWeckerStd = map(weckerHour+norm(weckerMinute,0,60),0,24,0,4*PI);
    angleWeckerStd -= HALF_PI;
    strokeWeight(3);
    stroke(0,200,0);
    line(0,0,radius*0.5*cos(angleWeckerStd),radius*0.5*sin(angleWeckerStd));
    line(0,0,-radius*0.15*cos(angleWeckerStd),-radius*0.15*sin(angleWeckerStd));
    popStyle();
    //==============Stundenzeiger==============
    angleStd = map(std+norm(min,0,60),0,24,0,4*PI);
    angleStd -= HALF_PI;
    strokeWeight(10);
    line(0,0,radius*0.6*cos(angleStd),radius*0.6*sin(angleStd));
    line(0,0,-radius*0.2*cos(angleStd),-radius*0.2*sin(angleStd));
    
    
    //==============Minutenzeiger==============
    angleMin = map(min+norm(sec,0,60),0,60,0,TWO_PI);
    angleMin -= HALF_PI;
    strokeWeight(7);
    line(0,0,radius*0.8*cos(angleMin),radius*0.8*sin(angleMin));
    line(0,0,-radius*0.2*cos(angleMin),-radius*0.2*sin(angleMin));
    
    //==============Sekundenzeiger==============
    angleSec = map(sec,0,60,0,TWO_PI);
    angleSec -= HALF_PI;
    strokeWeight(3);
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(0,0,8,8);
    line(0,0,radius*0.7*cos(angleSec),radius*0.7*sin(angleSec));
    line(0,0,-radius*0.2*cos(angleSec),-radius*0.2*sin(angleSec));
    ellipse(radius*0.7*cos(angleSec),radius*0.7*sin(angleSec),20,20);
    
    popStyle();
    popMatrix();
    showDate(x+130,y+300);
    
  }

  void showDate(int xOff, int yOff) {
    pushStyle();
    textFont(SFproLight_128);
    textSize(24);
    fill(255);
    String datum = tagesname +", der " +nf(day,2)+"."+nf(month,2)+"."+nf(year,4);
    //println(datum);
    textAlign(CENTER);
    text(datum,xOff,yOff);
    popStyle();
  }

}

class switchButton extends Button {
  
  PShape icon;
  PShape icon2;
  String switchText;
  
  switchButton(int x_,int y_, int breite_, int hoehe_, PShape icon_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    active = clockActive;
    icon = icon_;
    icon2 = icon_;
  }
  
  switchButton(int x_,int y_, int breite_, int hoehe_, PShape icon_, String text_) {
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    active = clockActive;
    icon = icon_;
    switchText = text_;
  }
  
  void display() {
    pushStyle();
    rectMode(CORNER);
    stroke(255);
    noFill();
    isHovered();
    strokeWeight(3);
    rect(x,y,breite,hoehe,3);
    fill(255);

    if (!active) {

    // Linke Füllung
    rect(x,y,breite/2,hoehe,3,0,0,3);
    
    // Clock dark
    icon.disableStyle();
    fill(50);
    noStroke();
    shape(icon,x+8,y+6,hoehe-12,hoehe-12);
    // Text White
    textFont(SFproBold_128);
    textSize(10);
    
    fill(255);
    text(switchText,x+breite/2+3,y+hoehe/2+4);
    }
    else {
    // Rechte Füllung
    rect(x+breite/2,y,breite/2,hoehe,0,3,3,0);
    // Clock white
    icon.disableStyle();
    fill(255);
    noStroke();
    shape(icon,x+8,y+6,hoehe-12,hoehe-12);
    // Text Dark
    textFont(SFproBold_128);
    textSize(10);
    fill(50);
    text(switchText,x+breite/2+3,y+hoehe/2+4);
    }
    popStyle();
  }
  



}