extends CanvasLayer

func lives(life_count):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(life_count)

func coins(coin_count):
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coin_count)
