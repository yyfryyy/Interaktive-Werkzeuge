import java.util.*;
import java.text.SimpleDateFormat;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer player;
AudioPlayer alarmPlayer;
AudioMetaData meta;
AudioOutput out;

JSONArray currentWeatherJSON;
String currentWeatherText;
int currentWeatherIconInt;
PShape currentWeatherIcon;
PShape waterDropIcon;
PShape dayIcon;
PShape nightIcon;
int currentTemperature;
int todayWeatherRainProbDay;
int todayWeatherRainProbNight;
int todayMaxTemp;
int todayMinTemp;
String location;
int refreshMin;
int refreshHour;

JSONObject dailyForecastJSON;
JSONArray dailyForecast;
int[] dailyMaxTemp = new int[5];
int[] dailyMinTemp = new int[5];
int[] dailyRainProbNight = new int[5];
int[] dailyRainProbDay = new int[5];

JSONObject hourlyForecastJSON;
JSONArray hourlyForecast;

String[] daytempTime = new String[8];

int[] day1tempArray = new int[8];
int[] day2tempArray = new int[8];
int[] day3tempArray = new int[8];
int[] day4tempArray = new int[8];
int[] day5tempArray = new int[8];

JSONObject radioSenderJSON;
JSONObject radiosender;
JSONArray senderArray;
JSONArray playlist;
String song;
JSONObject sender;
String radioName;
int songIndex;
int senderIndex;
boolean isPlaying;
boolean muted;

PFont SFproBold_128;
PFont SFproLight_128;
PFont SFproUltraLight_128;
PFont SFproThin_128;
PFont SFproSemiBold_128;
PFont Monospace;

PFont Quartz_128;

int screenNo = 0;
float realVolume = 0.75;
float oldVolume;

PImage clockIconWhite;
PImage clockIconDark;

PShape maxIcon;
PShape minIcon;
PShape clock;
PShape playIcon;
PShape pauseIcon;
PShape forwardIcon;
PShape backwardIcon;
PShape favIcon;
PShape noFavIcon;
PShape mutedIcon;
PShape fullVolumeIcon;
PShape halfVolumeIcon;

boolean init;
boolean initRadio;
boolean initWecker;
boolean initWetter;
boolean clockActive;
boolean alarmIsSet = true;
boolean alarmIsOn = false;
boolean alarmKlingelt;
boolean schlummernSet;


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

Wetter wetterMain;

Wecker weckerMain;
int weckerHour = 12;
int weckerMinute = 0;

// Current Weather Conditions Accuweather API 
String accuapikey = "YvoL1FuxVLloTYlOvfjUanQMCIGyxZnC";
String locationkey = "167220";
String currentConditionURL = "http://dataservice.accuweather.com/currentconditions/v1/"+locationkey+"?apikey="+accuapikey+"&language=de&details=false";


// 3 Hour Forecast 5 Days OpenWeatherMap API
String openweatherapikey = "be1173a9306197e365ab025aab244d1e";
String hourForecastURL = "http://api.openweathermap.org/data/2.5/forecast?q=Stuttgart,de&unity=metric&APPID=be1173a9306197e365ab025aab244d1e";

void setup() {
 fullScreen();
 //size(800,600);
 pixelDensity(displayDensity());
 //textMode(SHAPE);
 //frame.setResizable(true);
 //String[] fontList = PFont.list();
 //printArray(fontList);
 //Minim & Radiosender
 minim = new Minim(this);
 out = minim.getLineOut();
 //player = minim.loadFile("http://swr-swr3-live.cast.addradio.de/swr/swr3/live/mp3/128/stream.mp3");
 radioSenderJSON = loadJSONObject("radiosender.json");
 radiosender = radioSenderJSON.getJSONObject("radioJSON");
 senderArray = radiosender.getJSONArray("senderliste");
 senderIndex = floor(random(senderArray.size()));
 sender = senderArray.getJSONObject(senderIndex);
 radioName = sender.getString("name");
 playlist = sender.getJSONArray("songs");
 songIndex = floor(random(playlist.size()));
 println(songIndex);
 song = playlist.getString(songIndex);
 
 alarmPlayer = minim.loadFile("Atom - Atom-Alarm-Sirene.mp3");
 player = minim.loadFile(song);
 meta = player.getMetaData();
 println(radioName);
 println("Song: " + meta.title());
 println("Artist: " + meta.author());
 println("Album: " + meta.album());
 //player.play();
 
 SFproBold_128 = createFont("SFProDisplay-Bold",128);
 SFproLight_128 = createFont("SFProDisplay-Light",128);
 SFproUltraLight_128 = createFont("SFProDisplay-Ultralight",128);
 SFproThin_128 = createFont("SFProDisplay-Thin",128);
 SFproSemiBold_128 = createFont("SFProDisplay-Semibold",128);
 Monospace = createFont("Monospaced",128);
 
 Quartz_128 = createFont("DigitalDismay",128);

 playIcon = loadShape("play-button.svg");
 pauseIcon = loadShape("pause-button.svg");
 forwardIcon = loadShape("forward-button.svg");
 backwardIcon = loadShape("backward-button.svg");
 favIcon = loadShape("star.svg");
 noFavIcon = loadShape("star-2.svg");
 
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
 
 wetterMain = new Wetter(wetter.x,wetter.y);
 
 waterDropIcon = loadShape("data/weather_icons/waterdrop_icon.svg");
 dayIcon = loadShape("data/weather_icons/weatherIcon_1.svg");
 nightIcon = loadShape("data/weather_icons/weatherIcon_33.svg");
 //==============================================
 
 //========Get weather====
 getWeather();
 
}

void draw() {
 if (!alarmKlingelt) {
   background(155);
   }
 else {
 background(map(noise(frameCount*0.5+10000),0,1,0,200),map(2*noise(frameCount*0.5+10000),0,1,0,200),map(noise(frameCount*0.5+10000),0,1,0,200));
 }
 //println(frameRate);
 text("Fps: "+ frameRate,20,20);
 uhr.updateClock();
 player.setGain(map(realVolume,0,1,-45,0));

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
  radioSteuerung.volumeSlider.volumeIcon.clicked("mute/unmute");
  radioSteuerung.favButton.clicked("setFav");
  
  weckerMain.turnOnAlarm.clicked("toggleAlarm");
    if (!alarmIsSet) {
    weckerMain.setAlarm.clicked("weckerSet");
    }
    else if (alarmIsSet && !alarmKlingelt) {
    weckerMain.editAlarm.clicked("weckerSet");
    }
    else if (alarmIsSet && alarmKlingelt) {
    weckerMain.schlummern.clicked("snooze");
    }
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

void mouseWheel(MouseEvent event) {
  if (weckerMain.isHovered("hour") && !alarmIsSet) {
    //if (frameCount % 2 == 0) {
      if (event.getCount() > 0) {
      weckerHour++;
      }
      else {
      weckerHour--;
      }
    //}
  }
  if (weckerMain.isHovered("minute") && !alarmIsSet) {
    //if (frameCount % 2 == 0) {
      if (event.getCount() > 0) {
      weckerMinute++;
      }
      else {
      weckerMinute--;
      }
    //}
  }
}

void keyPressed () {
 if(key == BACKSPACE) {
   screenNo = 0;
 } 
}

void dispose() {
  saveJSONObject(radioSenderJSON, "data/radiosender.json");
}

//JSONArray currentWeatherJSON;
//String currentWeatherText;
//int currentWeatherIcon;
//int currentTemperature;
//int todayWeatherRainProbDay;
//int todayWeatherRainProbNight;
//int todayMaxTemp;
//int todayMinTemp;

//JSONObject dailyForecastJSON;
//JSONArray dailyForecast;
//int[] dailyMaxTemp;
//int[] dailyMinTemp;
//int[] dailyRainProbNight;
//int[] dailyRainProbDay;

//JSONObject hourlyForecastJSON;
//JSONArray hourlyForecast;
//int[] day1tempArray;
//int[] day2tempArray;
//int[] day3tempArray;
//int[] day4tempArray;
//int[] day5tempArray;

void getWeather() {
  
  location = "Stuttgart";
  refreshMin = minute();
  refreshHour = hour();
  
  currentWeatherJSON = loadJSONArray("current_weather.json");
  dailyForecastJSON = loadJSONObject("weather_forecast_5days.json");
  dailyForecast = dailyForecastJSON.getJSONArray("DailyForecasts");
  hourlyForecastJSON = loadJSONObject("3_hour_forecast.json");
  hourlyForecast = hourlyForecastJSON.getJSONArray("list");
  
  // Array für maxTemp pro Tag
  for (int i = 0; i<dailyForecast.size(); i++) {
    dailyMaxTemp[i] = dailyForecast.getJSONObject(i).getJSONObject("Temperature").getJSONObject("Maximum").getInt("Value");
  }
  // Array für minTemp pro Tag
  for (int i = 0; i<dailyForecast.size(); i++) {
    dailyMinTemp[i] = dailyForecast.getJSONObject(i).getJSONObject("Temperature").getJSONObject("Minimum").getInt("Value");
  }
  // Array für rainProbNight pro Tag
  for (int i = 0; i<dailyForecast.size(); i++) {
    dailyRainProbNight[i] = dailyForecast.getJSONObject(i).getJSONObject("Night").getInt("RainProbability");
  }
  // Array für rainProbDay pro Tag
  for (int i = 0; i<dailyForecast.size(); i++) {
    dailyRainProbDay[i] = dailyForecast.getJSONObject(i).getJSONObject("Day").getInt("RainProbability");
  }
  int n = 0;
  // Array für Temperatur an Tag 1
  for (int i = 0; i<8;i++) {
    Date pdate = new Date();
    day1tempArray[n] = hourlyForecast.getJSONObject(i).getJSONObject("main").getInt("temp");
    String date = hourlyForecast.getJSONObject(i).getString("dt_txt");
    try {
      pdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
    }
    catch (Exception e) {
    }
    daytempTime[n] = new SimpleDateFormat("HH").format(pdate);
    n++;
  }
  n = 0;
  // Array für Temperatur an Tag 2
  for (int i = 8; i<16;i++) {
    day2tempArray[n] = hourlyForecast.getJSONObject(i).getJSONObject("main").getInt("temp");
    n++;
  }
  n = 0;
  // Array für Temperatur an Tag 3
  for (int i = 16; i<24;i++) {
    day3tempArray[n] = hourlyForecast.getJSONObject(i).getJSONObject("main").getInt("temp");
    n++;
  }
  n = 0;
  // Array für Temperatur an Tag 4
  for (int i = 24; i<32;i++) {
    day4tempArray[n] = hourlyForecast.getJSONObject(i).getJSONObject("main").getInt("temp");
    n++;
  }
  n = 0;
  // Array für Temperatur an Tag 5
  for (int i = 32; i<40;i++) {
    day5tempArray[n] = hourlyForecast.getJSONObject(i).getJSONObject("main").getInt("temp");
    n++;
  }
  
  currentWeatherText = currentWeatherJSON.getJSONObject(0).getString("WeatherText");
  currentWeatherIconInt = currentWeatherJSON.getJSONObject(0).getInt("WeatherIcon");
  currentWeatherIcon = loadShape("data/weather_icons/weatherIcon_"+currentWeatherIconInt+".svg");
  currentTemperature = currentWeatherJSON.getJSONObject(0).getJSONObject("Temperature").getJSONObject("Metric").getInt("Value");
  todayWeatherRainProbDay = dailyRainProbDay[0];
  todayWeatherRainProbNight = dailyRainProbNight[0];
  todayMaxTemp = dailyMaxTemp[0];
  todayMinTemp = dailyMinTemp[0];
  println(currentWeatherText + " - Icon " + currentWeatherIcon + " - " + currentTemperature +"°C");
  printArray(daytempTime);

}