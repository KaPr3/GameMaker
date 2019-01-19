/// @description Physics

var rkey = keyboard_check(vk_right);
var lkey = keyboard_check(vk_left);
var ukey = keyboard_check(vk_up);

if (keyboard_check(ord("W"))) {global.grav = 1};
if (keyboard_check(ord("S"))) {global.grav = 2};
if (keyboard_check(ord("A"))) {global.grav = 3};
if (keyboard_check(ord("D"))) {global.grav = 4};

if (global.grav = 1){
//On earth
if (place_meeting(x, y+1,obj_solid )) {
    vspd=0;
//jump
    if (ukey) {
        vspd = -jspd;
    }
} else {
        //Gravity
        if (vspd < 10) {
        vspd += ygrav;
        }
}
}

if (global.grav = 2){
//On earth
if (place_meeting(x, y-1,obj_solid )) {
    vspd=0;
//jump
    if (ukey) {
        vspd = jspd;
    }
} else {
        //Gravity
        if (vspd > -10) {
        vspd -= ygrav;
        }
}
}

if (global.grav = 3){
//On earth
if (place_meeting(x-1,y,obj_solid )) {
    hspd=0;
//jump
    if (ukey) {
        hspd = jspd;
    }
} else {
        //Gravity
        if (hspd > -10) {
        hspd -= ygrav;
        }
}
}

if (global.grav = 4){
//On earth
if (place_meeting(x+1,y,obj_solid )) {
    hspd=0;
//jump
    if (ukey) {
        hspd = -jspd;
    }
} else {
        //Gravity
        if (hspd < 10) {
        hspd += ygrav;
        }
}
}

//Move
if (global.grav = 1){
    //Go right
    if (rkey) {
    hspd = spd;
    }
    
    //Go left
    if (lkey) {
    hspd = -spd;
    }
}  

if (global.grav = 2){
    //Go right
    if (rkey) {
    hspd = -spd;
    }
    
    //Go left
    if (lkey) {
    hspd = spd;
    }
}

if (global.grav = 3){
    //Go right
    if (rkey) {
    vspd = spd;
    }
    
    //Go left
    if (lkey) {
    vspd = -spd;
    }
}

if (global.grav = 4){
    //Go right
    if (rkey) {
    vspd = -spd;
    }
    
    //Go left
    if (lkey) {
    vspd = spd;
    }
}
 
if (global.grav = 1 or global.grav = 2){
//Don´t move!
if ((!rkey && !lkey) || (rkey && lkey)) {
hspd = 0
}
}
if (global.grav = 3 or global.grav = 4){
//Don´t move!
if ((!rkey && !lkey) || (rkey && lkey)) {
vspd = 0
}
}


//Horizontal colissions solid block
if (place_meeting(x+hspd, y, obj_solid )) {
    while(!place_meeting(x+sign(hspd), y, obj_solid)){
        x+= sign(hspd) ;
        }
        hspd =0;
}

//Move Horintally
x += hspd; 

//Vertical colissions solid block
if (place_meeting(x, y+vspd, obj_solid )) {
    while(!place_meeting(x, y+sign(vspd), obj_solid)){
        y+= sign(vspd) ;
        }
        vspd=0
}


//Move Vertically
y += vspd; 


if global.grav = 1
{
image_angle = 0;
camera_set_view_angle(view_camera[0], 0);
}

if global.grav = 2
{
camera_set_view_angle(view_camera[0], 180);
image_angle = 180;
}

if global.grav = 3
{
camera_set_view_angle(view_camera[0], 90);
image_angle = -90;
}

if global.grav = 4
{
camera_set_view_angle(view_camera[0], -90);
image_angle = 90;
}