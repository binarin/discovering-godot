extends AnimatedSprite

func _on_Player_animate(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x != 0:
		set_flip_h(motion.x < 0)
		play("walk")
	else:
		play("idle")
