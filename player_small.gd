extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var selected = false

var jump = preload("res://lil_jump.ogg")
var impact = preload("res://lil_impact.ogg")

var on_floor: bool:
	set(value):
		if on_floor == false and value == true:
			if not $AudioStreamPlayer.playing:
				$AudioStreamPlayer.stream = impact
				$AudioStreamPlayer.play()
		on_floor = value

func _physics_process(delta):
	
	if get_slide_collision_count():
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider().is_in_group("lilbutton") and rad_to_deg(collision.get_angle()) > -50 and rad_to_deg(collision.get_angle()) < 50:
				collision.get_collider().pressed = true
				print(rad_to_deg(collision.get_angle()))
			else:
				for e in get_tree().get_nodes_in_group("lilbutton"):
					e.pressed = false
	else:
		for e in get_tree().get_nodes_in_group("lilbutton"):
			e.pressed = false
	
	on_floor = is_on_floor()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and selected:
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer.stream = jump
		$AudioStreamPlayer.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and selected:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

