extends Area2D

var smallfinished = false
var bigfinished = false

@export var result_label: RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_exited(body):
	if body.is_in_group("smallplayer"):
		smallfinished = true
	elif body.is_in_group("bigplayer"):
		bigfinished = true
	if smallfinished and bigfinished:
		result_label.text = "[wave amp=50.0 freq=5.0 connected=1][rainbow freq=1.0 sat=0.8 val=0.8]WIN![/rainbow][/wave]"
		result_label.show()
		$Timer.start()
		


func _on_timer_timeout():
	Manager.level += 1
	if Manager.level < 7:
		get_tree().change_scene_to_file("res://level_" + str(Manager.level) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://select.tscn")
