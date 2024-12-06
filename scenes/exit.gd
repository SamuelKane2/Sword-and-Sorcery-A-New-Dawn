extends Area2D

var game_scene_path : String = "res://scenes/game.tsccn"

func _ready():
	self.body_entered.connect(_on_body_entered)
	add_to_group("player")
	
func _on_body_entered(body : Node) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/game.tscn")

func _on_area_entered(area: Area2D):
	get_tree().change_scene("res://target_scene.tscn")
