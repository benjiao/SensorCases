wireSlotLength = 11;
wireSlotWidth = 2;

include <YAPP_Box/YAPPgenerator_v3.scad>

showPCB = true;
showOrientation = false;

pcbLength = 70;
pcbWidth = 90;
pcbThickness = 2;
lidWallHeight = 5;
baseWallHeight = 18;
standoffHeight = 2;
standoffDiameter = 8;
standoffPinDiameter = 2.4;
standoffHoleSlack = 0.4;
hideBaseWalls = true;
printLidShell = true;

pcb = [
  ["Main", pcbLength, pcbWidth, 0, 0, pcbThickness, standoffHeight, standoffDiameter, standoffPinDiameter, standoffHoleSlack],
  ["AQ Sensor", 38, 50, pcbLength + 5, 0, 21.1, standoffHeight, standoffDiameter, standoffPinDiameter, standoffHoleSlack]
];

pcbStands = 
[
  [2.5, pcbWidth-3, undef, undef, undef,undef, undef, 1.5],
  [pcbLength-2.5, pcbWidth-3, undef, undef, undef, undef, undef, 1.5],
  [pcbLength + 10, pcbWidth - 15, 10, yappBaseOnly, yappHole]
];

snapJoins   =   
[
    [12, 5, yappLeft, yappRight],
   [pcbLength-10, 5, yappLeft, yappRight],
];

cutoutsRight = [
];

cutoutsFront = [
    [0, 0, 50, 21, 3, yappRoundedRect] 
];

cutoutsBack = [
    [65, 4, 8, 0, 6, yappCircle, yappCoordPCB, yappOrigin],
];
cutoutsLid =  
[ [ 2, 2, 33, 60, 10, yappRectangle,maskOffsetBars], // Unshifted mask
    [pcbLength + 5, pcbWidth-35, 35, 30, 3, yappRoundedRect]                                //-- A
];
module hookBaseInside(){
  translate([pcbLength+2, 0, 2])
  {
    color("blue")
    {
      cube([3, 51+0.4,4]);
      
      translate([0, 51+0.4, 0])
        cube([42, 3, 4]);
    }
  }
}

echo("Before generate");
echo(wireSlotWidth);
echo(wireSlotLength);

YAPPgenerate();