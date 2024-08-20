extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",openlevel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func openlevel():
	Manager.level = int(str(name))
	get_tree().change_scene_to_file("res://level_" + str(name) + ".tscn")
