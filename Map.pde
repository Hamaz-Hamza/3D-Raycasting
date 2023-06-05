class Map{
    ArrayList<Edge> edges;
    PVector origin;
    int mapWidth;
    int mapHeight;
    
    Map(PVector origin, int mapWidth, int mapHeight){
        this.origin = origin;
        this.mapWidth = mapWidth;
        this.mapHeight = mapHeight;
        edges = new ArrayList<Edge>();
        edges.add(new Edge(origin, new PVector(origin.x + mapWidth-1,origin.y)));
        edges.add(new Edge(origin, new PVector(origin.x,origin.y + mapHeight-1)));
        edges.add(new Edge(new PVector(origin.x + mapWidth-1,origin.y), new PVector(origin.x + mapWidth-1,origin.y + mapHeight-1)));
        edges.add(new Edge(new PVector(origin.x,origin.y + mapHeight-1), new PVector(origin.x + mapWidth-1,origin.y + mapHeight-1)));
    }
    
    void draw(){for(Edge edge : edges) edge.draw();}
}
        
