
extends Control

func _draw():
	# change to a line beneath the text
	draw_line(get_node("/root/menu_variables").get_start_pos(), get_node("/root/menu_variables").get_end_pos(), get_node("/root/menu_variables").get_color(), 2)
