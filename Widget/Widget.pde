int  sec_;
int min_;
int std_;

String sec;
String min;
String std;

void setup() {

  size(800,500);
  
}

void draw() {
  sec_ = second();
  min_ = minute();
  std_ = hour();
  
  sec = str(sec_);
  min = str(min_);
  std = str(std_);
  sec = convertTimeString(sec);
  min = convertTimeString(min);
  std = convertTimeString(std);
  println(std,min,sec);
  background(100);
  textSize(80);
  text(std+":"+min+":"+sec, 50,100);
  
}

String convertTimeString(String toConvert) {
  if (toConvert.length() == 1) {
   toConvert = "0"+toConvert;
  }
  return toConvert;
}
