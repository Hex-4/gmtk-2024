extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		if $Big.selected == true:
			$Big.selected = false
			$Small.selected = true
			$Small/PhantomCamera2D.priority = 3
		elif $Small.selected == true:
			$Small.selected = false
			$Big.selected = true
			$Small/PhantomCamera2D.priority = 0
			
