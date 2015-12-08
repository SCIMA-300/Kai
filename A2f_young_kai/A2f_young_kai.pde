/*

Kai Young
SCIMA 300
A2e

Polar graph examining conflict relationships.

*/



PolarGraph graph;  //Main object
int w = 15,           //Width of the elements           
R = 350,             //radius of the graph
orX,               //x del centro ""
orY,               //y del centro ""
curv_fact = 5,       //curve tightness of the connections
cR = 360;            //colormode range
float sep = 25e-4,   //sector separation
cR25 = cR * .25,       //generic value one for alpha
cR75 = cR * .75,       //generic value two for alpha
fSw = 5.5f;          //connections strokeWeight scaling factor 
color bg = #000000;  //background color

void commonSettings (PGraphics pg){  //basic settings
  pg.colorMode(HSB, cR);
  pg.ellipseMode(RADIUS);
  pg.strokeCap(SQUARE);
  pg.imageMode(CENTER);
  pg.noFill();
  pg.smooth();
}

void setup(){
  size(1000, 1000);
  commonSettings(g);
  orX = width / 2 + 30; 
  orY = height / 2;  //Center of the graph
  graph = new PolarGraph("tabla.csv", orX, orY, R, w, curv_fact, sep);

}

void draw(){
  background(bg);         
  graph.displayBase();                              //shows the polar display of elements
  graph.creaConnect();                              //check selected connections and show them
  if (graph.hover(dist(mouseX, mouseY, orX, orY))){    //show hovered connections
    cursor(HAND);
    graph.creaConnect(atan2((mouseY - orY), (mouseX - orX)));
  } else {
    cursor(CROSS);
  }
    
}

void mousePressed(){
  if (mouseButton == LEFT){
    if (graph.hover(dist(mouseX, mouseY, orX, orY))) {   //check if mouse is inside an element
      graph.click(atan2((mouseY - orY), (mouseX - orX)));  //if so, toggle its display
    } else {
      graph.all(false); //if you click outside erase everything
    }
  } else {
    graph.all(true);    //right-click shows everything
  }
}