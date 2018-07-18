void WetterScreen() {
  if (!initWetter) {
   weckerMin = new Widget(50,height-180,width/2-75,130,"Uhr");
   maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
   radioMin = new Widget(width/2+0,height-180,width/2-50,130,"Radio");
   maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
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
 maxButtonWeckerSmall.displayNoBG();
 
 // Radio
 radioMin.display();
 maxButtonRadioSmall.displayNoBG();
}