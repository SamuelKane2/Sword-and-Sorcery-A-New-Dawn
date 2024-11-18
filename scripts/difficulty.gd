extends Control



func _on_easy_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_medium_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_hard_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
