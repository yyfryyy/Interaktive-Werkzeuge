import java.util.*;
import java.text.SimpleDateFormat;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;

JSONObject radioSenderJSON;
JSONObject radiosender;
JSONArray senderArray;
JSONArray playlist;
String song;
JSONObject sender;
String radioName;
int songIndex;
int senderIndex;


PFont SFproBold_128;
PFont SFproLight_128;
PFont SFproSemiBold_128;

PFont Quartz_128;

int screenNo = 0;


PImage clockIconWhite;
PImage clockIconDark;

PShape maxIcon;
PShape minIcon;
PShape clock;
PShape playIcon;
PShape pauseIcon;
PShape forwardIcon;
PShape backwardIcon;

boolean init;
boolean clockActive;

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

switchButton uhrSwitch;

Radio radioSteuerung;

Uhr uhr;



void setup() {
 fullScreen();
 //size(800,600);
 pixelDensity(displayDensity());
 //textMode(SHAPE);
 //frame.setResizable(true);
 String[] fontList = PFont.list();
 printArray(fontList);
 //Minim & Radiosender
 minim = new Minim(this);
 //player = minim.loadFile("http://swr-swr3-live.cast.addradio.de/swr/swr3/live/mp3/128/stream.mp3");
 radioSenderJSON = loadJSONObject("radiosender.json");
 radiosender = radioSenderJSON.getJSONObject("radioJSON");
 senderArray = radiosender.getJSONArray("senderliste");
 sender = senderArray.getJSONObject(floor(random(senderArray.size())));
 radioName = sender.getString("name");
 playlist = sender.getJSONArray("songs");
 songIndex = floor(random(playlist.size()));
 println(songIndex);
 song = playlist.getString(songIndex);
 
 
 player = minim.loadFile(song);
 meta = player.getMetaData();
 println(radioName);
 println("Song: " + meta.title());
 println("Artist: " + meta.author());
 println("Album: " + meta.album());
 //player.play();
 
 SFproBold_128 = createFont("SFProDisplay-Bold",128);
 SFproLight_128 = createFont("SFProDisplay-Light",128);
 SFproSemiBold_128 = createFont("SFProDisplay-Semibold",128);
 
 Quartz_128 = createFont("DigitalDismay",128);

 playIcon = loadShape("play-button.svg");
 pauseIcon = loadShape("pause-button.svg");
 forwardIcon = loadShape("forward-button.svg");
 backwardIcon = loadShape("backward-button.svg");
 
 maxIcon = loadShape("maximize.svg");
 minIcon = loadShape("minimize.svg");
 clockIconWhite = loadImage("clock_white.png");
 clockIconDark = loadImage("clock_dark.png");
 
 clock = loadShape("clock.svg");
 
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
 
 radioSteuerung = new Radio(200,200);
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
 //println(frameRate);
 text("Fps: "+ frameRate,20,20);
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

  // Main
  if (screenNo == 0) {
  maxButtonWecker.clicked("changeScreen");
  maxButtonRadio.clicked("changeScreen");
  maxButtonWetter.clicked("changeScreen");
  
  uhrSwitch.clicked("switchState");
  
  radioSteuerung.playButton.clicked("play/pause");
  radioSteuerung.forwardButton.clicked("forward");
  radioSteuerung.backwardButton.clicked("backward");
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