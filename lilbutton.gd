extends StaticBody2D

var pressed = false:
	set(value):
		if not pressed and value:
			sprite.frame = 1
			$CollisionShape2D.disabled = true
			connected_to.activate()
		elif pressed and not value:
			sprite.frame = 0
			connected_to.deactivate()
			
		pressed = value

@onready var sprite = $AnimatedSprite2D

@export var connected_to: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressed:
		connected_to.activate()
		



	
