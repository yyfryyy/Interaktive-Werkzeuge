void WeckerScreen() {
 if (!initWecker) {
   radioMin = new Widget(50,height-180,width/2-75,130,"Radio");
   maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
   radioSteuerungSmall = new Radio(radioMin.x+radioMin.breite/2-40,radioMin.y+45);
   
   wetterMin = new Widget(width/2+0,height-180,width/2-50,130,"Wetter");
   wetterSmall = new Wetter(wetterMin.x,wetterMin.y);
   maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
   
   initWetter = false;
   initRadio = false;
   initWecker = true;
 } 
 
 weckerMax.display();
 minButtonWecker.displayNoBG();
 
 
 radioMin.display();
 radioSteuerungSmall.steuerungSmall();
 maxButtonRadioSmall.displayNoBG();
 
 
 wetterMin.display();
 wetterSmall.weatherSmall();
 maxButtonWetterSmall.displayNoBG();
}