extends Control

@onready var inventory: Control = %Inventory
@onready var inventoryResource: Inventory = preload("res://scenes/Inventory/Inventory Items/playerInventory.tres")
@onready var main_inventory: GridContainer = $Inventory/MainInventory
# I have no idea, but this variable doesn't wanna work. So instead I have to do "main_inventory.get_children()" even single time. #
#                   \/ 
#var slots = main_inventory.get_children()

func _ready():
	connectSlots()
	inventory.close()
	update()

func update():
	for i in range(min(inventoryResource.items.size(), main_inventory.get_children().size())):
		main_inventory.get_children()[i].update(inventoryResource.items[i])

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
	get_tree().paused = true
	
func close():
	visible = false
	isOpen = false
	get_tree().paused = false

# Moving items within the inventory

func connectSlots():
	for slot in main_inventory.get_children():
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)
		
func onSlotClicked(slot):
	pass
