
/* 2016.11.26 */

FlowField flowfield ;

ArrayList<Vehicle> vehicles ;

void setup() {
  
  size(640 , 360) ;
  
  flowfield = new FlowField(20) ;
  flowfield.init() ;
  
  vehicles = new ArrayList<Vehicle>() ;
  
  for(int i = 0 ; i < 10 ; i++) {
    vehicles.add( new Vehicle( 
                  new PVector(random(0 , width) , random(0 , height)) 
                             ) ) ;
  }
  
}

void draw() {
  background(255);
  
  flowfield.update() ;
  
  flowfield.display() ;
  
  for(Vehicle v : vehicles) {
    v.follow(flowfield) ;
    v.run() ;
  }
  
}
