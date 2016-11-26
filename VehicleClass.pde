
/* 2016.11.26 
   From Daniel Shiffman's code
   Reynolds : www.red3d.com   
*/

class Vehicle {
  
  PVector location ; 
  PVector velocity ; 
  PVector acceleration ; 

  float r ; 
  float maxSpeed ; 
  float maxForce ; 

  Vehicle(PVector l)
  {
    location = l.get() ; 
    velocity = new PVector(0 , 0) ; 
    acceleration = new PVector(0 , 0) ; 

    r = 3.0 ; 
    maxSpeed = 4 ; 
    maxForce = 0.1 ; 
  }

  void run() {
    update() ;
    borders() ;
    display() ;
  }
  
  void update()
  {
    velocity.add(acceleration) ; 
    velocity.limit(maxSpeed) ; 
    location.add(velocity) ; 
    acceleration.mult(0) ; 
  }

  void applyForce(PVector force)
  {
    acceleration.add(force) ; 
  }

  void display()
  {
    float theta = velocity.heading2D() + PI / 2 ; 
    fill(175) ; 
    stroke(0) ; 
    pushMatrix() ; 
    translate(location.x , location.y) ; 
    rotate(theta) ; 
    beginShape() ; 
    vertex(0 , -r * 2) ; 
    vertex(-r , r * 2) ; 
    vertex(r , r * 2) ; 
    endShape(CLOSE) ; 
    popMatrix() ; 
  }

  void follow(FlowField flow) {
    
    PVector desired = flow.lookup(location) ;
    desired.mult(maxSpeed);
   
    PVector steer = PVector.sub(desired , velocity) ;
    steer.limit(maxForce) ;
    applyForce(steer);
    
  }
  
  void borders() {
    if(location.x < -r) location.x = width  + r ;
    if(location.y < -r) location.y = height + r ;
    if(location.x > width  + r) location.x = -r ;
    if(location.y > height + r) location.y = -r ;
  }
  
}
