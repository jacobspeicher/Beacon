extends Node

var sizes = []
var pos = []
var button_value = []
var index = 0

var screen_size = OS.get_video_mode_size()

func _ready():
	sizes.push_back(Vector2(40, 13))
	sizes.push_back(Vector2(93, 13))
	sizes.push_back(Vector2(54, 13))
	sizes.push_back(Vector2(40, 13))
	
	pos.push_back(Vector2(screen_size.x / 2 - 203.5, screen_size.y / 2))
	pos.push_back(Vector2(screen_size.x / 2 - 103.5, screen_size.y / 2))
	pos.push_back(Vector2(screen_size.x / 2 + 49.5, screen_size.y / 2))
	pos.push_back(Vector2(screen_size.x / 2 + 163.5, screen_size.y / 2))
	
	button_value.push_back("story")
	button_value.push_back("instructions")
	button_value.push_back("credits")
	button_value.push_back("quit")
	
func get_size():
	return sizes[index]
	
func get_pos():
	return pos[index]
	
func get_button_value():
	return button_value[index]
	
func dec_index():
	if index > 0:
		index -= 1
	
func inc_index():
	if index < 3:
		index += 1