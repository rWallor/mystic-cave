extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 1500
const GRAVITY = 300
const JUMP_SPEED = 3500
const UP = Vector2(0,-1)

func _physics_process(delta: float) -> void:
	apply_gravity()
	apply_jump()
	move()
	move_and_slide(motion,UP)

# Applyed the abbility to Jump
func apply_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED

# Add GRAVITY if the Player is not on Floor
func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0

# Function for the Playermovement
func move():
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("Left"):
		motion.x = SPEED
	else:
		motion.x = 0




