extends Control

@export_file("*.json") var d_file 

var dialogue = []
var current_dialogue_id = 0

func _ready():
	start()
	
func start():
	dialogue = load_dialouge()
	
func load_dialogue():
	var file = FileAccess.open("res://Dialogue/NobleMan_dialogue.json")
