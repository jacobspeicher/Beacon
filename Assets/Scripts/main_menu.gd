
extends Node

var screen_size = OS.get_video_mode_size()
var next_scene = ""

func _ready():

	set_process_input(true)
	set_process(true)

func _process(delta):
	screen_size = OS.get_video_mode_size()

	get_node("Background").set_size(Vector2(screen_size.x, screen_size.y))

	get_node("play").set_pos(Vector2(screen_size.x / 2 - 303, screen_size.y / 2))
	get_node("instruct").set_pos(Vector2(screen_size.x / 2 - 203, screen_size.y / 2))
	get_node("credits").set_pos(Vector2(screen_size.x / 2 + 15, screen_size.y / 2))
	get_node("quit").set_pos(Vector2(screen_size.x / 2 + 152, screen_size.y / 2 ))

	get_node("beacon").set_pos(Vector2(screen_size.x / 2 - get_node("beacon").get_size().x / 2, screen_size.y / 4))

	get_node("menu_selector").update()


func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

	if event.is_action_released("ui_left"):
		get_node("/root/menu_variables").dec_index()
		get_node("menu_selector").update()
	if event.is_action_released("ui_right"):
		get_node("/root/menu_variables").inc_index()
		get_node("menu_selector").update()

	if event.is_action_pressed("ui_accept"):
		next_scene = get_node("/root/menu_variables").get_button_value()
		if(next_scene != "quit"):
			get_node("/root/menu_variables").set_index(get_node("/root/menu_variables").get_button_selector_index())
			get_node("/root/scene_switch").goto_scene("res://Scenes/" + next_scene + ".scn")
		else:
			get_tree().quit()
