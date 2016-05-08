
extends Node

var typewrite_mode = false

# how slow the typewriter is
# smaller is faster
var typewrite_delay = 0.05
var typewrite_time = 0
var typewrite_text = ""

# must start at -1 because the first character is needed
var typewrite_cursor = -1

var typewrite_story = []
var cur_story_line = 0

var screen_size = OS.get_video_mode_size()

func _ready():

	typewrite_mode = true
	typewrite_story = get_node("/root/story_variables").get_story()
	typewrite_text = typewrite_story[cur_story_line]

	get_node("next").set_percent_visible(0)
	get_node("menu_selector").change_draw(false)
	get_node("menu_selector").update()

	get_node("next").set_pos(Vector2(screen_size.x / 2 - get_node("next").get_size().x / 2, screen_size.y / 2 + 27))

	get_node("tips").set_pos(Vector2(screen_size.x / 2 - get_node("tips").get_size().x / 2, screen_size.y / 2 + 150))

	set_process_input(true)
	set_process(true)

func _process(delta):
	var text = get_node("text")

	get_node("text").set_pos(Vector2(screen_size.x / 2 - get_node("text").get_size().x / 2, screen_size.y / 2 - 27))
	get_node("next").set_pos(Vector2(screen_size.x / 2 - get_node("next").get_size().x / 2, screen_size.y / 2 + 27))

	# if typewriter is happening
	if typewrite_mode:
		if typewrite_time > typewrite_delay:
			typewrite_cursor += 1
			text.set_visible_characters(typewrite_cursor)
			text.set_text(typewrite_text)
			typewrite_time = 0
		else:
			typewrite_time += delta

	# end the typewrite
	if typewrite_text.length() <= typewrite_cursor:
		typewrite_time = 0
		typewrite_text = ""
		typewrite_cursor = -1
		typewrite_mode = false
		get_node("next").set_percent_visible(1)
		get_node("menu_selector").change_draw(true)
		get_node("menu_selector").update()

func _input(event):
	if event.is_action_pressed("next_story"):
		cur_story_line += 1
		if cur_story_line == get_node("/root/story_variables").get_cur_scene_size():
			get_node("/root/story_variables").inc_cur_scene()
			get_node("/root/scene_switch").goto_scene("res://Scenes/story.scn")
		else:
			typewrite_mode = true
			typewrite_text = typewrite_story[cur_story_line]
			get_node("next").set_percent_visible(0)
			get_node("menu_selector").change_draw(false)
			get_node("menu_selector").update()

	if event.is_action_pressed("speed_up"):
		typewrite_delay = 0.01

	if event.is_action_pressed("quit"):
		get_node("/root/menu_variables").set_index(0)
		get_node("/root/scene_switch").goto_scene("res://Scenes/main_menu.scn")
