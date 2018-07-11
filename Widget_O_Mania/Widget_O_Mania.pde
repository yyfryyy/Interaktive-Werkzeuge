PFont SFproBold_48;
PFont SFproBold_24;

int screenNo = 0;

PImage maxIcon;
PImage minIcon;

Widget wecker;
Widget radio;
Widget wetter;

IconButton maxButtonWecker;
IconButton maxButtonRadio;
IconButton maxButtonWetter;

IconButton minButtonWecker;
IconButton minButtonRadio;
IconButton minButtonWetter;
void setup() {
 //fullScreen();
 size(800,600);
 pixelDensity(displayDensity());
 //frame.setResizable(true);
 println(pixelWidth,pixelHeight);
 
 SFproBold_48 = loadFont("SFProDisplay-Bold-48.vlw");
 SFproBold_24 = loadFont("SFProDisplay-Bold-24.vlw");
 maxIcon = loadImage("fullscreen.png");
 minIcon = loadImage("minimize.png");
 
 //=============Setup Wecker=====================
 wecker = new Widget(50,40,width/2-75,height/2-60,"Wecker");
 maxButtonWecker = new IconButton(wecker.x+15,wecker.y+15,30,30, maxIcon,minIcon,0,1);
 //==============================================
 
  //=============Setup Radio=====================
 radio = new Widget(50,height/2+10,width/2-75,height/2-50,"Radio");
 maxButtonRadio = new IconButton(radio.x+15,radio.y+15,30,30, maxIcon, minIcon,0,2);
 //==============================================
 
   //=============Setup Wetter=====================
 wetter = new Widget(width/2+25,40,width/2-75,height-80,"Wetter");
 maxButtonWetter = new IconButton(wetter.x+15,wetter.y+15,30,30, maxIcon, minIcon,0,3);
 //==============================================
}

void draw() {
 background(155);

  
 
 //println(frameRate);
 println(screenNo);
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
  maxButtonWecker.clicked("changeScreen");
  maxButtonRadio.clicked("changeScreen");
  maxButtonWetter.clicked("changeScreen");

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