extends Node

var pos = []
var end_pos = []
var color = []

var button_value = []
var button_selector_index = []

var index = 0

var screen_size = OS.get_video_mode_size()

func _ready():

	for i in range(4):
		color.push_back(Color(255, 253, 0))
	color.push_back(Color(255, 255, 255))
	color.push_back(Color(255, 255, 255))
	color.push_back(Color(255, 255, 255))

	pos.push_back(Vector2(screen_size.x / 2 - 303, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 - 203, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 15, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 152, screen_size.y / 2 + 17))
	pos.push_back(Vector2(0, 0))
	pos.push_back(Vector2(screen_size.x / 4.5 - 70, screen_size.y / 2 + 187))

	end_pos.push_back(Vector2(screen_size.x / 2 - 233, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 - 15, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 127, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 210, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(0, 0))
	end_pos.push_back(Vector2(screen_size.x / 4.5, screen_size.y / 2 + 187))

	button_value.push_back("story")
	button_value.push_back("instructions")
	button_value.push_back("credits")
	button_value.push_back("quit")

	# which index of pos and end_pos to use for the story parts
	button_selector_index.push_back(4)
	# which index of pos and end_pos to use for the instruction menu back button
	button_selector_index.push_back(5)
	# which index of pos and end_pos to use for the credits menu back button
	button_selector_index.push_back(6)

	set_process(true)

func _process(delta):

	screen_size = OS.get_video_mode_size()

	pos.clear()
	end_pos.clear()

	pos.push_back(Vector2(screen_size.x / 2 - 303, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 - 203, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 15, screen_size.y / 2 + 17))
	pos.push_back(Vector2(screen_size.x / 2 + 152, screen_size.y / 2 + 17))
	pos.push_back(Vector2(0, 0))
	pos.push_back(Vector2(screen_size.x / 4.5 - 70, screen_size.y / 2 + 187))

	end_pos.push_back(Vector2(screen_size.x / 2 - 233, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 - 15, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 127, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(screen_size.x / 2 + 210, screen_size.y / 2 + 17))
	end_pos.push_back(Vector2(0, 0))
	end_pos.push_back(Vector2(screen_size.x / 4.5, screen_size.y / 2 + 187))

func get_start_pos():
	return pos[index]

func get_end_pos():
	return end_pos[index]

func get_color():
	return color[index]

func get_button_value():
	return button_value[index]

func get_button_selector_index():
	return button_selector_index[index]

func set_index(var i):
	index = i

func dec_index():
	if index > 0:
		index -= 1

func inc_index():
	if index < 3:
		index += 1
