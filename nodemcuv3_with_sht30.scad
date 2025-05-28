include <YAPP_Box/YAPPgenerator_v3.scad>

showPCB = false;
showOrientation = false;

pcbLength = 59;
pcbWidth = 31.5;
pcbThickness = 2;
lidWallHeight = 8;
baseWallHeight = 25;
standoffHeight = 25;
standoffDiameter = 5;
standoffPinDiameter = 2.4;
standoffHoleSlack   = 0.4;

pcb = [
  ["Main", pcbLength, pcbWidth, 0, 0, pcbThickness, standoffHeight, standoffDiameter, standoffPinDiameter, standoffHoleSlack],
  ["Sensor", 13, 17,  pcbLength + 3.5, 0, 2, 0]
];

pcbStands = 
[
  [3, 3],
  [3, pcbWidth-3],
  [pcbLength-3, 3],
  [pcbLength-3, pcbWidth-3],
];

snapJoins   =   
[
    [6, 5, yappLeft, yappRight],
   [55, 5, yappLeft, yappRight],
];



cutoutsBack = 
[
    [8, -2,  16, 7, 2, yappRoundedRect, yappCoordPCB, yappOrigin]
];

cutoutsLid = 
[
   [ 30, 3, 20, 20, 12, yappCircle, shapeHexagon, maskHoneycomb, yappOrigin]
];
cutoutsLeft = 
[
    [pcbLength+2+3.5, 3.5, 0, 0, 3.5, yappCircle, yappCoordBoxInside, yappOrigin]
];



module hookBaseInside()
{
  translate([pcbLength+2, 0, (basePlaneThickness/2)])
  {
    color("blue")
    {
      cube([2,20,((basePlaneThickness/2)+baseWallHeight)]);
    }
  }
  
  translate([pcbLength+2, 22, (basePlaneThickness/2)])
  {
    color("blue")
    {
      cube([2,pcbWidth-20,((basePlaneThickness/2)+baseWallHeight)]);
    }
  }
  
  translate([pcbLength+3+10, 3, 0])
  {
    color("blue")
    {
      cube([2,15,10.5]);
    }
  }
  
  translate([pcbLength+3, 3, 0])
  {
    color("blue")
    {
      cube([10, 2 ,10.5]);
    }
  }
}
YAPPgenerate();