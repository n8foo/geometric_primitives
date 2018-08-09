output="prism";

// 2" = 50.8mm ; I like metric so 50mm works for me :-)
size=50;

// equilaterial triangle circcumcircle radius = rc
// rc = √3 / 3 = 0.57735026919 
ETCR=0.57735026919;
// square root of 2 = 1.41421356237
SQR2=1.41421356237;


if (output == "cube") {
  cube([size,size,size]);
} else if (output == "cone") {
  cylinder(h=size,d1=size,d2=0,$fn=100);
} else if (output == "sphere") {
  translate([0,0,size/2])
  sphere(d=size,$fn=100);
} else if (output == "rectangle") {
  cube([size,size,size*2]);
} else if (output == "prism") {
  cylinder(r=size*ETCR,h=size*2,$fn=3);
} else if (output == "pyramid") {
  cylinder(h=size,d1=size*SQR2,d2=0,$fn=4);
} else if (output == "cylinder") {
  cylinder(h=size,d=size,$fn=100);
}