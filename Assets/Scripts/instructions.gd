
extends Node

var screen_size = OS.get_video_mode_size()

func _ready():

	set_process(true)
	set_process_input(true)

func _process(delta):
	screen_size = OS.get_video_mode_size()

	get_node("TextureFrame").set_size(screen_size)

	get_node("Planning").set_pos(Vector2(screen_size.x / 2 - get_node("Planning").get_size().x, screen_size.y / 5))
	get_node("Piloting").set_pos(Vector2(screen_size.x / 2 - get_node("Piloting").get_size().x, screen_size.y / 5 + 126))

	for i in range(2):
		get_node("Planning"+str(i+1)).set_pos(Vector2(screen_size.x / 2, screen_size.y / 5 + (42 * (i + 1))))

	for i in range(3):
		get_node("Piloting"+str(i+1)).set_pos(Vector2(screen_size.x / 2, screen_size.y / 5 + 126 + (42 * (i + 1))))

	get_node("Back").set_pos(Vector2(screen_size.x / 2 - get_node("Back").get_size().x, screen_size.y / 5 + 336))

	get_node("menu_selector").update()

func _input(event):
	if event.is_action_pressed("quit") or event.is_action_pressed("ui_accept"):
		get_node("/root/menu_variables").set_index(1)
		get_node("/root/scene_switch").goto_scene("res://Scenes/main_menu.scn")
