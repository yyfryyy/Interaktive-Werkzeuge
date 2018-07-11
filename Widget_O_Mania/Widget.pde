class Widget {
  int x;
  int y;
  int breite;
  int hoehe;
  color col = 50;
  int cornerRadius = 10;
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
    fill(255);
    textFont(SFproBold_24);
    text(title,x+50,y+38);
    
    popStyle();

  }
  
  void displayMax() {
    pushStyle();
    
    fill(col);
    noStroke();
    rect(50,40,width-100,height-100, cornerRadius);
    fill(255);
    textFont(SFproBold_24);
    text(title,50+50,40+38);
    
    popStyle();
  }
}