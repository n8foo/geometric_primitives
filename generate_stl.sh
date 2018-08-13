#! /bin/bash


PARTS='cube cone sphere rectangle prism pyramid cylinder sphere2p spherepin'
for PART in $PARTS
do
openscad \
  -D "output=\"${PART}\"" \
  -o $PART.stl \
  primitives.scad
done
