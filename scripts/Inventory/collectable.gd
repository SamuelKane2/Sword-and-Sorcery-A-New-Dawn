extends Area2D

class_name collect

@export var itemRes: InventoryItem

func collect():
	#inventory.insert(itemRes)
	queue_free()
