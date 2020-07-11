extends KinematicBody2D

const SPEED = 1500
const GRAVITY = 300
const UP = Vector2(0, -1)
const JUMP_SPEED = 5000

var motion = Vector2(0, 0)

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	

func animate():
	emit_signal("animate", motion)

	
	
func move():
	motion.x = 0
	if Input.is_action_pressed("left"):
		motion.x -= SPEED
	if Input.is_action_pressed("right"):
		motion.x += SPEED
		
	
func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
