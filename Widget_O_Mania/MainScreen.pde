void MainScreen() {
 if (!init) {
//=============Setup Wecker=====================
 wecker = new Widget(50,40,width/2-75,height/2-60,"Uhr");
 weckerMax = new Widget(50,40,width-100,height-240,"Uhr"); 
 weckerMin = new Widget(50,height-150,width/2-75,100,"Uhr");
 
 maxButtonWecker = new IconButton(wecker.x+15,wecker.y+15,30,30, maxIcon,minIcon,1);
 maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
 minButtonWecker = new IconButton(weckerMax.x+15,weckerMax.y+15,30,30, minIcon,maxIcon,0);
 
 
 uhr = new Uhr(wecker.x+200,wecker.y+35+wecker.hoehe/2,125);
 uhrSwitch = new switchButton(wecker.x+15,wecker.y+70,70,30,clock,"09:00");
 
 weckerMain = new Wecker(wecker.x+485,wecker.y+200);
 //==============================================
 
  //=============Setup Radio=====================
 radio = new Widget(50,height/2+30,width/2-75,height/2-70,"Radio");
 radioMax = new Widget(50,40,width-100,height-240,"Radio");
 radioMin = new Widget(50,height-150,width/2-75,100,"Radio");
 
 maxButtonRadio = new IconButton(radio.x+15,radio.y+15,30,30, maxIcon, minIcon,2);
 maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
 minButtonRadio = new IconButton(radioMax.x+15,radioMax.y+15,30,30, minIcon,maxIcon,0);
 
 radioSteuerung = new Radio(radio.x+radio.breite/2-50,radio.y+240);
 //==============================================
 
   //=============Setup Wetter=====================
 wetter = new Widget(width/2+25,40,width/2-75,height-80,"Wetter");
 wetterMax = new Widget(50,40,width-100,height-240,"Wetter");
 wetterMin = new Widget(50,height-150,width/2-75,100,"Wetter");
 
 maxButtonWetter = new IconButton(wetter.x+15,wetter.y+15,30,30, maxIcon, minIcon,3);
 maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
 minButtonWetter = new IconButton(wetterMax.x+15,wetterMax.y+15,30,30, minIcon,maxIcon,0);
 
 wetterMain = new Wetter(wetter.x,wetter.y);
 
 //==============================================
   init = true;
   initWetter = false;
   initRadio = false;
   initWecker = false;
 } 
 
 
 
   //============Draw Uhr & Wecker=======================
 wecker.display();
 maxButtonWecker.displayNoBG();
  
  if (uhrSwitch.active) {
  uhr.digital();
  }
  else {
  uhr.analog();
  }
  uhrSwitch.display();
  
  weckerMain.setWecker();
  weckerMain.weckerIconDisplay(weckerMain.x-60,weckerMain.y-120);
 //==============================================
 
 
 
 
 //============Draw Radio=======================
 radio.display();
 
 
 
 
 maxButtonRadio.displayNoBG();
 radioSteuerung.steuerungMain();
 //==============================================
 
  //============Draw Wetter=======================
 wetter.display();
 maxButtonWetter.displayNoBG();
 
 wetterMain.currentWeather();
 //==============================================

}