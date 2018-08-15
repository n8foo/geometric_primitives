output="cylinder";

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

module fillet (r=2) {
  percent=size/(size+r+r);
  scale([percent,percent,percent]) {
    translate([r,r,r]) {
      hull() {
        translate([0,0,r])
          children();
        translate([0,0,-r])
          children();
        translate([0,r,0])
          children();
        translate([0,-r,0])
          children();
        translate([r,0,0])
          children();
        translate([-r,0,0])
          children();
      }
    }
  }
}

if (output == "cube") {
  fillet(r=1)
    cube([size,size,size]);
} else if (output == "cone") {
  cylinder(h=1,d1=size-1,d2=size,$fn=100);
  translate([0,0,1])
    cylinder(h=(size*1.5)-1,d1=size,d2=2,$fn=100);
} else if (output == "sphere") {
  sphere(d=size,$fn=100);
} else if (output == "sphere2p") {
  sphere2p(diameter=size);
} else if (output == "spherepin") {
  cylinder(h=pinHeight,d=pinDiameter-.2,$fn=pinSides);
} else if (output == "rectangle") {
  fillet(r=1) cube([size,size,size*1.5]);
} else if (output == "rectangle2") {
  fillet(r=1) cube([size/2,size/2,size*1.5]);
} else if (output == "rectangle3") {
  fillet(r=1) cube([size/2,size,size*1.5]);
} else if (output == "prism") {
  fillet(r=1) cylinder(r=size*ETCR,h=size*1.5,$fn=3);
} else if (output == "pyramid") {
  fillet(r=1) cylinder(h=size*1.5,d1=size*SQR2,d2=2,$fn=4);
} else if (output == "cylinder") {
  cylinder(h=1,d1=size-2,d2=size,$fn=100);
  translate([0,0,1]) cylinder(h=size-2,d=size,$fn=100);
  translate([0,0,size-1]) cylinder(h=1,d1=size,d2=size-2,$fn=100);
}