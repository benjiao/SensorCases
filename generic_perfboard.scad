wireSlotLength = 11;
wireSlotWidth = 2;

include <YAPP_Box/YAPPgenerator_v3.scad>

showPCB = true;
showOrientation = false;

pcbLength = 70;
pcbWidth = 90;
pcbThickness = 2;
lidWallHeight = 20;
baseWallHeight = 15;
standoffHeight = 2;
standoffDiameter = 8;
standoffPinDiameter = 2.4;
standoffHoleSlack = 0.4;
hideBaseWalls = true;
printLidShell = true;

pcb = [
  ["Main", pcbLength, pcbWidth, 0, 0, pcbThickness, standoffHeight, standoffDiameter, standoffPinDiameter, standoffHoleSlack]
];

pcbStands = 
[
  [2.5, 3, undef, undef, undef,undef, undef, 1.5],
  [2.5, pcbWidth-3, undef, undef, undef,undef, undef, 1.5],
  [pcbLength-2.5, 3, undef, undef, undef,undef, undef, 1.5],
  [pcbLength-2.5, pcbWidth-3, undef, undef, undef,undef, undef, 1.5],
  [pcbLength-2.5, pcbWidth-3, undef, undef, undef,undef, undef, 1.5],
];

snapJoins   =   
[
    [12, 5, yappLeft, yappRight],
   [pcbLength-10, 5, yappLeft, yappRight],
];

cutoutsRight = [
    [55, 15, 8, 12, 6, yappRoundedRect, yappCoordPCB, yappOrigin]
];

cutoutsFront = [
];

cutoutsBack = [
    [15, 4, 8, 0, 6, yappCircle, yappCoordPCB, yappOrigin],
    [50, 5, 35, 8, 2, yappRoundedRect, yappCoordPCB, yappOrigin]
];


module hookBaseInside(){
  translate([pcbLength+2, 0, 2])
  {
    color("blue")
    {
      cube([3,pcbWidth+2,4]);
    }
  }
    
}

echo("Before generate");
echo(wireSlotWidth);
echo(wireSlotLength);

YAPPgenerate();
