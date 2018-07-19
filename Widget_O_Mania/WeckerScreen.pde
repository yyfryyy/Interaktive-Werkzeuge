void WeckerScreen() {
 if (!initWecker) {
   radioMin = new Widget(50,height-180,width/2-75,130,"Radio");
   maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
   radioSteuerungSmall = new Radio(radioMin.x+radioMin.breite/2-40,radioMin.y+45);
   
   wetterMin = new Widget(width/2+0,height-180,width/2-50,130,"Wetter");
   wetterSmall = new Wetter(wetterMin.x,wetterMin.y);
   maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
   
   uhrMax = new Uhr(weckerMax.x+500,weckerMax.y-100+weckerMax.hoehe/2,125);
   weckerMain = new Wecker(wecker.x+950,wecker.y+330);
   
   initWetter = false;
   initRadio = false;
   initWecker = true;
 } 
 
 weckerMax.display();
 if (uhrSwitch.active) {
  uhr.digital(1.5);
  }
  else {
  uhr.analog(1.5);
  }
  uhrSwitch.display();
  
  weckerMain.setWecker();
  weckerMain.weckerIconDisplay(weckerMain.x-60,weckerMain.y-120);
 minButtonWecker.displayNoBG();
 
 
 radioMin.display();
 radioSteuerungSmall.steuerungSmall();
 maxButtonRadioSmall.displayNoBG();
 
 
 wetterMin.display();
 wetterSmall.weatherSmall();
 maxButtonWetterSmall.displayNoBG();
}