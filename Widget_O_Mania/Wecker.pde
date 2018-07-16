class Wecker{

  int x;
  int y;
  String hourText;
  String minuteText;
  int prevHour;
  int nextHour;
  int prevMin;
  int nextMin;
  int oldMin;
  int remainMin;
  int remainHour;
  TextButton setAlarm;
  TextButton editAlarm;
  TextButton schlummern;
  OnOffButton turnOnAlarm;
  
  Wecker(int x_, int y_) {
    x = x_;
    y = y_;
    setAlarm = new TextButton(x-60,y+80,120,40,"SET ALARM");
    editAlarm = new TextButton(x-60,y+40,120,40,"EDIT ALARM");
    schlummern = new TextButton(x-80,y+40,160,40,"SCHLUMMERN");
    turnOnAlarm = new OnOffButton(x+45,y-120);
  }
  
  boolean isHovered(String area) {
    if (area == "hour") {
      if (mouseX>x-80 && mouseX<x-5 && mouseY>y-80 && mouseY<y+40) {
        return true;
      
      }
    }
    if ( area == "minute") {
      if (mouseX>x-+5 && mouseX<x+800 && mouseY>y-80 && mouseY<y+40) {
        return true;
    }
    }
  return false;
  }
  
  void setWecker() {
    pushStyle();
    alarmKlingeln();
    showRemainingTime();
    if (alarmIsOn) {
      turnOnAlarm.active = true;
    }
    else {
      turnOnAlarm.active = false;
    }
    turnOnAlarm.display();
    if (alarmIsSet) {
      if (!alarmKlingelt) {
      editAlarm.display();
      }
      else if (alarmKlingelt) {
      schlummern.display();
      }
      textFont(Monospace);
      textAlign(CENTER);
      textSize(55);
      //Grosse Anzeige
      fill(255);
      text(numberToString(weckerHour)+":"+numberToString(weckerMinute),x,y);
    }
    
    else {
    //=============Wecker einstellen===========
    //calculate Zeugs
    setAlarm.display();

    weckerHour = constrainNum(weckerHour,24);
    weckerMinute = constrainNum(weckerMinute,60);
    calcAnzeige();
    prevHour = constrainNum(prevHour,24);
    nextHour = constrainNum(nextHour,24);
    
    prevMin = constrainNum(prevMin,60);
    nextMin = constrainNum(nextMin,60);
    
    textFont(Monospace);
    textAlign(CENTER);
    textSize(55);
    //Grosse Anzeige
    fill(255);
    text(numberToString(weckerHour)+":"+numberToString(weckerMinute),x,y);
    //text oben
    fill(200);
    textSize(30);
    text(numberToString(prevHour)+" : "+numberToString(prevMin),x-1,y-50);
    // text unten
    text(numberToString(nextHour)+" : "+numberToString(nextMin),x-1,y+35);
    }    
    popStyle();
  }
  
  String numberToString(int numberToConvert) {
    return nf(numberToConvert,2);
  }
  
  void alarmKlingeln() {
    if (weckerHour != uhr.std || weckerMinute != uhr.min && alarmKlingelt || !alarmIsOn) {
      alarmPlayer.pause();
      alarmPlayer.rewind();
      alarmKlingelt = false;
    }
    if (weckerHour == uhr.std && weckerMinute == uhr.min && alarmIsOn) {
      alarmPlayer.play();
      alarmKlingelt = true;
    }

  }
  
  void showRemainingTime() {
    remainMin = weckerMinute-floor(uhr.min);
    remainHour = weckerHour-uhr.std;
    if (remainMin < 0) {
      remainMin += 60;
    }
    if (weckerMinute > uhr.min && weckerMinute<24) {
      remainMin--;
    }
    if (remainHour <= 0) {
      remainHour += 23;
    }
    if (weckerHour > uhr.std && weckerHour<24) {
      remainHour--;
    }
    pushStyle();
    fill(255);
    textFont(SFproLight_128);
    textSize(14);
    textAlign(CENTER);
    if (!alarmIsSet && alarmIsOn) {
    text(remainHour+"h "+remainMin+"m verbleibend.",x,y+140);
    }
    else if (alarmIsSet && alarmIsOn) {
    text(remainHour+"h "+remainMin+"m verbleibend.",x,y+100);
    }
    popStyle();
  }
  
  void calcAnzeige() {
    prevHour = weckerHour-1;
    nextHour = weckerHour+1;
    
    prevMin = weckerMinute-1;
    nextMin = weckerMinute+1;
  }
  
  int constrainNum(int num, int range) {
    if (num>range-1) {
      if (oldMin == 60) {
      weckerHour++;
      }
      oldMin = weckerMinute;
      return 0;
    }
    if (num<0) {
     if (oldMin == -1) {
      weckerHour--;
     }
      oldMin = weckerMinute;
     return range-1;
    }
    oldMin = weckerMinute;
    return num;
    
  }


}