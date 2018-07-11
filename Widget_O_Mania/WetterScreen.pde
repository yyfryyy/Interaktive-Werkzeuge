void WetterScreen() {
 wetterMax.display();
 minButtonWetter.display();
 
 weckerMin = new Widget(50,height-150,width/2-75,100,"Wecker");
 maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
 weckerMin.display();
 maxButtonWeckerSmall.display();
 
 radioMin = new Widget(width/2+25,height-150,width/2-75,100,"Radio");
 maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
 radioMin.display();
 maxButtonRadioSmall.display();
}