extends KinematicBody2D

var velocity = Vector2.ZERO

func _ready():
	print("Hello world")

func _physics_process(delta):
	apply_gravity()
	
	var input = Vector2.ZERO
	
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0:
		apply_friction()
	else:
		apply_acceleration(input.x)
		
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -120
		
	velocity = move_and_slide(velocity)

func apply_gravity():
	velocity.y += 4
	
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, 20)
	
func apply_acceleration(input_x):
	velocity.x = move_toward(velocity.x, 50 * input_x, 20)
	
