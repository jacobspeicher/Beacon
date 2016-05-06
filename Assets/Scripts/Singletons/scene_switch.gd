extends Node

var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_scene(var path):
	
	# deffer the load to a time when there is no
	# code from previous scene running
	call_deferred("_deferred_goto", path)
	
func _deffered_goto(var path):
	
	# free the current scene
	current_scene.free()
	
	# load the scene
	var s = ResourceLoader.load(path)
	
	# instance the new scene
	current_scene = s.instance()
	
	# add it to active scene as child of root
	get_tree().get_root().add_child(current_scene)
	
	# makes it compatibal with SceneTree.change_scene if wanted, so yah sure why not
	#get_tree().set_current_scene(current_scene)