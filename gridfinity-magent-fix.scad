
filename = "sample_1x5.stl";

magnet_diameter = 6.1;
magnet_height = 2;

rows = 1;
cols = 5;

// 4.75 is the height of the base per gridfinity spec
additional_fill = 4.75-magnet_height;

/* [Hidden] */

unit_size = 42;

// generation of magnet hole
module magnet_hole(magnet_diameter, magnet_height) {
    fill_diameter = magnet_diameter+.6;
    fill_height = magnet_height+additional_fill;
    
    difference() {
        translate([0,0,fill_height/2])
        cylinder(d=fill_diameter,h=fill_height,$fn=360,center=true);
        
        translate([0,0,magnet_height/2])
        cylinder(d=magnet_diameter,h=magnet_height,$fn=360,center=true);
    }
}

// generate the magnets for a single unit
module unit_magnets(magnet_diameter, magnet_height) {
    // x/y offset of magnets from the center
    offset = 13;

    for(coord = [[offset,offset],[offset,-offset],[-offset,offset],[-offset,-offset]])
    {
        color("red")
        translate([coord.x,coord.y,0])
        magnet_hole(magnet_diameter, magnet_height);
    }
}

module unit_magnets_grid(rows, cols, filename="", magnet_diameter = magnet_diameter, magnet_height = magnet_height) {
    x_offset = (cols % 2 == 0 ? unit_size/2 : 0) - ( floor(cols/2) * unit_size );
    y_offset = (rows % 2 == 0 ? unit_size/2 : 0) - ( floor(rows/2) * unit_size );

    difference() {
        if (filename != "") import(filename);
        for (r = [0:rows-1]) {
            for (c = [0:cols-1]) {
                translate([x_offset,y_offset,0]) 
                translate([c*unit_size, r*unit_size, 0])
                unit_magnets(magnet_diameter, magnet_height);
            }
        }
    }
}

unit_magnets_grid(rows, cols, filename);