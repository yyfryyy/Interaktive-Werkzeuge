void WetterScreen() {
  if (!initWetter) {
   weckerMin = new Widget(50,height-150,width/2-75,100,"Uhr");
   maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
   radioMin = new Widget(width/2+25,height-150,width/2-75,100,"Radio");
   maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
 
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