int circleCnt = 7;
int k = 4;
float res = 5;
PGraphics pg;

float [] r = new float[circleCnt];
float [] x = new float[circleCnt]; 
float [] y = new float[circleCnt];
float [] spd = new float[circleCnt];
float [] angle = new float[circleCnt];
void setup()
{
  size(1280,720);
  frameRate(240);
  pg = createGraphics(1280,720);
  x[0] = 1280/2;
  y[0] = 720/2;
  r[0] = 100;
  spd[0] = 0;
  for(int i = 0; i < circleCnt; i++){
     angle[i] = PI/2; 
  }
}

void draw()
{
  background(51);
  
  ellipse(x[0],y[0],r[0]*2,r[0]*2);

    for( int i =1 ; i < circleCnt; i++ )
    {
      spd[i] = radians(pow(k,i-1))/res;
      spd[i] *= pow(-1,i); //diff rotate angles 
      angle[i] += spd[i]; 

        x[i] = (r[i]+r[i-1])*sin(angle[i]);
        y[i] = (r[i]+r[i-1])*cos(angle[i]);

       x[i] += x[i-1];
       y[i] += y[i-1];
       r[i] = r[i-1]/3; //radius size of each circles
       fill(50);
       ellipse(x[i],y[i],r[i]*2,r[i]*2);
    }
    
    pg.beginDraw();
    pg.stroke(255,0,0);
    pg.point(x[circleCnt-1],y[circleCnt-1]);
    pg.endDraw();
    image(pg,0,0);
}
