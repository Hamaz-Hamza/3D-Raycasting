class Intersection{
    PVector point;
    float distance;
    int colour;
    Intersection(PVector location, float dis, int c) {
        point = location.copy(); 
        distance = dis;
        colour = c;
    }
}
