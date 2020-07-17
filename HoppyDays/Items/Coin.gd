extends Node2D

var taken = false

func _on_Area2D_body_entered(body):
	if taken:
		return
	taken = true
	$AnimationPlayer.play("die")
	$AudioStreamPlayer.play()
	get_tree().call_group("Gamestate", "add_coin")

func die():
	queue_free()
