// ---------- PRINT

//base();
//translate([-30, 52]) armholder();
//translate([0, 70]) armholder();
//translate([43, 45.5, 0]) grip();
//translate([0, 105]) espholder();
//translate([0, -65, 0]) color("blue") servo();
//
//% translate([17, 120-26/2, 30]) rotate([0, 0, 0]) color("grey") esp();
//
////// ---------- TEST
//
translate([-80, 0, 0]) grip();
translate([140, 0, 12]) rotate([180, 0, 0]) base();
translate([180-27.5-10, -15+10, 12]) rotate([0, -90, 0]) armholder();
//translate([127, -15+10, 12]) rotate([0, -90, 0]) espholder();
//
//translate([122.5, -12.4/2+10, 78.25]) rotate([0, 90, 0]) servo();
////translate([124, -3, 29]) rotate([0, -90, 0]) color("grey") esp();
//
//translate([180, -5, 12]) color([0.3, 0.3, 0.3], 0.3) cube([10, 10, 60]);


module grip() {
    rot = 20;
    
    difference() {
        union() {
            cylinder($fn=32, d=20.8+1.2*2+.1, h=9+3);
        }
        
        // topside
        difference() {
            translate([0, 0, 5]) cylinder($fn=32, d=20.8, h=10);
            translate([-20/2, 9.5, 5]) cube([20, 10, 10]);
            translate([-20/2, -10-9.5, 5]) cube([20, 10, 10]);
        }
//        translate([0, -5, 8.5]) rotate([90, 0, 0]) cylinder($fn=32, d=2.3, h=10);
        translate([0, 0, 4]) cylinder($fn=32, d=12+.3, h=10);
        rotate([0, 0, -90-45-rot]) translate([0, -5.5/2, 5]) cube([20, 5.5, 10]);
        rotate([0, 0, +45-rot]) translate([0, -5.5/2, 5]) cube([20, 5.5, 10]);
        
        // underside
        translate([0, 0, -1]) cylinder($fn=32, d=7+.6, h=1+3);
        hull() {
            translate([0, 0, -1]) cylinder($fn=32, d=5.3+.6, h=1+3);
            translate([14, 0, -1]) cylinder($fn=32, d=4.0+.6, h=1+3);
            translate([-14, 0, -1]) cylinder($fn=32, d=4.0+.6, h=1+3);
        }
    }
}

module base() {
    diam = 100;
    w = 2.0+.1;
    height = 10;
        
    difference() {
        union() {
            
            difference() {
                union() {
                    cylinder($fn=128, h=height, d=diam);
                }
                
                translate([0, 0, 1.2]) cylinder($fn=128, h=height, d=diam-2*w);
            } 
            
            translate([-16/2, +15-4]) block(16, 8, 3, crad=1);
        }
            
        // opening
        translate([-30.6-.2, -14/2-10, -1]) block(16, 14, 10, crad=1);
        
        // screw hole cat
        translate([0, -40, -1]) cylinder($fn=32, d=2, h=10);
        
        // screw hole arm holder 
        translate([9.5-2.5-10, 9.5-10, -1]) cylinder($fn=32, d=3.3, h=10);
        translate([9.5-2.5-10, -9.5-10, -1]) cylinder($fn=32, d=3.3, h=10);
        
        // screw hole esp holder 
        translate([-28.5+10, 12.5-10, -1]) cylinder($fn=32, d=3.3, h=10);
        translate([-28.5+10, -12.5-10, -1]) cylinder($fn=32, d=3.3, h=10);
        
        // usb cable
        hull() {
            translate([0, -1, 6]) rotate([90, 0, 0]) cylinder($fn=32, d=5.5, h=100);
            translate([0, -1, height+3]) rotate([90, 0, 0]) cylinder($fn=32, d=5.5, h=100);
        }
        
        // cable fastener
        translate([-8/2, +15, -1]) rotate([0, 0, 0]) {
            cylinder($fn=32, d=3.3, h=10);
            translate([8, 0]) cylinder($fn=32, d=3.3, h=10);
        }
    } 
}


module armholder() {
    length = 72;
    crad = 10;
    
    difference() {
       union() {
            hull() {
                cube([1, 30, 1.8]);
                translate([length/2, +30-crad/2]) cylinder($fn=32, d=crad, h=1.8);
                translate([length/2, +00+crad/2]) cylinder($fn=32, d=crad, h=1.8);
                translate([length-crad/2, 30-5-crad/2]) cylinder($fn=32, d=crad, h=1.8);
                translate([length-crad/2, 5+crad/2]) cylinder($fn=32, d=crad, h=1.8);
            }
            
            translate([0, 30]) rotate([90, 0, 0]) linear_extrude(height=30) polygon([[0, 0], [10, 0], [4, 10], [0, 10]]);
        }
        
        // servo hole
        translate([43.25, 30/2-12.5/2, -1]) cube([22.7+0.5, 12+0.5, 10]);
        translate([43.25-2.1, 30/2, -1]) cylinder($fn=32, d=2.3, h=10);
        translate([43.25+(22.7+0.5)+2.1, 30/2, -1]) cylinder($fn=32, d=2.3, h=10);
        
        // screw hole
        translate([10-1, 5.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, 5.5, 5.5]) rotate([0, -90, 0]) rotate([0, 0, 30]) cylinder($fn=6, d=6.7, h=10);
        translate([10-1, 30-5.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, 30-5.5, 5.5]) rotate([0, -90, 0]) rotate([0, 0, 30]) cylinder($fn=6, d=6.7, h=10);
    }
}


module espholder() {
    length=75;
    h = 1.8;
    
    difference() {
        union() {
            hull() {
                cube([1, 30, 1.8]);
                translate([length, +30-8/2]) cylinder($fn=32, d=8, h=h);
                translate([length, +00+8/2]) cylinder($fn=32, d=8, h=h);
            }
            
            hull() {
                translate([8, -3, 0]) cube([2, 36, 1.8]);
                translate([12, 0, 0]) cube([1, 30, 1.8]);
            }
            
            // spacer
            translate([75-1.75, 0]) color("green")          block(5.75, 4.75, 2+h, crad=1);
            translate([75-1.75, 30-4.75]) color("green")    block(5.75, 4.75, 2+h, crad=1);
            translate([23.75, 0]) color("green")            block(5.75, 4.75, 2+h, crad=1);
            translate([23.75, 30-4.75]) color("green")      block(5.75, 4.75, 2+h, crad=1);
            
            translate([0, 36-3]) rotate([90, 0, 0]) linear_extrude(height=36) polygon([[0, 0], [10, 0], [4, 10], [0, 10]]);
        }
        
        // screw hole mount
        translate([10-1, -2+4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, -2+4.5, 5.5]) rotate([0, -90, 0]) rotate([0, 0, 30]) cylinder($fn=6, d=6.7, h=10);
        translate([10-1, 2+30-4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, 2+30-4.5, 5.5]) rotate([0, -90, 0]) rotate([0, 0, 30]) cylinder($fn=6, d=6.7, h=10);
        
        // esp screw
        translate([75-(49-5)-1.5, 4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        translate([75-1.5, 4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        translate([75-1.5, 30-4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        translate([75-(49-5)-1.5, 30-4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        
        // sockets
        translate([31.5, -4, -1]) block(40, 10, 10, crad=1);
        translate([31.5, 30-10+4, -1]) block(40, 10, 10, crad=1);
        
        // usb
        translate([09, 30/2-14/2, 1.8]) rotate([0, -90]) block(20, 14, 20, crad=1);
    }
}

module servo() {
    difference() {
        union() {
            block(22.8, 12.4, 23, crad=1);
            translate([-(32.3-22.8)/2, 0, 16]) color([0.3, 0.3, 0.3]) block(32.3, 12.4, 2.5, crad=1);
            translate([12.4/2, 12.4/2, 23]) cylinder($fn=32, d=12.4, h=4.2);
            
            // axis
            translate([12.4/2, 12.4/2, 23]) color("white") cylinder($fn=32, d=4, h=6);
            
            // cable
            translate([-4, 12.4/2-3.7/2, 0.5]) color([0.3, 0.3, 0.3], 0.3) cube([5, 3.7, 1]);
        }
        translate([-2.30, 12.4/2, 10]) cylinder($fn=32, d=2.7, h=30);
        translate([22.8+2.30, 12.4/2, 10]) cylinder($fn=32, d=2.7, h=30);
    }
}

module esp() {
    difference() {
        block(49, 26, 2, crad=2);
        
        translate([2.5, 2.5, -1]) cylinder($fn=32, d=2, h=10);
        translate([49-2.5, 2.5, -1]) cylinder($fn=32, d=2, h=10);
        translate([2.5, 26-2.5, -1]) cylinder($fn=32, d=2, h=10);
        translate([49-2.5, 26-2.5, -1]) cylinder($fn=32, d=2, h=10);
    }
} 

// ------------------------------------------------------------------------------------------


module block(width, depth, height, crad=3, red=0) {
    hull() {    
        translate([crad, crad]) cylinder($fn=32, h=height, r=crad-red);
        translate([width-crad, crad]) cylinder($fn=32, h=height, r=crad-red);
        translate([crad, depth-crad]) cylinder($fn=32, h=height, r=crad-red);
        translate([width-crad, depth-crad]) cylinder($fn=32, h=height, r=crad-red);
    }
}
