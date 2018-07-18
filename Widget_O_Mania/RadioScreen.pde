void RadioScreen() {
 
 if (!initRadio) {
   weckerMin = new Widget(50,height-180,width/2-75,130,"Uhr");
   maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
   
   wetterMin = new Widget(width/2+0,height-180,width/2-50,130,"Wetter");
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
 maxButtonWeckerSmall.displayNoBG();
 
 
 
 wetterMin.display();
 maxButtonWetterSmall.displayNoBG();
}