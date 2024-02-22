/// @description Movement

#region Controls
if (hascontrol)
{
    // Maximum speed
    var _maxspeed = 0.3; // Adjust this value to change maximum speed

    var _ud = keyboard_check(key_down) - keyboard_check(key_up);
    var _lr = keyboard_check(key_right) - keyboard_check(key_left);
}
else
{
    key_down = 0;
    key_up = 0;
    key_right = 0;
    key_left = 0;
}
#endregion

#region Movement

// Calculate direction towards mouse
dir = point_direction(x, y, mouse_x, mouse_y);

// Set speed based on controls
if (hascontrol)
{
    yspeed = _ud * _maxspeed;
    xspeed = _lr * _maxspeed;
}
else
{
    yspeed = 0;
    xspeed = 0;
}

// If speed is very low, set it to zero to prevent jittering
if (abs(xspeed) < 0.1) {
    xspeed = 0;
}
if (abs(yspeed) < 0.1) {
    yspeed = 0;
}

// Calculate next position
var _tx = x + xspeed;
var _ty = y + yspeed;

// Check collision with tilemap and adjust position if necessary
if (scr_tilemap_box_collision(col_map, bbox_left + xspeed, bbox_top, bbox_right + xspeed, bbox_bottom + yspeed)) {
    _tx = x;
}
if (scr_tilemap_box_collision(col_map, bbox_left, bbox_top + yspeed, bbox_right, bbox_bottom + yspeed)) {
    _ty = y;
}

#endregion

#region Finalise movement

// Update position
x = _tx;
y = _ty;

// If dead, display message and restart game
if (hp <= 0) {
    show_message("You died after senselessly killing " + string(obj_controller.killed_enemies) + " soldiers");
    game_restart();
}

#endregion
