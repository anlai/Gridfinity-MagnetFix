# Gridfinity-MagnetFix

OpenSCAD tool to adjust the magnet hole tolerances for Gridfinity parts to better fit tolerances of magnet sizes and printer accuracy.

Allows you to shrink or enlarge the holes with just the STL files.  Biggest reason for wanting to do this is to print parts so magnets can be pressed fit instead of requiring glue or adding magnet holes to models that didn't include them in the first place

## Usage

Download the scad file into a directory, and place any STL files for which you want to fix the magnet sizing.

Note that models must be centered in the STL file otherwise the magnet positions won't line up with the correct position.  The easiest way I've found is to import into Cura, right-click and center the model, then export the single model.

Once you have the scad file, centered model file in the same folder:

1. Open gridfinity-magnet-fix.scad file
2. Open customizer window in OpenSCAD
3. Fill out the settings:
  - filename: full filename of the model to fix
  - magnet diameter: diameter in mm of the cavity for the magnet
  - magnet height: height in mm of the cavity for the magnet
  - rows: # of rows (along the y-axis)
  - cols: # of cols (along the x-axis)
4. Render the updated model (F6)
5. Export the updated model (F7)