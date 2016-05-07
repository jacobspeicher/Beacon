extends Node

var sizes = []
var pos = []
var end_pos = []
var button_value = []
var index = 0

var screen_size = OS.get_video_mode_size()

func _ready():

	sizes.push_back(Vector2(40, 13))
	sizes.push_back(Vector2(93, 13))
	sizes.push_back(Vector2(54, 13))
	sizes.push_back(Vector2(40, 13))

	pos.push_back(Vector2(screen_size.x / 2 - 303, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 - 203, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 15, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 152, screen_size.y / 2 + 17))

	end_pos.push_back(Vector2(screen_size.x / 2 - 233, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 - 15, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 127, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 210, screen_size.y / 2 + 17))

	button_value.push_back("story")
	button_value.push_back("instructions")
	button_value.push_back("credits")
	button_value.push_back("quit")

	set_process(true)

func _process(delta):

	screen_size = OS.get_video_mode_size()

	sizes.clear()
	pos.clear()
	end_pos.clear()

	sizes.push_back(Vector2(40, 13))
	sizes.push_back(Vector2(93, 13))
	sizes.push_back(Vector2(54, 13))
	sizes.push_back(Vector2(40, 13))

	pos.push_back(Vector2(screen_size.x / 2 - 303, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 - 203, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 15, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 152, screen_size.y / 2 + 17))

	end_pos.push_back(Vector2(screen_size.x / 2 - 233, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 - 15, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 127, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 210, screen_size.y / 2 + 17))

func get_size():
	return sizes[index]

func get_start_pos():
	return pos[index]

func get_end_pos():
	return end_pos[index]

func get_button_value():
	return button_value[index]

func dec_index():
	if index > 0:
		index -= 1

func inc_index():
	if index < 3:
		index += 1
