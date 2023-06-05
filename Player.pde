class Player {
  
    PVector pos;
    float playerAngle = 0;
    PVector direction;
    float range = 60;
    int rays = 100;

    Player(float x, float y) {pos = new PVector(x,y);}
    
    WallInfo[] illuminate(ArrayList<Edge> edges){
        
        WallInfo[] distances = new WallInfo[rays];
        int index = 0;
        
        for(float angle = playerAngle-range/2; angle <= playerAngle+range/2; angle+=0.6){
            Ray ray = new Ray(pos, PVector.fromAngle(radians(angle)));
            Intersection closestIntersection = new Intersection(pos, map.mapWidth + map.mapHeight, -1);
            for(int j=0; j < edges.size(); j++){
                Intersection intersection = ray.testIntersection(convertToRay(edges.get(j)),edges.get(j).colour);
                if (intersection != null) if (intersection.distance < closestIntersection.distance) closestIntersection = intersection;
            }
            
            if (index != rays) {
                float distance = closestIntersection.point.copy().sub(pos).mag();
                distance *= cos(radians(angle-playerAngle));
                distances[index++] = new WallInfo(distance, closestIntersection.colour);
                if (drawMap) drawLine(pos,closestIntersection.point);
            }
        }
        return distances;
    }
    
    void drawLine(PVector v1, PVector v2){ stroke(0,0,255,100); line(v1.x, v1.y, v2.x, v2.y); }
    Ray convertToRay(Edge edge){return new Ray(edge.p1, edge.p2.copy().sub(edge.p1));}
}
