
extends Node

var screen_size = OS.get_video_mode_size()

func _ready():

	set_process(true)
	set_process_input(true)

func _process(delta):
	screen_size = OS.get_video_mode_size()

	get_node("TextureFrame").set_size(screen_size)

	for i in range(5):
		get_node("credit_item"+str(i)).set_pos(Vector2(screen_size.x / 2 - get_node("credit_item"+str(i)).get_size().x, screen_size.y / 5 + (85 * i)))
		get_node("desc_item"+str(i)).set_pos(Vector2(screen_size.x / 2, screen_size.y / 5 + 34 + (85 * i)))

	get_node("back").set_pos(Vector2(screen_size.x / 2 - get_node("back").get_size().x, screen_size.y / 5 + 442))

	get_node("menu_selector").update()

func _input(event):

	if event.is_action_pressed("quit") or event.is_action_pressed("ui_accept"):
		get_node("/root/menu_variables").set_index(2)
		get_node("/root/scene_switch").goto_scene("res://Scenes/main_menu.scn")
