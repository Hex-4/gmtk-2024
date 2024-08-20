extends Area2D

@export var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta


func _on_body_entered(body):
	if body.is_in_group("bigplayer") or body.is_in_group("smallplayer"):
		get_tree().reload_current_scene()
	elif body.is_in_group("block"):
		body.queue_free()


func _on_timer_timeout():
	speed += 15
	
