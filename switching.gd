extends Node2D

@onready var big = $Big
@onready var small = $Small

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		if big.selected == true:
			big.selected = false
			small.selected = true
			$Small/PhantomCamera2D.priority = 3
		if small.selected == true:
			small.selected = false
			big.selected = true
			
