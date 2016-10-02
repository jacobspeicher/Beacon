
extends Control

var draw = true

func _draw():
	# draws a line of a certain color from certain starting and ending points that correspond to each scene
	if draw:
		draw_line(get_node("/root/menu_variables").get_start_pos(), get_node("/root/menu_variables").get_end_pos(), get_node("/root/menu_variables").get_color(), 2)


func change_draw(var val):
	draw = val
