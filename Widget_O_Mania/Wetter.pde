class Wetter{
  int x;
  int y;
  int dayNo = 1;
  
  IconButton refreshButton;
  
  Wetter(int x_,int y_) {
    x = x_;
    y = y_;
  }
  
  void wetterForecastDisplay() {
    pushStyle();
    //Current Weather
    textFont(SFproThin_128);
    fill(255);
    noStroke();
    textSize(72);
    text(location,x+45,y+170);
    textSize(26);
    text(nf(day(),2)+". "+uhr.monatsname+" "+year(),x+45,y+210);
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
    currentWeatherIcon.disableStyle();
    shape(currentWeatherIcon,x+260,y+35,300,300);
    // Forecast
    stroke(255,100);
    line(x+wetterMax.breite/2-100,y+50,x+wetterMax.breite/2-100,y+wetterMax.hoehe-50);
    //stroke(255);
    textAlign(LEFT);
    textFont(SFproBold_128);
    textSize(42);
    text("5-Tage-Trend",x+620,y+90);
    textFont(SFproThin_128);
    textSize(28);
    rectMode(CORNERS);
    text(forecastHeadline,x+620,y+110,x+1100,y+310);
    pushStyle();
    rectMode(CORNER);
    noStroke();
    fill(255,40);
    rect(x+620,y+400,665,200);
    popStyle();
    

    for (int i=1;i<=5;i++) {
      if (dayNo == i) {
        pushStyle();
        rectMode(CORNER);
        fill(255,40);
        noStroke();
        rect(x+620+(800/6)*(i-1),y+250,800/6,150);
        popStyle();
      }
    }
    line(x+620,y+250,x+620,y+600);
    line(x+620+666,y+250,x+620+665,y+600);
    for (int i=800/6; i<800-800/6-100; i+=800/6){
      line(x+620+i,y+250,x+620+i,y+400);
    }

    PShape tempIcon;
    for (int i=0;i<dailyForecast.size();i++) {
      textFont(SFproBold_128);
      textSize(28);
      text(dailyForecastDayName[i],x+630+i*(800/6),y+280);
      textFont(SFproThin_128);
      textSize(40);
      text(dailyMaxTemp[i]+"°C",x+630+i*(800/6),y+330); 
      tempIcon = loadShape("data/weather_icons/weatherIcon_"+dailyIconInt[i]+".svg");
      tempIcon.disableStyle();
      shape(tempIcon,x+630+i*(800/6)+60,y+250,50,50);
      rainProbability(x+630+i*(800/3)+275,y+300,dailyRainProbDay[i],dailyRainProbNight[i],0.5);
    }
    if (dayNo == 1) { 
      temperaturKurve(day1tempArray, x+680,y+550,550,120,0,30);
    }
    if (dayNo == 2) { 
      temperaturKurve(day2tempArray, x+680,y+550,550,120,0,30);
    }
    if (dayNo == 3) { 
      temperaturKurve(day3tempArray, x+680,y+550,550,120,0,30);
    }
    if (dayNo == 4) { 
      temperaturKurve(day4tempArray, x+680,y+550,550,120,0,30);
    }
    if (dayNo == 5) { 
      temperaturKurve(day5tempArray, x+680,y+550,550,120,0,30);
    }
      popStyle();
  }

  void currentWeather() {
    pushStyle();
    refreshButton = new IconButton(x+wetter.breite-40,y+15,30,30,refreshIcon);
    refreshButton.displayNoBG();
    textFont(SFproThin_128);
    fill(255);
    noStroke();
    textSize(72);
    text(location,x+45,y+170);
    //textFont(SFproLight_128);
    textSize(26);
    text(nf(day(),2)+". "+uhr.monatsname+" "+year(),x+45,y+210);
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
    currentWeatherIcon.disableStyle();
    shape(currentWeatherIcon,x+340,y+45,300,300);
    rainProbability(x,y+5,dailyRainProbDay[0],dailyRainProbNight[0],1);    
    temperaturKurve(day1tempArray, x+100,y+750,450,150,0,30);
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
  
  void rainProbability(int x_, int y_, int rainProbDay, int rainProbNight, float scale) {
    pushStyle();
    pushMatrix();
    scale(scale);
    waterDropIcon.disableStyle();
    dayIcon.disableStyle();
    nightIcon.disableStyle();
    shape(waterDropIcon,x_+410,y_+492,40,40);
    textAlign(CENTER);
    textFont(SFproLight_128);
    textSize(32);
    text(rainProbDay+"%",x_+490,y_+524);
    shapeMode(CENTER);
    shape(dayIcon,x_+490,y_+470,36,36);
    shape(nightIcon,x_+574,y_+470,40,40);
    line(x_+532,y_+523,x_+532,y_+500);
    text(rainProbNight+"%",x_+574,y_+524);
    popMatrix();
    popStyle();
  }
  
  void clicked() {
    if (mouseX>x+620 && mouseX<x+620+800/6 && mouseY>y+250 && mouseY<y+400) {
      dayNo = 1;
    }
    if (mouseX>x+620+800/6 && mouseX<x+620+(800/6)*2 && mouseY>y+250 && mouseY<y+400) {
      dayNo = 2;
    }
    if (mouseX>x+620+(800/6)*2 && mouseX<x+620+(800/6)*3 && mouseY>y+250 && mouseY<y+400) {
      dayNo = 3;
    }
    if (mouseX>x+620+(800/6)*3 && mouseX<x+620+(800/6)*4 && mouseY>y+250 && mouseY<y+400) {
      dayNo = 4;
    }
    if (mouseX>x+620+(800/6)*4 && mouseX<x+620+(800/6)*5 && mouseY>y+250 && mouseY<y+400) {
      dayNo = 5;
    }
  }
  
}