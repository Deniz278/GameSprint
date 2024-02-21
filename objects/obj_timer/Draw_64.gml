
draw_set_color(c_black); // Set the color for the timer text

// Calculate the time in seconds
var seconds = timer div room_speed;

// Convert time to a string for display
var time_string = string(seconds);

// Draw the timer text at position (20, 20) on the screen
draw_text(20, 20, "Time: " + time_string);
