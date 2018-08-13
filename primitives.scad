output="sphere2p";

// 2" = 50.8mm ; I like metric so 50mm works for me :-)
size=50;

// equilaterial triangle circcumcircle radius = rc
// rc = √3 / 3 = 0.57735026919 
ETCR=0.57735026919;
// square root of 2 = 1.41421356237
SQR2=1.41421356237;

// indexing pin
pinDiameter=10;
pinHeight=12;
pinSides=3;

// 2 piece sphere
module sphere2p(diameter) {
  difference() {
    sphere(d=diameter,$fn=100);
  
    union() {
      translate([0,0,-size/2])
        cube([size+1,size+1,size],center=true);
      //indexing pin
      cylinder(h=pinHeight+2,d=pinDiameter,$fn=pinSides,center=true);
    }
  }
}


if (output == "cube") {
  cube([size,size,size]);
} else if (output == "cone") {
  cylinder(h=size,d1=size,d2=0,$fn=100);
} else if (output == "sphere") {
  sphere(d=size,$fn=100);
} else if (output == "sphere2p") {
  sphere2p(diameter=size);
} else if (output == "spherepin") {
  cylinder(h=pinHeight,d=pinDiameter-.2,$fn=pinSides);
} else if (output == "rectangle") {
  cube([size,size,size*2]);
} else if (output == "prism") {
  cylinder(r=size*ETCR,h=size*2,$fn=3);
} else if (output == "pyramid") {
  cylinder(h=size,d1=size*SQR2,d2=0,$fn=4);
} else if (output == "cylinder") {
  cylinder(h=size,d=size,$fn=100);
}