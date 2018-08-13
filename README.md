# geometeric_primitives
Seven 3D geometric primitve shapes for educational use. Created in [OpenSCAD](http://openscad.org) in maybe 10 minutes. Equations for the [equilateral prism](https://rechneronline.de/pi/equilateral-triangle.php) here. :-) 

* sphere
* cone
* cube
* rectanble (2x cube)
* cylinder
* pyramid
* equilaterial prism

Update: Added 2 part sphere (sphere2p) with pin (spherepin) to align them.

Instructions:

The included STL files have 50mm sides. I printed everything with 20% infill except spherepin, which had none.

To make changes, you'll need to open `primitives.scad` file with OpenScad. Adjust the 'size' (in mm), which shape you want, then export as STL. If you've got the command line setup, you can run `./generate_stl.sh` to create them all automatically.

2" blocks would be 50.8mm. 

What you get:

![](preview.png)
