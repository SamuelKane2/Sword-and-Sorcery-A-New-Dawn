extends Control

@onready var inventory: Control = %Inventory

func _ready():
	inventory.close()

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
			inventory.close()
		else: 
			inventory.open()

var isOpen: bool = false

func open():
	visible = true
	isOpen = true
	
func close():
	visible = false
	isOpen = false
	
