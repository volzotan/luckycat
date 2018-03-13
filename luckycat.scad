// ---------- PRINT

base();
translate([0, 70]) armholder();
translate([0, 105]) espholder();
translate([0, -65, 0]) color("blue") servo();

% translate([17, 120-26/2, 30]) rotate([0, 0, 0]) color("grey") esp();

// ---------- TEST

translate([-80, 0, 0]) grip();
translate([140, 0, 12]) rotate([180, 0, 0]) base();
translate([190-27.5, -30/2, 12]) rotate([0, -90, 0]) armholder();
translate([120, +30/2, 12]) rotate([0, -90, 180]) espholder();

translate([145, -12.4/2, 66.25]) rotate([0, 90, 0]) servo();
translate([140, -26/2, 30]) rotate([0, -90, 0]) color("grey") esp();

translate([180, -5, 0]) color([0.3, 0.3, 0.3], 0.3) cube([10, 10, 60]);


module grip() {
    difference() {
        union() {
            cylinder($fn=32, d=24.1, h=9+3);
        }
        
        // topside
        translate([0, 0, 5]) cylinder($fn=32, d=20, h=10);
        translate([0, 0, 4]) cylinder($fn=32, d=12+.3, h=10);
        rotate([0, 0, 90+45]) translate([0, -5.5/2, 5]) cube([20, 5.5, 10]);
        rotate([0, 0, -45]) translate([0, -5.5/2, 5]) cube([20, 5.5, 10]);
        
        
        // underside
        translate([0, 0, -1]) cylinder($fn=32, d=7+.3, h=1+3);
        hull() {
            translate([0, 0, -1]) cylinder($fn=32, d=5.3+.3, h=1+3);
            translate([14, 0, -1]) cylinder($fn=32, d=4.0+.3, h=1+3);
            translate([-14, 0, -1]) cylinder($fn=32, d=4.0+.3, h=1+3);
        }
    }
}

module base() {
    diam = 100;
    w = 2.0+.1;
    
    difference() {
        union() {
            cylinder($fn=64, h=1.2, d=diam);
            cylinder($fn=64, h=12, d=diam);
        }
        
        translate([0, 0, 1.2]) cylinder($fn=64, h=12, d=diam-2*w);
        
        // opening
//        translate([0, 0, -1]) cylinder($fn=32, h=10, d=30);
        translate([-18-.2, -12/2, -1]) block(20, 12, 10, crad=3);
        
        // screw hole cat
        translate([0, -40, -1]) cylinder($fn=32, d=2, h=10);
        
        // screw hole arm holder 
        translate([19.5-2.5, 10.5, -1]) cylinder($fn=32, d=3.3, h=10);
        translate([19.5-2.5, -10.5, -1]) cylinder($fn=32, d=3.3, h=10);
        
        // screw hole esp holder 
        translate([-19.5+5, 11.5, -1]) cylinder($fn=32, d=3.3, h=10);
        translate([-19.5+5, -11.5, -1]) cylinder($fn=32, d=3.3, h=10);
        
        // usb cable
        hull() {
            translate([0, -1, 6]) rotate([90, 0, 0]) cylinder($fn=32, d=5.5, h=100);
            translate([0, -1, 12+3]) rotate([90, 0, 0]) cylinder($fn=32, d=5.5, h=100);
        }
    } 
}


module armholder() {
    length = 60;
    
    difference() {
       union() {
            hull() {
                cube([1, 30, 1.8]);
                translate([length, +30-8/2]) cylinder($fn=32, d=8, h=1.8);
                translate([length, +00+8/2]) cylinder($fn=32, d=8, h=1.8);
            }
            
            translate([0, 30]) rotate([90, 0, 0]) linear_extrude(height=30) polygon([[0, 0], [10, 0], [4, 10], [0, 10]]);
        }
        
        // servo hole
        translate([31.25, 30/2-12.5/2, -1]) cube([22.7+0.5, 12+0.5, 10]);
        translate([31.25-2.1, 30/2, -1]) cylinder($fn=32, d=2, h=10);
        translate([31.25+(22.7+0.5)+2.1, 30/2, -1]) cylinder($fn=32, d=2, h=10);
        
        // screw hole
        translate([10-1, 4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, 4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=6, d=6.7, h=10);
        translate([10-1, 30-4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, 30-4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=6, d=6.7, h=10);
    }
}

module espholder() {
    length=65;
    h = 1.8;
    
    difference() {
        union() {
            hull() {
                cube([1, 30, 1.8]);
                translate([length, +30-8/2]) cylinder($fn=32, d=8, h=h);
                translate([length, +00+8/2]) cylinder($fn=32, d=8, h=h);
            }
            
            hull() {
                translate([8, -2, 0]) cube([2, 34, 1.8]);
                translate([12, 0, 0]) cube([1, 30, 1.8]);
            }
            
            // spacer
            translate([65-1.75, 0]) color("green") block(5.75, 4.75, 4+h, crad=1);
            translate([65-1.75, 30-4.75]) color("green") block(5.75, 4+h, 4, crad=1);
            translate([13.75, 0]) color("green") block(5.75, 4.75, 4+h, crad=1);
            translate([13.75, 30-4.75]) color("green") block(5.75, 4.75, 4+h, crad=1);
            
            translate([0, 34-2]) rotate([90, 0, 0]) linear_extrude(height=34) polygon([[0, 0], [10, 0], [4, 10], [0, 10]]);
        }
        
        // screw hole mount
        translate([10-1, -1+4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, -1+4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=6, d=6.7, h=10);
        translate([10-1, 1+30-4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=32, d=3.3, h=10);
        translate([10+2, 1+30-4.5, 5.5]) rotate([0, -90, 0]) cylinder($fn=6, d=6.7, h=10);
        
        // esp screw
        translate([65-(49-5)-1.5, 4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        translate([65-1.5, 4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        translate([65-1.5, 30-4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        translate([65-(49-5)-1.5, 30-4.5, -1]) cylinder($fn=32, d=2.5, h=10);
        
        // usb
        translate([09, 30/2-12/2, 1.8]) rotate([0, -90]) block(20, 12, 20);
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
