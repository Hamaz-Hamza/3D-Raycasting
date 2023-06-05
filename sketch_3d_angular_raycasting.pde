Map map;
Player player;
Screen screen;
PVector mouse;
PVector direction;
boolean drawMap = false;

void setup() {
   fullScreen();
   colorMode(HSB);
   screen = new Screen(new PVector(0,0), width, height);
   map = new Map(new PVector(0,0), width, height);
   player = new Player(width/2,height/4);
   mouse = new PVector(mouseX, mouseY);
   direction = new PVector(0,0);
   for(int i=0; i < 10; i++) map.edges.add(new Edge(new PVector(random(map.mapWidth),random(map.mapHeight)), new PVector (random(map.mapWidth),random(map.mapHeight))));
}

void draw() {
   background(0);
   if (drawMap) map.draw();
   
   screen.draw(player.illuminate(map.edges));
   direction = PVector.fromAngle(radians(player.playerAngle));
   
   stroke(255);
   fill(100, 250, 250);
   text("FPS: " + frameRate,5,11);
}

void keyPressed(){
    if (key == 'w') player.pos.add(direction.mult(10));
    if (key == 's') player.pos.sub(direction.mult(10));
    if (key == 'a') player.playerAngle -= 3;
    if (key == 'd') player.playerAngle += 3;
}
