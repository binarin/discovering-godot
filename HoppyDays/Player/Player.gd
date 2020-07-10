extends KinematicBody2D

const SPEED = 500
var motion = Vector2(0, 0)

func _physics_process(delta):
	motion.x = 0
	if Input.is_action_pressed("left"):
		motion.x -= SPEED
	if Input.is_action_pressed("right"):
		motion.x += SPEED
		
	move_and_slide(motion)
