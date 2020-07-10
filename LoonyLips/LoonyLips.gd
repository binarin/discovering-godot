extends Control

#var template = [
#	{
#		"prompts": ["a name", "a noun", "adverb", "adjective"],
#		"story": "Once upon a time someone called %s ate a %s flavored sandwich which made him feel all %s inside. What a %s day!"
#	},
#	{
#		"story": "A big %s read a small %s book. He learned some %s things.",
#		"prompts": ["animal", "adjective", "adjective"],
#	},
#]

var current_story
var player_words = []

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	set_current_story()
	check_player_words_length()
	DisplayText.text = "Intro text\n\n" + DisplayText.text
	PlayerText.grab_focus()


func set_current_story():
	randomize()
	var stories = get_from_json("stories.json")
	current_story = stories[randi() % stories.size()]
#	var stories = $StoryBook.get_child_count()
#	var selected_story = randi() % stories
#	current_story = $StoryBook.get_child(selected_story)
#	current_story = template[randi() % template.size()]
	

func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data
	
	
func _on_PlayerText_text_entered(new_text):
	add_to_player_words()


func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

	
func add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	return player_words.size() == current_story.prompts.size()
	
	
func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()
			
			
func tell_story():
	DisplayText.text = current_story.story % player_words
	

func end_game():
	PlayerText.queue_free()
	tell_story()	
	$VBoxContainer/HBoxContainer/Label.text = "Again!"

func prompt_player():
	DisplayText.text = "May I have " + current_story.prompts[player_words.size()] + " please?"
