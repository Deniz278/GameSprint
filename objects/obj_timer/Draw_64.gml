// Step Event (with formatted output)
timer += 1; // Increment the timer by 1 every step (assuming 60 FPS)

// Calculate time components
var hours = floor(timer / 3600);
var minutes = floor((timer mod 3600) / 60);
var seconds = timer mod 60;

// Create formatted time string
var time_string = string(hours) + ":" + string(minutes) + ":" + string(seconds);

// Draw the timer on the screen
draw_text(10, 30, "Timer: " + time_string);
