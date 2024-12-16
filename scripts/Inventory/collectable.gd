extends Node2D

class_name collect
@export var itemRes: InventoryItem

func collect(inventory: Inventory):
	print(inventory)
	inventory.insert(itemRes)
	queue_free()
