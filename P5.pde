// VertexAnimation Project - Student Version //<>// //<>//
import java.io.*;
import java.util.*;
import java.io.IOException; 
import java.io.FileReader; 

float posX, posY, posZ; 
PVector camPos; 

float sX = -0.5; 
float sY = 0.5; 
float sZ = 0.5; 
float rad = 1; 
int value = 0;  //<>//
boolean snap; 

Camera camera = new Camera(); 
/*========== Monsters ==========*/
Animation monsterAnim = ReadAnimationFromFile("monster.txt"); //<>//
ShapeInterpolator monsterForward = new ShapeInterpolator();
ShapeInterpolator monsterReverse = new ShapeInterpolator();
ShapeInterpolator monsterSnap = new ShapeInterpolator();

/*========== Sphere ==========*/
Animation sphereAnim = ReadAnimationFromFile("sphere.txt"); 
Animation spherePos; // Create manually
ShapeInterpolator sphereForward = new ShapeInterpolator();
PositionInterpolator spherePosition = new PositionInterpolator();




// TODO: Create animations for interpolators
ArrayList<PositionInterpolator> cubes = new ArrayList<PositionInterpolator>();

void setup()
{
  //pixelDensity(2);
  size(1200, 800, P3D);

  /*====== Load Animations ======*/
  monsterAnim = ReadAnimationFromFile("monster.txt");
  sphereAnim = ReadAnimationFromFile("sphere.txt");

  monsterForward.SetAnimation(monsterAnim);
  monsterReverse.SetAnimation(monsterAnim);
  monsterSnap.SetAnimation(monsterAnim);  
  monsterSnap.SetFrameSnapping(true);

  sphereForward.SetAnimation(sphereAnim);

  /*====== Create Animations For Cubes ======*/
  // When initializing animations, to offset them
  // you can "initialize" them by calling Update()
  // with a time value update. Each is 0.1 seconds
  // ahead of the previous one



  for (int i=0; i < 11; i++) { 
    Animation cubeAnim = new Animation(); 
    PositionInterpolator cubePos = new PositionInterpolator();
    int xpos = -100 + (i*20); 
    KeyFrame kf1 = new KeyFrame(); 
    PVector p = new PVector(xpos, 0, 0); 
    // The points have been added to the keyframe array 
    kf1.points.add(p); 
    // We added the time of the keyframe! 
    kf1.time = 0.5; 
    cubeAnim.keyFrames.add(kf1);
    //cubePos.Update(0); 

    // Second position KeyFrame[1]
    KeyFrame kf2 = new KeyFrame(); 
    p = new PVector(xpos, 0, -100); 
    kf2.points.add(p);
    kf2.time = 1; 
    cubeAnim.keyFrames.add(kf2); 
    

    // Third position KeyFrame[2]
    KeyFrame kf3 = new KeyFrame(); 
    p = new PVector(xpos, 0, 0); 
    kf3.points.add(p); 
    kf3.time = 1.5; 
    cubeAnim.keyFrames.add(kf3); 
    

    // Fourth position KeyFrame[3]
    KeyFrame kf4 = new KeyFrame(); 
    p = new PVector(xpos, 0, 100); 
    kf4.points.add(p); 
    kf4.time = 2; 
    //cubePos.Update(6); 
    cubeAnim.keyFrames.add(kf4);  
    
    cubePos.SetAnimation(cubeAnim); 
    cubes.add(cubePos);
    
    if ((i%2)==0) { 
      
      cubePos.SetFrameSnapping(true);
       
    } 
    else { 
      cubePos.SetFrameSnapping(false); 
 
    } 
  } 




  /*====== Create Animations For Spheroid ======*/
  Animation spherePos = new Animation();

   //First positoin KeyFrame[0] (sphere)
   KeyFrame s1 = new KeyFrame(); 
   ArrayList<PVector> points = new ArrayList<PVector>();
     PVector p = new PVector(-100,0,-100); 
   // The points have been added to the keyframe array 
   s1.points.add(p); 
   // We added the time of the keyframe! 
   s1.time = 0.5; 
   spherePos.keyFrames.add(s1);
   //cubePos.Update(0); 

  // Second position KeyFrame[1] (sphere)
  KeyFrame s2 = new KeyFrame(); 
  points = new ArrayList<PVector>();
  p = new PVector(100,0,-100); 
  s2.points.add(p);
  s2.time = 1; 
  spherePos.keyFrames.add(s2); 


   //Third position KeyFrame[2] (sphere)
  KeyFrame s3 = new KeyFrame(); 
  points = new ArrayList<PVector>();
  p = new PVector(100,0,100); 
  s3.points.add(p); 
  s3.time = 1.5; 
  spherePos.keyFrames.add(s3); 


  // Fourth position KeyFrame[3] (sphere)
  KeyFrame s4 = new KeyFrame(); 
  points = new ArrayList<PVector>();
  p = new PVector(-100,0,100); 
  s4.points.add(p); 
  s4.time = 2; 
  spherePos.keyFrames.add(s4); 

  // Create and set keyframes
  spherePosition.SetAnimation(spherePos);
}

void draw()
{
  lights();
  background(0);
  DrawGrid();

  float playbackSpeed = 0.005f;

  // TODO: Implement your own camera
  camera.Update(); 
  camera(camera.cameraPosition.x, camera.cameraPosition.y, camera.cameraPosition.z, camera.LookatTarget.x, camera.LookatTarget.y, camera.LookatTarget.z, 0, 1, 0); 


  /*====== Draw Forward Monster ======*/
  //pushMatrix();
  //translate(-40, 0, 0);
  //monsterForward.fillColor = color(128, 200, 54);
  //monsterForward.Update(playbackSpeed);
  //shape(monsterForward.currentShape);
  //popMatrix();

  /*====== Draw Reverse Monster ======*/
  /*
  pushMatrix();
   translate(40, 0, 0);
   monsterReverse.fillColor = color(220, 80, 45);
   monsterReverse.Update(-playbackSpeed);
   shape(monsterReverse.currentShape);
   popMatrix();
   */
  /*====== Draw Snapped Monster ======*/
  /*
  pushMatrix();
   translate(0, 0, -60);
   monsterSnap.fillColor = color(160, 120, 85);
   monsterSnap.Update(playbackSpeed);
   shape(monsterSnap.currentShape);
   popMatrix();
   */
  /*====== Draw Spheroid ======*/
  /*
  spherePosition.Update(playbackSpeed);
   sphereForward.fillColor = color(39, 110, 190);
   sphereForward.Update(playbackSpeed);
   PVector pos = spherePosition.currentPosition;
   pushMatrix();
   translate(pos.x, pos.y, pos.z);
   shape(sphereForward.currentShape);
   popMatrix();
   */

  /*====== TODO: Update and draw cubes ======*/
  // For each interpolator, update/draw
  
  for (PositionInterpolator c : cubes) {  //<>//
    c.Update(playbackSpeed); 
    
    PVector p = c.currentPosition; 
    noStroke(); 
    if (c.snapping == true) { 
      fill(#FEFF00); 
    } 
    else if (c.snapping ==false) { 
      fill(255,0,0); 
    } 
    pushMatrix();
    translate(p.x, p.y, p.z); 
    box(10); 
    popMatrix();
  }
} 



void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  // Zoom the camera
  //println(e);
  camera.Zoom(e);
}

// Create and return an animation object
Animation ReadAnimationFromFile(String fileName)
{

  Animation animation = new Animation();
  
  try { 
    
     BufferedReader reader = createReader(fileName); 
     int totalframes = Integer.parseInt(reader.readLine()); 
     int verticePerFrame = Integer.parseInt(reader.readLine()); 
     
   for (int i=0; i < totalframes; i++) { 
     KeyFrame keyf = new KeyFrame(); 
     keyf.time = Float.parseFloat(reader.readLine()); 
   } 
  } 
  
  catch (FileNotFoundException ex)
   {
     println("File not found: " + fileName);
   }
   catch (IOException ex)
   {
    ex.printStackTrace();
   }

  return animation;
} 
void DrawGrid()
{
  // TODO: Draw the grid
  // Dimensions: 200x200 (-100 to +100 on X and Z)
  for (int i=-100; i< 101; i++) { 
    stroke(255); 
    line(i, 0, 100, i, 0, -100); 
    i+=10;
  } 

  for (int j=-100; j< 101; j++) { 
    stroke(255); 
    line(100, 0, j, -100, 0, j); 
    j+=10;
  } 
  stroke(255, 0, 0);
  strokeWeight(3); 
  line(0, 0, 100, 0, 0, -100); 

  stroke(0, 0, 255); 
  strokeWeight(3); 
  line(100, 0, 0, -100, 0, 0);
}


/*
try
  {
   BufferedReader reader = createReader(fileName); 

   int totalframes = Integer.parseInt(reader.readLine()); 
   int verticePerFrame = Integer.parseInt(reader.readLine()); 
   for (int i=0; i < totalframes; i++) { 
     KeyFrame keyf = new KeyFrame(); 
     keyf.time = Float.parseFloat(reader.readLine()); 
    for (int j=0; i < verticePerFrame; j++) { 
       String[] line = reader.readLine().split(" "); 
       float x = Float.parseFloat(line[0]); 
       float y = Float.parseFloat(line[1]); 
       float z = Float.parseFloat(line[2]); 
       PVector xyz = new PVector(x,y,z); 
       keyf.points.add(xyz); 
     } 
     animation.keyFrames.add(keyf);
    }
   }


   catch (FileNotFoundException ex)
   {
     println("File not found: " + fileName);
   }
   catch (IOException ex)
   {
    ex.printStackTrace();
   }

  return animation;
  */
