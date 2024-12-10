extends Node2D

const MAX_HEALTH = 20
var health = MAX_HEALTH



func update_health_ui():
	set_health_label()

func set_health_label() -> void:
	$HealthLabel.text = "Health: %" % health 
	##should allow the UI and this code to be set up toghther
	##Should allow for the UI to change when damage is taken

func _input(event: InputEvent) -> void: #need to change this to where it will recive actual damage
	if event.is_action_pressed("ui_accept"):
		damage()
	
func damage() -> void: 
	health -= 1 #makes it so you take damage
	if health < 0: 
		health = MAX_HEALTH
	update_health_ui() #updates the UI for what your health is
