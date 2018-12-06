abstract class Interpolator
{
  Animation animation;
  
  // Where we at in the animation?
  float currentTime = 0;
  
  // To interpolate, or not to interpolate... that is the question
  boolean snapping = false;
  
  void SetAnimation(Animation anim)
  {
    animation = anim;
  }
  
  void SetFrameSnapping(boolean snap)
  {
    snapping = snap;
  }
  
  void UpdateTime(float time)
  {
    // TODO: Update the current time
    // Check to see if the time is out of bounds (0 / Animation_Duration) //<>//
    // If so, adjust by an appropriate amount to loop correctly
   

     if (currentTime + time >= animation.GetDuration()) { 
       currentTime = (currentTime+time)-animation.GetDuration(); 
     } 
     else { 
       currentTime += time; 
     } 
  }
  
  // Implement this in derived classes
  // Each of those should call UpdateTime() and pass the time parameter
  // Call that function FIRST to ensure proper synching of animations
  abstract void Update(float time);
}

class ShapeInterpolator extends Interpolator
{
  
  // The result of the data calculations - either snapping or interpolating
  PShape currentShape;
  
  // Changing mesh colors
  color fillColor;
  
  PShape GetShape()
  {
    return currentShape;
  }
  
  void Update(float time)
  {
    UpdateTime(time); 
    // TODO: Create a new PShape by interpolating between two existing key frames
    // using linear interpolation
     //currentShape = 
     KeyFrame nextT = new KeyFrame(); 
     KeyFrame prevT = new KeyFrame(); 
     
     // gives us keyframe shit 
     for (int j = 0; j < animation.keyFrames.size(); j++) { 
      
       // Keep track of the next keyframe
        KeyFrame tracker = animation.keyFrames.get(j+1); 
          
      if (tracker.time > currentTime) { 
          nextT = tracker;
          nextT.time = tracker.time; 
          prevT = animation.keyFrames.get(j);
          prevT.time = animation.keyFrames.get(j).time; 
          break; 
        } 

    }
    
    currentShape = createShape(); 
    currentShape.beginShape(TRIANGLES);
    
    float ratio = (currentTime - prevT.time) / (nextT.time - prevT.time); 

     currentShape.vertex(
        lerp(prevT.points.get(0).x, nextT.points.get(0).x, ratio), 
        lerp(prevT.points.get(0).y, nextT.points.get(0).y, ratio), 
        lerp(prevT.points.get(0).z, nextT.points.get(0).z, ratio)
        ); 
   
  }
}

class PositionInterpolator extends Interpolator
{
   //This is the current position, so the PVector in points arraylist
  PVector currentPosition;
  PVector number; 
   
  
  void Update(float time)
  {
    UpdateTime(time);  //<>//
    
    // The same type of process as the ShapeInterpolator class... except
    // this only operates on a single point
   
   //for (int i= 0; i < animation.keyFrames.size(); i++) { 
     KeyFrame nextT = new KeyFrame();  
     KeyFrame prevT = new KeyFrame(); 
   
   
     
     
     //We are going to iterate and find our previous and next keyframes
      for (int j = 0; j < animation.keyFrames.size(); j++) {  //<>//
      
       // Keep track of the next keyframe
        KeyFrame tracker = animation.keyFrames.get(j+1); 
          
      if (tracker.time > currentTime) { 
          nextT = tracker;
          nextT.time = tracker.time; 
          prevT = animation.keyFrames.get(j);
          prevT.time = animation.keyFrames.get(j).time; 
          break; 
        } 

    } 
    
      if(snapping == true) {  
        //currentPosition = new PVector(nextT.points.get(0).x,nextT.points.get(0).y,nextT.points.get(0).z); 
        currentPosition = prevT.points.get(0); 
      } 
 

    if (snapping == false) { 
  
      float ratio = (currentTime - prevT.time) / (nextT.time - prevT.time); 
 //<>//
     println("before: " + prevT.time + " after: " + nextT.time + " ratio: " + ratio);
        currentPosition = new PVector(
        lerp(prevT.points.get(0).x, nextT.points.get(0).x, ratio), 
        lerp(prevT.points.get(0).y, nextT.points.get(0).y, ratio), 
        lerp(prevT.points.get(0).z, nextT.points.get(0).z, ratio)
        ); 
  

        }
        
    
   
      } 
   
   }  
   

    
    
  
