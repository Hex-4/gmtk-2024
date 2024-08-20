extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var shape = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func activate():
	sprite.frame = 1
	shape.disabled = true
	
func deactivate():
	sprite.frame = 0
	shape.disabled = false
	


func _on_body_entered(body):
	if body.is_in_group("bigplayer") or body.is_in_group("smallplayer"):
		get_tree().reload_current_scene()
	elif body.is_in_group("block"):
		body.queue_free()
