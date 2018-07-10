PFont SFproBold;
PImage maximize;


Widget wecker;
IconButton test;

void setup() {
 fullScreen();
 SFproBold = loadFont("SFProDisplay-Bold-48.vlw");
 maximize = loadImage("fullscreen.png");
 
 
 test = new IconButton(200,200,60,60, maximize);
 wecker = new Widget(50,50,width/2-50,height/2-50,"Wecker");
}

void draw() {
 background(155);
 
 wecker.display();
 test.display();
 
 mousePos();
}




void mousePos() {
text(mouseX+"x"+mouseY,mouseX,mouseY);
}