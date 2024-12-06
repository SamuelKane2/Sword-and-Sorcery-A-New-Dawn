extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Difficulty.tscn")
	print("start")

func _on_quit_button_pressed():
	get_tree().quit()
	print("quit")

const  MAX_HEALTH = 20
var health = MAX_HEALTH
