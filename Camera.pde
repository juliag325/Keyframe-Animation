/* 
Calculate coordinates: 
x=r*cos(phi)*sin(theta)
y=r*cos(theta)
z=r*sin(theta)*sin(phi)
*/ 

/*STEPS: 
  1. Create instance of the camera
  2. add look at targets in the setup function. 
  3. call update in the draw function to update the position. 
 */  


public class Camera { 
 
 float radius = 100;
  float phi = map(mouseX,0,width-1,0,360); 
 float theta = map(mouseY,0,height-1,1,179); 
 float x = radius*(cos(phi))*(sin(theta)); 
 float y= radius*cos(theta); 
 float z = radius*(sin(theta))*(sin(phi)); 
 float e; 
 float derivedX, derivedY, derivedZ;
 PVector LookatTarget = new PVector(0,0,0); 
 PVector cameraPosition = new PVector(x,y,z);  
 PVector lookatTarget = new PVector(0,0,0); 
 float scaleFactor; 
 int value;
 ArrayList<PVector> shapes = new ArrayList<PVector>(); 
 int index = 0; 

 

 
 Camera() { 
   float x = 0; 
   float y= 0; 
   float z = 0; 
   float radius = 100; 
 
 } 

 

 void Update() { 
    //Call within draw function, calculate values to pass to camera() function. 
    //camera(positionX,positionY, positionZ,target.x,target.y,target.z,0,1,0); 
    // Need to calculate camera position first. base on mouse. 
  float radius = 100;  
 float phi = map(mouseX,0,width-1,0,360); 
 float theta = map(mouseY,0,height-1,1,179); 
 float x = radius*(cos(phi))*(sin(theta)); 
 float y= radius*cos(theta); 
 float z = radius*(sin(theta))*(sin(phi)); 

    
    // the radius is the camera's offset from the target. 

  
   if (mousePressed == true) { 
    cameraPosition.x = LookatTarget.x + x; 
    cameraPosition.y = LookatTarget.y + y; 
    cameraPosition.z = LookatTarget.z + z;  
   
  } 
     else { 
     cameraPosition.x = LookatTarget.x + derivedX;
     cameraPosition.y = LookatTarget.y + derivedY;
     cameraPosition.z = LookatTarget.z +  derivedZ;
     } 
   
  } 
  
  
  
 PVector AddLookAtTarget(PVector lookatTarget) { 
   shapes.add(lookatTarget); 
   
   return shapes.get(index); 
 } 
 
 void CycleTarget() { 
   //Iterate to next target on the list. 
   LookatTarget = AddLookAtTarget(lookatTarget); 
   
   index++; 
   
   if (index > shapes.size()) {
     index = 0; 
   } 
     
   
 }
 


 void Zoom(float e) {
   // Move toward or away from the target.
   //Use mouse scroll. 
   
   if (e >= -1.0) { 
     
     derivedX +=10; 
     derivedY +=10; 
     derivedZ +=10; 
   
   
   }
   else if (e <= 1.0) {   
     derivedX -=10; 
     derivedY -= 10; 
     derivedZ -=10;  
     
    
   } 
   
 } 
 

  
   
} 
