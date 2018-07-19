void RadioScreen() {
 
 if (!initRadio) {
   weckerMin = new Widget(50,height-180,width/2-75,130,"Uhr");
   maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
   turnOnAlarmMin = new OnOffButton(weckerMin.x+555,weckerMin.y+25);
   
   wetterMin = new Widget(width/2+0,height-180,width/2-50,130,"Wetter");
   wetterSmall = new Wetter(wetterMin.x,wetterMin.y);
   maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
   
   initWetter = false;
   initWecker = false;
   initRadio = true;
 } 
  
  //============Draw Radio=======================
 radioMax.display();
 minButtonRadio.displayNoBG();
 //==============================================
 

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
 
 
 
 wetterMin.display();
 wetterSmall.weatherSmall();
 maxButtonWetterSmall.displayNoBG();
}