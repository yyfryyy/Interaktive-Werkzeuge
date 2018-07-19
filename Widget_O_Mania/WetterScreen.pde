void WetterScreen() {
  if (!initWetter) {
   weckerMin = new Widget(50,height-180,width/2-75,130,"Uhr");
   maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
   
   radioMin = new Widget(width/2+0,height-180,width/2-50,130,"Radio");
   radioSteuerungSmall = new Radio(radioMin.x+radioMin.breite/2-40,radioMin.y+45);
   maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
   
   turnOnAlarmMin = new OnOffButton(weckerMin.x+555,weckerMin.y+25);
   initWecker = false;
   initRadio = false;
   initWetter = true;
 } 
  // Wetter
 wetterMax.display();
 minButtonWetter.displayNoBG();
 wetterForecast.wetterForecastDisplay();
 
 // Uhr
 weckerMin.display();
 uhr.smallDigital(weckerMin.x+120,weckerMin.y+92);
 weckerMain.weckerIconDisplay(weckerMin.x+470,weckerMin.y+65);
 if (alarmIsOn) {
      turnOnAlarmMin.active = true;
 }
 else {
      turnOnAlarmMin.active = false;
 }
 turnOnAlarmMin.display();
 maxButtonWeckerSmall.displayNoBG();
 
 // Radio
 radioMin.display();
 radioSteuerungSmall.steuerungSmall();
 maxButtonRadioSmall.displayNoBG();
}