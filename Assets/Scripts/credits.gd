
extends Node

var screen_size = OS.get_video_mode_size()

func _ready():

	set_process(true)
	set_process_input(true)

func _process(delta):
	screen_size = OS.get_video_mode_size()

	get_node("TextureFrame").set_size(screen_size)

	get_node("menu_selector").update()

func _input(event):
