
extends Control

func _draw():
	draw_rect(Rect2(get_node("/root/menu_variables").get_pos(), get_node("/root/menu_variables").get_size()), Color(250, 0, 0))


