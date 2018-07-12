class Widget {
  int x;
  int y;
  int breite;
  int hoehe;
  color col = 50;
  int cornerRadius = 0;
  String title;


  Widget(int x_,int y_, int breite_, int hoehe_, color col_, String title_) {
  
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    col = col_;
    title = title_;

  } 

  Widget(int x_,int y_, int breite_, int hoehe_, String title_) {
  
    x = x_;
    y = y_;
    breite = breite_;
    hoehe = hoehe_;
    title = title_;
  } 
  
  
  void display() {
    
    pushStyle();
    fill(col);
    noStroke();
    rect(x,y,breite,hoehe, cornerRadius);
    //fill(col+20);
    //rect(x,y,breite,60);
    fill(255);
    textFont(SFproBold_128);
    textSize(24);
    text(title,x+50,y+38);
    popStyle();

  }
  

}