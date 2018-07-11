class Uhr {

  int sec;
  int min;
  int std;
  
  float angleStd;
  float angleMin;
  float angleSec;
  
  String uhrzeit;
  
  int day;
  int month;
  int year;
  
  int x;
  int y;
  
  int radius;
  
  Uhr (int x_,int y_, int radius_){
    x = x_;
    y = y_;
    radius = radius_;
  }
  
  void updateClock() {
    sec = second();
    min = minute();
    std = hour();
    
    day = day();
    month = month();
    year = year();
  }
  
  void digital() {
    pushStyle();
    
    uhrzeit = nf(std,2)+":"+nf(min,2)+":"+nf(sec,2);
    textAlign(CENTER);
    textFont(Quartz_150);

    fill(40);
    text("00:00:00",x,y);
    fill(255);
    text(uhrzeit,x,y);
    popStyle();
    //println(uhrzeit);
  }
  
  void analog() {
    
    pushMatrix();
    pushStyle();
    translate(x,y-40);
    fill(255);
    stroke(0);
    ellipse(0,0,radius*2,radius*2);
    //===========Stundenstriche==============
    for (int i = 0; i<= 12; i++) {
      pushMatrix();
      rotate(map(i,0,12,0,TWO_PI));
      translate(0,-radius+5);
      strokeCap(CORNER);
      strokeWeight(6);
      line(0,0,0,25);
      popMatrix();
    }
    
    //===========Minutenstriche==============
    for (int i = 0; i<= 60; i++) {
      pushMatrix();
      rotate(map(i,0,60,0,TWO_PI));
      translate(0,-radius+5);
      strokeCap(CORNER);
      strokeWeight(4);
      line(0,0,0,10);
      popMatrix();
    }
    
    //==============Stundenzeiger==============
    angleStd = map(std+norm(min,0,60),0,24,0,4*PI);
    angleStd -= HALF_PI;
    strokeWeight(10);
    line(0,0,radius*0.6*cos(angleStd),radius*0.6*sin(angleStd));
    line(0,0,-radius*0.2*cos(angleStd),-radius*0.2*sin(angleStd));
    
    
    //==============Minutenzeiger==============
    angleMin = map(min+norm(sec,0,60),0,60,0,TWO_PI);
    angleMin -= HALF_PI;
    strokeWeight(7);
    line(0,0,radius*0.8*cos(angleMin),radius*0.8*sin(angleMin));
    line(0,0,-radius*0.2*cos(angleMin),-radius*0.2*sin(angleMin));
    
    //==============Sekundenzeiger==============
    angleSec = map(sec,0,60,0,TWO_PI);
    angleSec -= HALF_PI;
    strokeWeight(3);
    stroke(255,0,0);
    fill(255,0,0);
    line(0,0,radius*0.7*cos(angleSec),radius*0.7*sin(angleSec));
    line(0,0,-radius*0.2*cos(angleSec),-radius*0.2*sin(angleSec));
    ellipse(radius*0.7*cos(angleSec),radius*0.7*sin(angleSec),20,20);
    
    popStyle();
    popMatrix();
  }


}