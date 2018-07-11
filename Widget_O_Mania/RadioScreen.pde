void RadioScreen() {
 
 if (!init) {
   weckerMin = new Widget(50,height-150,width/2-75,100,"Uhr");
   maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
   
   wetterMin = new Widget(width/2+25,height-150,width/2-75,100,"Wetter");
   maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
   
   init = true;
 } 
  
  //============Draw Radio=======================
 radioMax.display();
 minButtonRadio.display();
 //==============================================
 

 weckerMin.display();
 maxButtonWeckerSmall.display();
 
 
 
 wetterMin.display();
 maxButtonWetterSmall.display();
}