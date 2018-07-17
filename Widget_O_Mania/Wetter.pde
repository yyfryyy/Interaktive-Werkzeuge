class Wetter{
  int x;
  int y;
  
  Wetter(int x_,int y_) {
    x = x_;
    y = y_;
  }

  void currentWeather() {
    pushStyle();
    
    textFont(SFproThin_128);
    fill(255);
    noStroke();
    textSize(72);
    text(location,x+45,y+170);
    //textFont(SFproLight_128);
    textSize(26);
    text(day()+". "+uhr.monatsname+" "+year(),x+45,y+210);
    textFont(SFproUltraLight_128);
    textSize(150);
    textAlign(CENTER);
    text(currentTemperature+"°C",x+265,y+400);
    textFont(SFproThin_128);
    textSize(58);
    text(currentWeatherText,x+265,y+530);
    textSize(42);
    textAlign(LEFT);
    text(todayMaxTemp+"°C",x+150,y+455);
    strokeWeight(1);
    strokeCap(PROJECT);
    stroke(255);
    line(x+265,y+455,x+265,y+423);
    textAlign(RIGHT);
    text(todayMinTemp+"°C",x+380,y+455);
    rainProbability(x,y+5);    
    temperaturKurve(day3tempArray, x+100,y+750,450,150,0,30);
    lastUpdateText(x+55,y+570);
    popStyle();
  }
  
  void lastUpdateText(int x_, int y_) {
    pushStyle();
    fill(255);
    textFont(SFproLight_128);
    textSize(14);
    textAlign(LEFT);
    int elapsedMin = minute()-refreshMin;
    if (hour() == refreshHour && elapsedMin<=30) {
      if (elapsedMin == 1) {
        text("Zuletzt aktualisiert vor " + elapsedMin +" Minute",x_, y_);
      }
      else {
      text("Zuletzt aktualisiert vor " + elapsedMin +" Minuten",x_, y_);
      }
    }
    else {
      text("Zuletzt aktualisiert um " + nf(refreshHour,2) + ":" + nf(refreshMin,2)+" Uhr",x_,y_);
    }
    popStyle();
  }
  
  void temperaturKurve(int[] tempArray, int x_, int y_, int breite, int hoehe, int rangeMin, int rangeMax) {
    pushStyle();
    float xPos;
    //rangeMax+=10;
    float yHeight;
    stroke(255,10);
    int startRange = rangeMin;
    for(int i=0; i<=(rangeMax+abs(rangeMin))/10;i++) {
      textSize(8);
      text(startRange+"°C",x_-25,y_-i*(hoehe/((rangeMax+abs(rangeMin))/10))+3);
      line(x_-20,y_-i*(hoehe/((rangeMax+abs(rangeMin))/10)),x_+breite+20,y_-i*(hoehe/((rangeMax+abs(rangeMin))/10)));
      startRange+=10;
  }
    beginShape();
    for (int i=0; i<tempArray.length; i++) {
      xPos = map(i,0,tempArray.length-1,0,breite);
      yHeight = map(tempArray[i],rangeMin,rangeMax,0,hoehe);
      stroke(255,100);
      line(x_+xPos,y_+10,x_+xPos,y_-yHeight);
      stroke(255);
      vertex(x_+xPos,y_-yHeight);
      noStroke();
      fill(255);
      
      textAlign(CENTER);
      textFont(SFproLight_128);
      textSize(14);
      text(daytempTime[i]+":00",x_+xPos,y_+30);
      textFont(SFproLight_128);
      if(mouseX>x_+xPos-10 && mouseX<x_+xPos+10 && mouseY>y_-yHeight-20 && mouseY<y_-yHeight+10) {
      textSize(16);
      text(tempArray[i]+"°C",x_+xPos,y_-yHeight-10);
      ellipse(x_+xPos,y_-yHeight,15,15);
      }
      else {
      textSize(10);
      text(tempArray[i]+"°C",x_+xPos,y_-yHeight-10);
      ellipse(x_+xPos,y_-yHeight,10,10);
      }
      stroke(255);
      noFill();
    }
    endShape();
    popStyle();
  }
  
  void rainProbability(int x_, int y_) {
    pushStyle();
    waterDropIcon.disableStyle();
    dayIcon.disableStyle();
    nightIcon.disableStyle();
    currentWeatherIcon.disableStyle();
    shape(currentWeatherIcon,x_+340,y_+50,350,350);
    shape(waterDropIcon,x_+410,y_+492,40,40);
    textAlign(CENTER);
    textFont(SFproLight_128);
    textSize(32);
    text(todayWeatherRainProbDay+"%",x_+490,y_+524);
    shapeMode(CENTER);
    shape(dayIcon,x_+490,y_+470,36,36);
    shape(nightIcon,x_+574,y_+470,40,40);
    line(x_+532,y_+523,x_+532,y_+500);
    text(todayWeatherRainProbNight+"%",x_+574,y_+524);
    popStyle();
  }
  
}