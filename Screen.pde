class Screen{
    PVector origin;
    int screenWidth;
    int screenHeight;
    int blockWidth = 10;
    
    Screen(PVector origin, int screenWidth, int screenHeight){
        this.origin = origin;
        this.screenWidth = screenWidth;
        this.screenHeight = screenHeight;
    }
    
    void draw(WallInfo[] distances){
        noStroke();
        drawFloor();
        for(int i=0; i < player.rays; i++){
           int x = i * 10;
           
           float distance = distances[i].distance;
           if (distance < 1.0f) distance = 1;
           else distance = 1/distance;
           float blockHeight = map(distance, 0, 1, 0, screenHeight);
           blockHeight *= 50;
           
           float brightness = map(blockHeight, 0, screenHeight, 0, 250);
           float other = (screenHeight-blockHeight)/2;
           if (distances[i].colour == -1) fill(0, 0, 0);
           else fill(distances[i].colour, 250, brightness);
           rect(200 + origin.x + x, origin.y + other, blockWidth, blockHeight);
        }
    }
    
    void drawFloor(){
        int fill = 240;
        int dec = 5;
        for(int i=0; i < 80; i++){
           fill(fill);
           fill -= 3;
           rect(200, screenHeight-dec, screenWidth - 365, 5);
           //rect(200, 0+(dec-5), screenWidth - 365, 5);
           dec += 5;
        }
    }
    
}
