void RadioScreen() {
  //============Draw Radio=======================
 radioMax.display();
 minButtonRadio.display();
 //==============================================
 
 weckerMin = new Widget(50,height-150,width/2-75,100,"Wecker");
 maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
 weckerMin.display();
 maxButtonWeckerSmall.display();
 
 
 wetterMin = new Widget(width/2+25,height-150,width/2-75,100,"Wetter");
 maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
 wetterMin.display();
 maxButtonWetterSmall.display();
}