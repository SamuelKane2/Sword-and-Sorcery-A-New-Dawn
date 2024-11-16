extends Control

@onready var inventory: Control = %Inventory
@onready var Inventory: Inventory = preload("res://scenes/Inventory/Inventory Items/playerInventory.tres")
@onready var main_inventory: GridContainer = $Inventory/MainInventory

func _ready():
	inventory.close()
	update()

func update():
	for i in range(min(inventory.items.size(), main_inventory.get_children().size())):
		main_inventory.get_children()[i].update(inventory.items[i])

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
	
