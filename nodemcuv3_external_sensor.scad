wireSlotLength = 11;
wireSlotWidth = 2;

include <YAPP_Box/YAPPgenerator_v3.scad>

showPCB = true;
showOrientation = false;

pcbLength = 59;
pcbWidth = 31.5;
pcbThickness = 2;
lidWallHeight = 8;
baseWallHeight = 22;
standoffHeight = 9;
standoffDiameter = 5;
standoffPinDiameter = 2.4;
standoffHoleSlack = 0.4;

pcb = [
  ["Main", pcbLength, pcbWidth, 0, 0, pcbThickness, standoffHeight, standoffDiameter, standoffPinDiameter, standoffHoleSlack],
];

pcbStands = 
[
  [3, 3, undef, undef, undef,undef, undef, 3.5],
  [3, pcbWidth-3, undef, undef, undef,undef, undef, 3.5],
  [pcbLength-3, 3, undef, undef, undef,undef, undef, 3.5],
  [pcbLength-3, pcbWidth-3, undef, undef, undef,undef, undef, 3.5],
];

snapJoins   =   
[
    [6, 5, yappLeft, yappRight],
   [55, 5, yappLeft, yappRight],
];



cutoutsBack = [
    [8, -7, 16, 7, 2, yappRoundedRect, yappCoordPCB, yappOrigin]
];

cutoutsFront = [
    [20, 2, wireSlotWidth, wireSlotLength, 2, yappRectangle, yappCoordPCB, yappOrigin]
];

echo(cutoutsFront);

cutoutsBase = [
   [ 28, 2, 20, 20, 14, yappCircle, shapeHexagon, maskOffsetBars, yappOrigin],
   [ pcbLength+8, 0, 8, pcbWidth, 4, yappRectangle, shapeHexagon, maskOffsetBars, yappOrigin]
];


module hookLidInside(){
  translate([pcbLength+2, 0, -lidWallHeight])
  {
    color("blue")
    {
      cube([4,pcbWidth+2,lidWallHeight]);
    }
  }
    
}

echo("Before generate");
echo(wireSlotWidth);
echo(wireSlotLength);

YAPPgenerate();