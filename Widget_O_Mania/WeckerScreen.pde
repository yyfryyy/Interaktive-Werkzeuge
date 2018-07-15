void WeckerScreen() {
 if (!initWecker) {
   radioMin = new Widget(50,height-150,width/2-75,100,"Radio");
   maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
   
   wetterMin = new Widget(width/2+25,height-150,width/2-75,100,"Wetter");
   maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
 
   initWecker = true;
 } 
 
 weckerMax.display();
 minButtonWecker.display();
 
 
 radioMin.display();
 maxButtonRadioSmall.display();
 
 
 wetterMin.display();
 maxButtonWetterSmall.display();
}