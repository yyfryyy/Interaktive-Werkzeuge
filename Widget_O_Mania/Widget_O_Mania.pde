PFont SFproBold_48;
PFont SFproBold_24;
PFont Quartz_48;
PFont Quartz_80;
PFont Quartz_150;

int screenNo = 0;

PImage maxIcon;
PImage minIcon;

boolean init;

Widget wecker;
Widget radio;
Widget wetter;
Widget weckerMax;
Widget radioMax;
Widget wetterMax;
Widget weckerMin;
Widget radioMin;
Widget wetterMin;

IconButton maxButtonWecker;
IconButton maxButtonRadio;
IconButton maxButtonWetter;

IconButton maxButtonWeckerSmall;
IconButton maxButtonRadioSmall;
IconButton maxButtonWetterSmall;

IconButton minButtonWecker;
IconButton minButtonRadio;
IconButton minButtonWetter;

Uhr uhr;

void setup() {
 fullScreen();
 //size(800,600);
 //frame.setResizable(true);
 
 SFproBold_48 = loadFont("SFProDisplay-Bold-48.vlw");
 SFproBold_24 = loadFont("SFProDisplay-Bold-24.vlw");
 Quartz_48 = loadFont("DigitalDismay-48.vlw");
 Quartz_80 = loadFont("DigitalDismay-80.vlw");
 Quartz_150 = loadFont("DigitalDismay-150.vlw");
 
 maxIcon = loadImage("fullscreen.png");
 minIcon = loadImage("minimize.png");
 
 //=============Setup Wecker=====================
 wecker = new Widget(50,40,width/2-75,height/2-60,"Uhr");
 weckerMax = new Widget(50,40,width-100,height-200,"Uhr"); 
 weckerMin = new Widget(50,height-150,width/2-75,100,"Uhr");
 
 maxButtonWecker = new IconButton(wecker.x+15,wecker.y+15,30,30, maxIcon,minIcon,1);
 maxButtonWeckerSmall = new IconButton(weckerMin.x+15,weckerMin.y+15,30,30, maxIcon,minIcon,1);
 minButtonWecker = new IconButton(weckerMax.x+15,weckerMax.y+15,30,30, minIcon,maxIcon,0);
 
 
 uhr = new Uhr(0,0,0);
 //==============================================
 
  //=============Setup Radio=====================
 radio = new Widget(50,height/2+30,width/2-75,height/2-70,"Radio");
 radioMax = new Widget(50,40,width-100,height-200,"Radio");
 radioMin = new Widget(50,height-150,width/2-75,100,"Radio");
 
 maxButtonRadio = new IconButton(radio.x+15,radio.y+15,30,30, maxIcon, minIcon,2);
 maxButtonRadioSmall = new IconButton(radioMin.x+15,radioMin.y+15,30,30, maxIcon,minIcon,2);
 minButtonRadio = new IconButton(radioMax.x+15,radioMax.y+15,30,30, minIcon,maxIcon,0);
 //==============================================
 
   //=============Setup Wetter=====================
 wetter = new Widget(width/2+25,40,width/2-75,height-80,"Wetter");
 wetterMax = new Widget(50,40,width-100,height-200,"Wetter");
 wetterMin = new Widget(50,height-150,width/2-75,100,"Wetter");
 
 maxButtonWetter = new IconButton(wetter.x+15,wetter.y+15,30,30, maxIcon, minIcon,3);
 maxButtonWetterSmall = new IconButton(wetterMin.x+15,wetterMin.y+15,30,30, maxIcon,minIcon,3);
 minButtonWetter = new IconButton(wetterMax.x+15,wetterMax.y+15,30,30, minIcon,maxIcon,0);
 //==============================================
 
 
 
 
}

void draw() {
 background(155);
 println(frameRate);
 
 uhr.updateClock();

 
 switch(screenNo) {
   case 0:
   MainScreen();
   break;
   case 1:
   WeckerScreen();
   break;
   case 2:
   RadioScreen();
   break;
   case 3:
   WetterScreen();
   break;
 }
 mousePos();
}

void mouseReleased() {
  init = false;
  // Main
  if (screenNo == 0) {
  maxButtonWecker.clicked("changeScreen");
  maxButtonRadio.clicked("changeScreen");
  maxButtonWetter.clicked("changeScreen");
  }
  // Wecker
  if (screenNo == 1) {
  minButtonWecker.clicked("changeScreen");
  maxButtonRadioSmall.clicked("changeScreen");
  maxButtonWetterSmall.clicked("changeScreen");
  }
  // Radio
  if (screenNo == 2) {
  maxButtonWeckerSmall.clicked("changeScreen");
  minButtonRadio.clicked("changeScreen");
  maxButtonWetterSmall.clicked("changeScreen");
  }
  // Wetter
    if (screenNo == 3) {
  maxButtonWeckerSmall.clicked("changeScreen");
  maxButtonRadioSmall.clicked("changeScreen");
  minButtonWetter.clicked("changeScreen");
  }
}




void mousePos() {
fill(255,0,0);
textSize(14);
text(mouseX+"x"+mouseY,mouseX,mouseY);
}

void keyPressed () {
 if(key == BACKSPACE) {
   screenNo = 0;
 } 
}