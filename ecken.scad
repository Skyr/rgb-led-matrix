wall = 1.5;
height = 87.5;
width = 20;
screwhole_diam = 8;
baseplate_screw_diam = 2.7;
powerplug_diam = 7.6;


module corner() {
    translate([-wall,-wall,0]) cube([width+wall,wall,height]);
    rotate([0,0,90]) cube([width,wall,height]);
}

difference() {
    corner();
    klammer_diam=4;
    distance=15;
    translate([width/2,0,33]) rotate([90,0,0]) cylinder(d=powerplug_diam, h=wall, $fn=32);
    translate([width/2,0,distance]) rotate([90,0,0]) cylinder(d=klammer_diam, h=wall, $fn=32);
    translate([width/2,0,height-distance]) rotate([90,0,0]) cylinder(d=klammer_diam, h=wall, $fn=32);
    translate([-wall,width/2,distance]) rotate([90,0,90]) cylinder(d=klammer_diam, h=wall, $fn=32);
    translate([-wall,width/2,height-distance]) rotate([90,0,90]) cylinder(d=klammer_diam, h=wall, $fn=32);
}

difference() {
    linear_extrude(wall) {
        polygon([
            [0,0],
            [width,0],
            [0,width]
        ]);
    }
    min_dist = width/4;
    max_dist = width/3;
    translate([min_dist, min_dist, 0]) cylinder(d=screwhole_diam, h=wall, $fn=32);
    translate([min_dist, min_dist-screwhole_diam/2, 0]) cube([max_dist-min_dist, screwhole_diam, wall]);
    translate([max_dist, min_dist, 0]) cylinder(d=screwhole_diam, h=wall, $fn=32);
    translate([max_dist, min_dist, 0]) cylinder(d=screwhole_diam, h=wall, $fn=32);
}

translate([0,0,50]) difference() {
    translate([0,0,-width]) linear_extrude(width) {
        polygon([
            [0,0],
            [width,0],
            [0,width]
        ]);
    }
    rotate([0,0,-45]) translate([0,width*sqrt(2)/2,-wall]) rotate([40,0,0]) translate([-width*2,-width*4,-width*4]) cube([width*4,width*4,width*4]);
    translate([7,7,-5]) cylinder(d=baseplate_screw_diam, h=5, $fn=32); 
}