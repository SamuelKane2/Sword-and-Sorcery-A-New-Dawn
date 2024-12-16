extends Control

@onready var inventoryNode: Control = %Inventory
@onready var inventory: Inventory = preload("res://scenes/Inventory/Inventory Items/Resources/playerInventory.tres")
@onready var ItemStackClass = preload("res://scenes/Inventory/itemsStack.tscn")
@onready var main_inventory: GridContainer = $Inventory/MainInventory
@onready var slots = $Inventory/MainInventory.get_children()

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventoryNode.isOpen:
			inventoryNode.close()
		else: 
			inventoryNode.open()

func _ready():
	inventory.updated.connect(update)
	connectSlots()
	update()
	
func connectSlots():
	for slot in slots:
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		var inventorySlot = inventory.slots[i]

		if !inventorySlot.item: continue
		
		var itemStack = slots.itemStack
		if !itemStack:
			itemStack = ItemStackClass.instantiate()
			slots[i].inster(itemStack)
		
			itemStack.inventorySlot = inventorySlot
			itemStack.update()

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
func onSlotClicked(slot):
	pass
