
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

# used to know if the mouse can be used to continue the story
var in_area = false

# booleans and counters for holding down to speed up and tapping to make
# message appears
var held_down = false
var held_down_timer = 0
var text_appear = false
var moving_next = false

# variables for the time so that it can be determined if the key was held
# or just tapped
var pressed_time = 0
var released_time = 0

func _ready():

	print(get_node("text").get_font("type_font.fnt"))

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
		moving_next = false
		if typewrite_time > typewrite_delay:
			typewrite_cursor += 1
			text.set_visible_characters(typewrite_cursor)
			text.set_text(typewrite_text)
			typewrite_time = 0
		else:
			typewrite_time += delta

	# end the typewrite
	if typewrite_text.length() <= typewrite_cursor:
		moving_next = true
		text_appear = true
		typewrite_time = 0
		typewrite_text = ""
		typewrite_cursor = -1
		typewrite_mode = false
		get_node("next/next_area").set_pos(Vector2(0, 0))
		get_node("next").set_percent_visible(1)
		get_node("menu_selector").change_draw(true)
		get_node("menu_selector").update()

func _input(event):

	var text = get_node("text")

	# if pressed the speed_up action button
	if event.is_action_pressed("speed_up"):
		# get the system time
		pressed_time = OS.get_unix_time()

		# speed up if held_down is true while holding down the button
		typewrite_delay = 0.005

	# if released the speed_up action button
	if event.is_action_released("speed_up"):
		# check how much time has passed in the system
		released_time = OS.get_unix_time()

		var elapsed_time = released_time - pressed_time

		# if small enough time frame, act as if it was tapped and make
		# entire message appear, else return typewrite_delay to original
		# speed
		if elapsed_time < 0.1 and !text_appear:
			typewrite_cursor = typewrite_text.length()
			text.set_visible_characters(typewrite_cursor)
			typewrite_delay = 0.05
		else:
			typewrite_delay = 0.05

	# if the next_story action is pressed and the text is all there
	if event.is_action_pressed("next_story") and text_appear:
		moving_next = false
		text_appear = false
		# increment the current line the story is in
		cur_story_line += 1
		# if it moves beyond the length of the array of current scenes story lines
		# then move to the next story scene and increment which part of the Overall
		# story it's at
		if cur_story_line == get_node("/root/story_variables").get_cur_scene_size():
			get_node("/root/story_variables").inc_cur_scene()
			get_node("/root/scene_switch").goto_scene("res://Scenes/Game/place.scn")
		else:
			# else, remake the text node so that centering works again
			var text_theme = text.get_theme()
			text.free()
			var new_text = Label.new()
			new_text.set_name("text")
			new_text.set_theme(text_theme)
			add_child(new_text)
			# reset all the typewriting things and move the area under the next button
			# so that the mouse can't click there early
			typewrite_mode = true
			typewrite_text = typewrite_story[cur_story_line]
			get_node("next/next_area").set_pos(Vector2(4000, 0))
			in_area = false
			get_node("next").set_percent_visible(0)
			get_node("menu_selector").change_draw(false)
			get_node("menu_selector").update()

	# if pressed quit, then go back to the main menu. Retain what part of the
	# story the player is at.
	if event.is_action_pressed("quit"):
		get_node("/root/menu_variables").set_index(0)
		get_node("/root/scene_switch").goto_scene("res://Scenes/main_menu.scn")

	# same as above except if the mouse clicks the next button
	if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and in_area:
		text_appear = false
		moving_next = false
		cur_story_line += 1
		if cur_story_line == get_node("/root/story_variables").get_cur_scene_size():
			get_node("/root/story_variables").inc_cur_scene()
			get_node("/root/scene_switch").goto_scene("res://Scenes/story.scn")
		else:
			var text_theme = text.get_theme()
			text.free()
			var new_text = Label.new()
			new_text.set_name("text")
			new_text.set_theme(text_theme)
			add_child(new_text)
			typewrite_mode = true
			typewrite_text = typewrite_story[cur_story_line]
			get_node("next/next_area").set_pos(Vector2(4000, 0))
			in_area = false
			get_node("next").set_percent_visible(0)
			get_node("menu_selector").change_draw(false)
			get_node("menu_selector").update()

func on_mouse_enter():
	in_area = true

func on_mouse_exit():
	in_area = false
