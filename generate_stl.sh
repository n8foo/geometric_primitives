#! /bin/bash


PARTS='cube cone sphere rectangle rectangle2 rectangle3 prism pyramid cylinder sphere2p spherepin'
for PART in $PARTS
do
openscad \
  -D "output=\"${PART}\"" \
  -o $PART.stl \
  primitives.scad
done
