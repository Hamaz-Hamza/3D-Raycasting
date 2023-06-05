class Edge{
    PVector p1, p2;
    int colour;
    Edge(PVector point1, PVector point2) {
        p1 = point1.copy(); 
        p2 = point2.copy();
        colour = int(random(255));
    }
    
    void draw(){
        strokeWeight(2);
        stroke(colour);
        line(p1.x,p1.y,p2.x,p2.y);
    }
}
