extends Node2D


var lives = 3
var coins = 0
var target_number_of_coins = 10

func _ready():
	add_to_group("Gamestate")
	get_tree().call_group("GUI", "lives", lives)
	get_tree().call_group("GUI", coins, coins)

func hurt():
	lives -= 1
	$Player.hurt()
	get_tree().call_group("GUI", "lives", lives)
	# if lives < 0 then end game
	if lives < 0:
		end_game()
				
func add_coin():
	coins += 1
	get_tree().call_group("GUI", "coins", coins)	
	var multiple_of_coins = (coins % target_number_of_coins) == 0
	if multiple_of_coins:
		lives += 1			
		get_tree().call_group("GUI", "lives", lives)
				
func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
