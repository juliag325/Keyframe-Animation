// Snapshot in time of some amount of data
class KeyFrame
{
  // Where does this thing occur in the animation?
  public float time;
  
  // Because translation and vertex positions are the same thing, this can
  // be reused for either. An array of one is perfectly viable.
  // These are the vector positions 
  public ArrayList<PVector> points = new ArrayList<PVector>();
  
}

class Animation
{
  // Animations start at zero, and end... here
  float GetDuration()
  {
    return keyFrames.get(keyFrames.size()-1).time;
  }
  // This is the array of keyframes. 
  public ArrayList<KeyFrame> keyFrames = new ArrayList<KeyFrame>();
}
