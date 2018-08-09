#! /bin/bash


PARTS='cube cone sphere rectangle prism pyramid cylinder'
for PART in $PARTS
do
openscad \
  -D "output=\"${PART}\"" \
  -o $PART.stl \
  primitives.scad
done
