extends Node

var screen_size = OS.get_video_mode_size()

var in_area = false

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):
	screen_size = OS.get_video_mode_size()

	get_node("background").set_size(screen_size)

	get_node("pilot").set_pos(Vector2(screen_size.x - 76, screen_size.y - 17))

	get_node("menu_selector").update()

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and in_area:
		get_node("/root/scene_switch").goto_scene("res://Scenes/Game/route.scn")


func on_pilot_mouse_enter():
	get_node("/root/menu_variables").set_index(7)
	in_area = true

func on_mouse_exit():
	in_area = false
